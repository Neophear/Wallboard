using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wallboard;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Brug kun følgende kode hvis databasen er clearet. Dvs. brugere og roller er slettet:
        //Membership.CreateUser("Jack", "test1234", "Jack@telenor.dk");
        //Roles.CreateRole("Admin");
        //Roles.AddUserToRole("Jack", "Admin");
    }
    
    protected void btnAdminMenu_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Secured_Locations/Admin/");
    }
}
