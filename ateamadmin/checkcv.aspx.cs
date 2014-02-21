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

public partial class checkcv : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liseek");
        HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("licheckcv");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active");
        lichild.Attributes.Add("class", "active");

    }
    protected void gridCv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
         int pagetotal = 10;
         int pageindex = gridCv.PageIndex;
        int count = pageindex * pagetotal;
        foreach (GridViewRow gr in gridCv.Rows)
        {
            count++;
            Label lblno = (Label)gr.FindControl("lblSno");
            lblno.Text = count.ToString();
            HiddenField cvtext = (HiddenField)gr.FindControl("hidCv");
            Button mail = (Button)gr.FindControl("maillink");
           // LinkButton downlinl = (LinkButton) gr.FindControl("downlinl");
            HtmlAnchor ahref = (HtmlAnchor)gr.FindControl("adown");
            
            if (cvtext.Value == "")
            {
               
                ahref.Style.Add("display", "none");
            }
            else
            {
                //downlinl.Attributes.Add("","");
                ahref.Attributes.Add("href", "http://ateamhospitality.co.in/cv/" + cvtext.Value);
                mail.Style.Add("display", "none");
                
            }
        }
    }
    protected void gridCv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "sendmail")
        {
            //send a mail
            string emailid = e.CommandArgument.ToString();
            obj.sendMail(emailid, "upload Cv", "Please upload your cv");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string dynamic = "";
        string sql = "SELECT [ID], [name], [email], [cvfile] FROM [jobseekers] WHERE id>0 ";
        if (textName.Text != "")
        {
            dynamic = dynamic + " and [name] like '"+ textName.Text +"%'";
        }
        if (textEmail.Text != "")
        {
            dynamic = dynamic + " and [email] like '" + textEmail.Text + "%' ";
        }
        sql = sql + dynamic ; 
        SqlDataSource1.SelectCommand = sql ;
        gridCv.DataBind();
    }
}
