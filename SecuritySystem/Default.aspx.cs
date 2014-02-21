using System;
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
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page 
{
    Connection obj = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string user = TextBox1.Text.Replace("'", "");
        string pass = TextBox2.Text.Replace("'", "");

        string str = "select * from AdminLogins where AdminUser= '" + user + "' and AdminPass ='" + pass + "' ";

        obj.con.Open();
        obj.cmd.Connection = obj.con;
        obj.cmd.CommandText = str;
        obj.dr = obj.cmd.ExecuteReader();
        if (obj.dr.Read())
        {
            Session["id"] = obj.dr["id"].ToString();
            Session["temp"] = "1";
            Session["username"] = obj.dr["AdminUser"].ToString();
            Response.Redirect("Home.aspx");
        }
        else
        {
            Label1.Text = "Invalid User! Try Again";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        bool find = false;
        if (TextBox1.Text == "")
        {
            Label1.Text = "Enter username";
        }
        else
        {
            string str = "select AdminUser from AdminLogins where AdminUser= '" + TextBox1.Text + "'";

            obj.con.Open();
            obj.cmd.Connection = obj.con;
            obj.cmd.CommandText = str;
            obj.dr = obj.cmd.ExecuteReader();
            if (obj.dr.Read())
            {
                find = true;
                obj.con.Close();
            }
            else
            {
                Label1.Text = "Enter a valid username";
            }
            if (find == true)
            {

                string email = "", usr = "", pass = "";
                obj.str = "select Email,AdminUser,AdminPass from AdminLogin where AdminUser='" + TextBox1.Text + "'";
                obj.con.Open();
                obj.cmd.Connection = obj.con;
                obj.cmd.CommandText = obj.str;
                obj.dr = obj.cmd.ExecuteReader();
                if (obj.dr.Read())
                {
                    email = obj.dr["Email"].ToString();
                    usr = obj.dr["AdminUser"].ToString();
                    pass = obj.dr["AdminPass"].ToString();
                }
                SmtpClient smtp = new SmtpClient();
                string bdy = "Dear User,<br/>" +
                    "Your password is: " + pass;
                MailMessage msg = new MailMessage("urusikhan@gmail.com", email, "Your Password", bdy);
                msg.IsBodyHtml = true;
                smtp.Credentials = new System.Net.NetworkCredential("urusikhan@gmail.com", "dreaminghi!!");
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Send(msg);
                Label1.Text = "Password has been mailed to you";
            }

        }
    }
}
