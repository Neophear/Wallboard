using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wallboard;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lgnMain_LoggedIn(object sender, EventArgs e)
    {
        string username = ((Login)sender).UserName;

        if (Roles.IsUserInRole(username, "Admin"))
            Response.Redirect("~/Secured_Locations/Admin/");
        else
        {
            DataAccessLayer dal = new DataAccessLayer();

            dal.AddParameter("@UserID", Membership.GetUser(username).ProviderUserKey, System.Data.DbType.Guid);
            dal.ExecuteNonQuery("EXEC dbo.[UpdateOnline] @UserID, 1");
            dal.ClearParameters();

            Response.Redirect("~/Secured_Locations/User/");
        }
    }
}