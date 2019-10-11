using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wallboard;

public partial class Secured_Locations_Admin_UserManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Visible = false;
        if (!IsPostBack)
        {
            MembershipUserCollection allUsers = Membership.GetAllUsers();
            MembershipUserCollection allUsersWithoutCurrent = Membership.GetAllUsers();
            allUsersWithoutCurrent.Remove(User.Identity.Name);
            
            grdvwManageUsers.DataSource = allUsers;
            grdvwManageUsers.DataBind();

            ddlChangePasswordUser.DataSource = allUsers;
            ddlChangePasswordUser.DataBind();

            ddlDeleteUser.DataSource = allUsersWithoutCurrent;
            ddlDeleteUser.DataBind();

            grdvwManageUsers.FooterRow.Cells[0].ColumnSpan=3;
            grdvwManageUsers.FooterRow.Cells.RemoveAt(1);
            grdvwManageUsers.FooterRow.Cells.RemoveAt(1);
        }
    }

    protected void grdvwManageUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            string username = DataBinder.Eval(e.Row.DataItem, "Username").ToString();
            CheckBox chkbxAdmin = ((CheckBox)e.Row.FindControl("chkbxAdmin"));
            CheckBox chkbxOnline = ((CheckBox)e.Row.FindControl("chkbxOnline"));

            if (User.Identity.Name == username)
            {
                chkbxAdmin.Enabled = false;
            }

            DataAccessLayer dal = new DataAccessLayer();

            dal.AddParameter("@UserID", Membership.GetUser(username).ProviderUserKey, System.Data.DbType.Guid);
            object objOnline = dal.ExecuteScalar("SELECT [Online] FROM [OnlineUsers] WHERE [UserRefID] = @UserID");
            dal.ClearParameters();
            bool isOnline = (objOnline != null && (bool)objOnline != false);

            chkbxOnline.Checked = isOnline;
            chkbxAdmin.Checked = Roles.IsUserInRole(username, "Admin");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        foreach (GridViewRow row in grdvwManageUsers.Rows)
        {
            string username = ((Label)row.FindControl("lblUsername")).Text;
            CheckBox chkbxOnline = ((CheckBox)row.FindControl("chkbxOnline"));
            CheckBox chkbxAdmin = ((CheckBox)row.FindControl("chkbxAdmin"));
            
            dal.AddParameter("@UserID", Membership.GetUser(username).ProviderUserKey, System.Data.DbType.Guid);
            dal.AddParameter("@Status", chkbxOnline.Checked, System.Data.DbType.Boolean);
            dal.ExecuteNonQuery("EXEC dbo.UpdateOnline @UserID, @Status");
            dal.ClearParameters();

            UpdateUserAdmin(username, chkbxAdmin.Checked);

            lblMsg.Text = "Brugere blev opdateret.";
            lblMsg.Visible = true;
        }
    }

    private void UpdateUserAdmin(string username, bool setAdmin)
    {
        if (Roles.IsUserInRole(username, "Admin") && !setAdmin)
            Roles.RemoveUserFromRole(username, "Admin");
        else if (!Roles.IsUserInRole(username, "Admin") && setAdmin)
            Roles.AddUserToRole(username, "Admin");
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser(ddlChangePasswordUser.SelectedValue);

        if (txtPassword.Text != txtPassword2.Text)
        {
            ChangePasswordMessage("Begge passwords skal være ens", true);
        }
        else
        {
            if (txtPassword.Text.Length < 6)
            {
                ChangePasswordMessage("Password skal være minimum 6 tegn", true);
            }
            else
            {
                bool passwordChanged = user.ChangePassword(user.ResetPassword(), txtPassword.Text);

                if (passwordChanged)
                {
                    ChangePasswordMessage("Password ændret", false);

                    txtPassword.Text = String.Empty;
                    txtPassword2.Text = String.Empty;
                }
                else
                {
                    ChangePasswordMessage("Der skete en fejl. Prøv igen", true);
                }
            }
        }
    }

    public void ChangePasswordMessage(string message, bool error)
    {
        if (error)
            lblPasswordMsg.ForeColor = System.Drawing.Color.Red;
        else
            lblPasswordMsg.ForeColor = System.Drawing.Color.Empty;

        lblPasswordMsg.Text = message;
        lblPasswordMsg.Visible = true;
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Secured_Locations/Admin/");
    }
    protected void cuwCreateUser_CreatingUser(object sender, LoginCancelEventArgs e)
    {
        cuwCreateUser.Email = cuwCreateUser.UserName + "@telenor.dk";
    }
    protected void cuwCreateUser_CreatedUser(object sender, EventArgs e)
    {
        Response.Redirect("UserManagement.aspx");
    }
    protected void btnDeleteUser_Click(object sender, EventArgs e)
    {
        Membership.DeleteUser(ddlDeleteUser.SelectedItem.Text);

        DataAccessLayer dal = new DataAccessLayer();
        dal.AddParameter("@UserID", ddlDeleteUser.SelectedValue, System.Data.DbType.Guid);
        dal.ExecuteNonQuery("EXEC dbo.DeleteUser @UserID");
        dal.ClearParameters();

        Response.Redirect("UserManagement.aspx");
    }
}