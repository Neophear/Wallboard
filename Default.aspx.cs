using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wallboard;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void gvTargets_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[1].Visible = false;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            DataAccessLayer dal = new DataAccessLayer();

            object objFocus = dal.ExecuteScalar("SELECT [Name] FROM Products WHERE IsFocus = 1");

            if (objFocus != null)
            {
                for (int i = 2; i < e.Row.Cells.Count; i++)
                {
                    if (e.Row.Cells[i].Text == objFocus.ToString())
                        e.Row.Cells[i].CssClass = "focus";
                }
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            for (int i = 2; i < e.Row.Cells.Count; i++)
            {
                e.Row.Cells[i].CssClass = "level" + Utilities.ConvertFractionToLevel(e.Row.Cells[i].Text);
            }
        }
    }
    protected void btnUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Secured_Locations/User/");
    }
}
