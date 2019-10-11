using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wallboard;

public partial class Secured_Locations_Admin_SetTargets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataAccessLayer dal = new DataAccessLayer();

            gvProductTargeting.DataSource = dal.ExecuteDataTable("SELECT * FROM Products");
            gvProductTargeting.DataBind();

            ddlUser.DataSource = Membership.GetAllUsers();
            ddlUser.DataBind();
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Secured_Locations/Admin/Default.aspx");
    }
    //--------ProductTargeting--------
    #region ProductTargeting
    protected void btnSetTargets_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        foreach (GridViewRow row in gvProductTargeting.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtCount = (TextBox)row.FindControl("txtCount");
                int count = 0;

                if (int.TryParse(txtCount.Text, out count))
                {
                    int ID = int.Parse(((HiddenField)row.FindControl("hdnfldProductID")).Value);
                    bool hasFocus = ((CheckBox)row.Cells[0].FindControl("chkbxFocus")).Checked;

                    dal.AddParameter("@ProductID", ID, DbType.Int32);
                    dal.AddParameter("@Count", count, DbType.Int32);
                    dal.AddParameter("@Focus", hasFocus, DbType.Boolean);
                    dal.ExecuteNonQuery("EXEC dbo.SetProductTargets @ProductID, @Count, @Focus");
                    dal.ClearParameters();
                }
            }
        }

        Response.Redirect("SetTargets.aspx");
    }
    #endregion

    //--------User targeting--------
    #region User targeting

    protected void ddlUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlUser.SelectedIndex != 0)
        {
            DataAccessLayer dal = new DataAccessLayer();
            dal.AddParameter("@UserID", ddlUser.SelectedValue, DbType.Guid);
            gvUserTargeting.DataSource = dal.ExecuteDataTable("EXEC dbo.GetUserTargets @UserID");
            dal.ClearParameters();
            gvUserTargeting.DataBind();
            btnSetUserTargeting.Visible = true;
        }
        else
        {
            gvUserTargeting.DataSource = null;
            gvUserTargeting.DataBind();
            btnSetUserTargeting.Visible = false;
        }
    }

    protected void btnSetUserTargeting_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        foreach (GridViewRow row in gvUserTargeting.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtCount = (TextBox)row.FindControl("txtCount");
                int count = 0;

                if (int.TryParse(txtCount.Text, out count))
                {
                    int ID = int.Parse(((HiddenField)row.FindControl("hdnfldProductID")).Value);

                    dal.AddParameter("@UserID", ddlUser.SelectedValue, DbType.Guid);
                    dal.AddParameter("@ProductID", ID, DbType.Int32);
                    dal.AddParameter("@Count", count, DbType.Int32);
                    dal.ExecuteNonQuery("EXEC dbo.SetUserTargets @UserID, @ProductID, @Count");
                    dal.ClearParameters();
                }
            }
        }

        Response.Redirect("SetTargets.aspx");
    }
    #endregion
    protected void gvProductTargeting_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox chkbxFocus = ((CheckBox)e.Row.Cells[0].FindControl("chkbxFocus"));

            string strScript = "uncheckOthers(" + chkbxFocus.ClientID + ");";
            chkbxFocus.Attributes.Add("onclick", strScript);
        }
    }
}