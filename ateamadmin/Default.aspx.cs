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

public partial class _Default : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["temp"] != null && Session["temp"].ToString() == "1")
        {
            Response.Redirect("dashboard.aspx");
        }
        else
        {
        }
    }
    protected void btnLog_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && TextBox2.Text != "")
        {
            bool check = obj.getdata("SELECT * FROM [adminmaster] WHERE [username] = '"+ TextBox1.Text +"'  AND [password]='"+ TextBox2.Text +"'");
            if (check == true)
            {
                Session["temp"] = 1;
                Session["id"] = TextBox1.Text;
                Session["adminid"] = obj.dr["ID"].ToString();
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                lblError.Text = "This are not valid username and password";
            }
        }
        else
        {
            lblError.Text = "Please fill all the field";
        }
    }
}
