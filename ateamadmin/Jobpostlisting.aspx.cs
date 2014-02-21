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

public partial class Jobpostlisting : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liRecrute");
         HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("liJobpost");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active mainlis");
        lichild.Attributes.Add("class", "active");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int pagetotal = 10;
        int pageindex = GridView1.PageIndex;
        int count = pageindex * pagetotal;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            count++;
            Label lblno = (Label)gr.FindControl("lblSno");
            HiddenField refval = (HiddenField)gr.FindControl("refval");
            HiddenField statusval = (HiddenField)gr.FindControl("statusval");
            Label lblRef = (Label)gr.FindControl("lblRef");
            Label lblCategory = (Label)gr.FindControl("lblCategory");
            Label lblLocation = (Label)gr.FindControl("lblLocation");
            Label lblStatus = (Label)gr.FindControl("lblStatus");

            Button btnVerify = (Button)gr.FindControl("btnVerify");
            Button btnNverify = (Button) gr.FindControl("btnNverify");

            lblCategory.Text = lblCategory.Text.TrimEnd(',');
            lblLocation.Text = lblLocation.Text.TrimEnd(',');
            if (statusval.Value == "1")
            {
                lblStatus.Text = "Approved";
                btnVerify.Style.Add("display", "none");
                btnNverify.Style.Add("display", "none");
            }
            else
            {
                if (statusval.Value == "-1")
                {
                    btnVerify.Style.Add("display", "none");
                    btnNverify.Style.Add("display", "none");
                    lblStatus.Text = "Refused";
                }
                else
                {
                    // lblStatus.Text = "Not varified yet";
                }
            }
            if (refval.Value == "")
            {
                lblRef.Text = "NA";
            }
            else
            {
                lblRef.Text = refval.Value;
            }
            lblno.Text = count.ToString();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "approve")
        {
            string jobid = e.CommandArgument.ToString();
            obj.executeQueries("UPDATE [jobpost] SET [status] = '1' WHERE [ID] = '" + jobid + "' ");
            GridView1.DataBind();
        }
        if (e.CommandName == "refuse")
        {
            string jobid = e.CommandArgument.ToString();
            obj.executeQueries("UPDATE [jobpost] SET [status] = '-1' WHERE [ID] = '" + jobid + "' ");
            GridView1.DataBind();
        }
    }
}
