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

public partial class checkapplications : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liseek");
        HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("checkapp");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active");
        lichild.Attributes.Add("class", "active");
        if (Page.IsPostBack != true)
        {
            
        }
        else 
        { 

        }
    }
    protected void grApplications_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int pagetotal = 10;
        int pageindex = grApplications.PageIndex;
        int count = pageindex * pagetotal;
        foreach (GridViewRow gr in grApplications.Rows)
        {
            count++;
            Label lblno = (Label)gr.FindControl("lblSno");
            HiddenField statusval = (HiddenField)gr.FindControl("statusval");
            Label lblStatus = (Label)gr.FindControl("lblStatus");
            if (statusval.Value == "1")
            {
                lblStatus.Text = "Shortlisted";
                gr.Style.Add("color", "#5cb85c");

            }
            else
            {
                lblStatus.Text = "On hold";
            }
            lblno.Text = count.ToString();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string selectqry = "SELECT * FROM [applicants] WHERE [aid] > 0 ";
        string dynamic = "";
        if (textTitle.Text != "")
        {
            dynamic = dynamic + " AND [title] like '"+ textTitle.Text +"%' ";
        }
        if (textComp.Text != "")
        {
            dynamic = dynamic + " AND [company] like '"+ textComp.Text +"%' ";
        }
        if (textAemail.Text != "")
        {
            dynamic = dynamic + " AND [Semail] like '" + textAemail.Text + "'";
        }
        if (textAname.Text != "")
        {
            dynamic = dynamic + " AND [Sname] like '"+ textAname.Text +"%' ";
        }
        if (ddlShort.SelectedIndex != 0)
        {
            if (ddlShort.SelectedValue == "1")
            {
                dynamic = dynamic + " AND [shortlisted] = 1 ";
            }
            else
            {
                dynamic = dynamic + " AND [shortlisted] = 0 ";
            }
        }
        string finalqry = selectqry + dynamic;
        SqlDataSource1.SelectCommand = finalqry;
        grApplications.DataBind();
    }
}
