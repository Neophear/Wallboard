using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wallboard;


public partial class Secured_Locations_Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnTargetset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Secured_Locations/Admin/SetTargets.aspx");
    }
    protected void btnUserManagement_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Secured_Locations/Admin/UserManagement.aspx");
    }
    protected void btnProductManagement_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Secured_Locations/Admin/ProductManagement.aspx");
    }
    protected void btnResetTargets_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExecuteNonQuery("UPDATE [OnlineUsers] SET [Online] = 0;DELETE FROM [UserTargets];UPDATE [Products] SET [TargetCount] = 0, [IsFocus] = 0");
        btnResetTargets.Enabled = false;
    }
    protected void btnWallboard_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/");
    }
}