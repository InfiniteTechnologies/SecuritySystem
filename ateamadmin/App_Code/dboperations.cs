using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;

/// <summary>
/// Summary description for dboperations
/// </summary>
public class dboperations
{
    public SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ateamdbConnectionString"].ToString());
    public SqlCommand cmd = new SqlCommand();
    public SqlDataReader dr ;
    public SqlDataAdapter adp = new SqlDataAdapter();
    public DataSet ds = new DataSet();
    public static int adminid = 1; //only for sometime to maintain log
    public void connect()
    {
        if(conn.State==ConnectionState.Open)
        {
            conn.Close();
        }
        conn.Open();
    }
    public void executeQueries(string query)
    {
        connect();
        cmd.Connection = conn ;
        cmd.CommandText = query ; 
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public bool chkexistance(string qry)
    {
        bool find = false;
        try
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = qry;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                find = true;
            }
            else
            {
                find = false;
            }
            conn.Close();
            return find;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    public bool getdata(string query)
    {
        try
        {
            connect();
            cmd.Connection = conn;
            cmd.CommandText = query;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {

                return true;
            }
        }
        catch (Exception ex)
        {
            return false;
        }
        return false;
    }
    public dboperations()
	{
		//
		// TODO: Add constructor logic here
		//

	}
    public string totalno(string query)
    {
        try
        {
            connect();
            cmd.Connection = conn;
            cmd.CommandText = query;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {

                return dr["count"].ToString();
            }
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }
        return "";
    }
    public void sendMail(string email, string subject, string message)
    {
        string sbody = "";
        //sbody = "<div id='wrapperdiv'style='width: 100%'><center><table cellpadding='0' cellspacing='0' width='44%' style='background-color: #cccccc'><tr><td align='center'><center><table cellpadding='0' cellspacing='0' style='margin-top: 10px'><tr><td align='left' style='background: url("+ StringConstant.pageurl+"images/EmailHeader.png)no-repeat; width: 670px;height: 152px;'><img src='"+ StringConstant.pageurl +"images/logo.png' width='168px' height='65px' alt='Foupsy' style='margin-left: 20px;margin-top: 30px' /></td></tr><tr><td align='center' valign='top'><center><table cellpadding='0' cellspacing='0' width='623px'><tr><td align='left' style='background: url("+ StringConstant.pageurl +"Images/EmailContainerHeader.png) no-repeat;width: 623px; height: 79px; font-size: 16px; font-family: Calibri'><span style='margin-left: 40px'>Dear</span></td></tr><tr><td align='center' style='padding: 0 30px 0 30px; background: #fff;'><hr /></td></tr><tr><td style='background: #fff;' id='container'></td></tr></table></center></td></tr></table></center></td></tr><tr><td style='height: 10'>"+message+"</td></tr><tr><td style='height: 8;background-color:white;'></td></tr><tr><td align='center' style='background: #999999; height: 109px; font-size: 20px; font-family: Calibri;width: 44%'<center><table cellpadding='0' cellspacing='0' width='96%' style='height: 109px'><tr><td align='center' style='width: 31%; vertical-align: top; padding-top: 18px;'><a href='#' style='text-decoration: none; color: #333333;'>Contact Email-Id</a></td><td style='width: 3; height: 77'><img src='"+ StringConstant.pageurl +"images/EmailSep.png' width='3' height='77' alt='Foup' /></td><td align='center' style='vertical-align: top; padding-top: 18px;'><a href='#' style='text-decoration: none; color: #333333;'>Pnone No.</a></td><td style='width: 3; height: 77'><img src='images/EmailSep.png' width='3' height='77' alt='Foup' /></td><td align='center' style='width: 31%;vertical-align: top;'><center><table cellpadding='0' cellspacing='0' width='70%' style='height: 90%'></table</center></td><td align='center' style='width: 31%;vertical-align: top; padding-top: 18px;'><center><table cellpadding='0' cellspacing='0' width='70%' style='height: 90%'><tr><td align='center'><a href='#' style='text-decoration: none; color: #333333;'>Unsubscribe</a></td></tr><tr><td align='center' ><a href='#' style='text-decoration: none; color: #333333;'>Chat</a></td></tr></table></center></td></tr></table></center></td></tr></table></center></div>";
        //sbody = "<div style='background-image:url(" + StringConstant.pageurl + "mailimg/headerStrip.jpg);height:120px;text-indent:40px;padding-top:48px;'>" +
        //"<img src='" + StringConstant.pageurl + "mailimg/logo.png' />" +
        //"</div>" +
        //"<div style='background-color:#333;padding:10px;'>" +
        //    "<center>" +
        //        "<div style='background-image:url(" + StringConstant.pageurl + "mailimg/top.png);width:931px;height:71px;'>" +
        //        "</div>" +
        //        "<div style='background-color:White;padding:10px;width:909px;text-align:justify'>" +
        //        message +
        //        "</div>" +
        //        "<div style='background-image:url(" + StringConstant.pageurl + "mailimg/bottom.png);width:931px;height:47px;'>" +
        //        "</div>" +
        //    "</center>" +
        //"</div>";

        SmtpClient smtpc = new SmtpClient();
        // MailMessage msg = new MailMessage("solutions@foupsy.com", email, subject, sbody);
        MailMessage msg = new MailMessage("noreply@ateamhospitality.co.in", email, subject, message);
        msg.IsBodyHtml = true;
        System.Net.Mail.SmtpClient emailClient = new System.Net.Mail.SmtpClient("mail.ateamhospitality.co.in");
        System.Net.NetworkCredential SMTPUserInfo = new System.Net.NetworkCredential("noreply@ateamhospitality.co.in", "Admin.123");
        emailClient.UseDefaultCredentials = false;
        emailClient.Credentials = SMTPUserInfo;
        emailClient.Send(msg);

    }
    public void filldropDown(string qry, string tbl, DropDownList ddl, string display, string value, string sText)
    {
        DataRow rw;
        if (ds.Tables.Contains(tbl))
        {
            ds.Tables.Remove(tbl);
        }
        connect();
        cmd.Connection = conn;
        cmd.CommandText = qry;
        adp.SelectCommand = cmd;
        adp.Fill(ds, tbl);
        conn.Close();
        rw = ds.Tables[tbl].NewRow();
        rw[0] = "-1";
        rw[1] = sText;
        ds.Tables[tbl].Rows.InsertAt(rw, 0);
        ddl.DataSource = ds.Tables[tbl];
        ddl.DataTextField = display;
        ddl.DataValueField = value;
        ddl.DataBind();
    }
    public DataSet fetchdatset(string qry, string tbl)
    {
        try
        {
            if (ds.Tables.Contains(tbl))
            {
                ds.Tables.Remove(tbl);
            }
            connect();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = qry;
            adp.SelectCommand = cmd;
            adp.Fill(ds, tbl);
            conn.Close();
            return ds;
        }
        catch (Exception ex)
        {
            return ds;
        }
    }

}
