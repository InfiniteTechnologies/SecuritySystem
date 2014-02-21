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

public partial class Managerecruiters : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liRecrute");
        HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("liRusers");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active");
        lichild.Attributes.Add("class", "active");
        lbltotal.Text = obj.totalno("select COUNT(ID) as 'count' from [recruiters];");
    }
    protected void grRecruiters_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int pagetotal = 10;
        int pageindex = grRecruiters.PageIndex;
        int count = pageindex * pagetotal;
        foreach (GridViewRow gr in grRecruiters.Rows)
        {
            count++;
            Label lblno = (Label)gr.FindControl("lblSno");
            HiddenField isactive = (HiddenField)gr.FindControl("isactive");
            Label activelbl = (Label)gr.FindControl("lblIsactive");
            Button btnSendmail = (Button)gr.FindControl("btnSendmail");
            if (isactive.Value == "True")
            {
                activelbl.Text = "Confirmed";
                btnSendmail.Style.Add("display", "none");
            }
            else
            {
                activelbl.Style.Add("display", "none");
                //activelbl.Text = "Not Active";
            }
            lblno.Text = count.ToString();
        }
    }
    protected void btnSearc_Click(object sender, EventArgs e)
    {
        string dynamic = "";
        string sql = "SELECT * FROM [recruiters] WHERE id>0 ";
        if (textName.Text != "")
        {
            dynamic = dynamic + " and [name] like '" + textName.Text + "%'";
        }
        if (textEmail.Text != "")
        {
            dynamic = dynamic + " and [email] like '" + textEmail.Text + "%' ";
        }
        if (textCity.Text != "")
        {
            dynamic = dynamic + "and [city] like  '" + textCity.Text + "%' ";
        }
        if (textCountry.Text != "")
        {
            dynamic = dynamic + "and [country] like  '" + textCountry.Text + "%' ";
        }
        if (textCompany.Text != "")
        {
            dynamic = dynamic + "and [company] like  '" + textCompany.Text + "%' ";
        }
        if (textContact.Text != "")
        {
            dynamic = dynamic + "and [telephone] like  '" + textContact.Text + "%' ";
        }

        sql = sql + dynamic;
        SqlDataSource1.SelectCommand = sql;
        grRecruiters.DataBind();
    }
    protected void grRecruiters_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "mail")
        {
            string arguments = e.CommandArgument.ToString();
            string[] credentials = arguments.Split(',');
            string linkacti = "http://ateamhospitality.co.in/Thanksforregistraion.aspx?reset=" + credentials[1];
            string bodymail = "<div style=\"color:#434343;font-family:Calibri, BrowalliaUPC, 'Browallia New'\"><p>Dear " + textName.Text + ",</p><p>Before you can access your account on ateamhospitality.co.in, we need to confirm your email address is correct. To do this, please click on the link below.</p><p>  VERIFY YOUR EMAIL ADDRESS NOW:</p><p><a href='" + linkacti + "'>" + linkacti + "</a></p><p>(If the link doesn't work, try copying and pasting it into your browser).</p><p>-----</p><div>Questions?</div><div>Email us by visiting <a style=\"color:#00C\" href=\"http://ateamhospitality.co.in/\" target=\"_blank\">http://ateamhospitality.co.in/</a></div><div>Please do not reply to this email.</div>";
            obj.sendMail(credentials[0], "Reminder : Confirm your email ! ", bodymail);
           //lblMsg.Text = credentials[0] + " : " + credentials[1];
        } 
    }
}
