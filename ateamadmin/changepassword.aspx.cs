using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class css_changepassword : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl list = (HtmlGenericControl)Page.Master.FindControl("liMisc");
        HtmlGenericControl listchild = (HtmlGenericControl)Page.Master.FindControl("liCpass");
        list.Attributes.Add("class", "open");
        list.Attributes.Add("class", "active mainlis");
        listchild.Attributes.Add("class", "active");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Page.Validate("A");
        if (Page.IsValid)
        {
            bool found = obj.chkexistance("SELECT * FROM [adminmaster] WHERE [password] = '"+ TextBox1.Text +"' AND [ID] = "+ dboperations.adminid +" ");
            if (found == true)
            {
                obj.executeQueries("UPDATE [adminmaster] SET [password] = '" + TextBox2.Text + "' WHERE [ID] = '" + dboperations.adminid + "' ");
                labelMsg.Attributes.Add("class", "alert alert-success myspanerror");
                labelMsg.Text = "Password changed successfully.";
                
            }
            else
            {
                labelMsg.Attributes.Add("class", "alert alert-danger myspanerror");
                labelMsg.Text = "Old Password Did not match! Try Again.";
                
            }
        }
        else
        {
        }
    }
}
