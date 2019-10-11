using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wallboard;

public partial class Secured_Locations_User_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        sdsProducts.SelectParameters["UserID"].DefaultValue = Membership.GetUser().ProviderUserKey.ToString();
    }
    protected void btnDown_Click(object sender, EventArgs e)
    {
        Button btnDown = (Button)sender;

        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@UserID", Membership.GetUser().ProviderUserKey, System.Data.DbType.Guid);
        dal.AddParameter("@ProductID", btnDown.CommandArgument, System.Data.DbType.Int32);
        dal.ExecuteNonQuery("EXEC dbo.[UpdateUserProductSold] @UserID, @ProductID, -1");
        dal.ClearParameters();

        gvProducts.DataBind();
    }
    protected void btnUp_Click(object sender, EventArgs e)
    {
        Button btnUp = (Button)sender;

        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@UserID", Membership.GetUser().ProviderUserKey, System.Data.DbType.Guid);
        dal.AddParameter("@ProductID", btnUp.CommandArgument, System.Data.DbType.Int32);
        dal.ExecuteNonQuery("EXEC dbo.[UpdateUserProductSold] @UserID, @ProductID, 1");
        dal.ClearParameters();

        gvProducts.DataBind();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        gvProducts.DataBind();
    }
    protected void btnWallboard_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/");
    }
}