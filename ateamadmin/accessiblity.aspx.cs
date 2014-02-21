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

public partial class accessiblity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liseek");
         HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("liaccs");
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
            lblno.Text = count.ToString();

            HiddenField statusval = (HiddenField)gr.FindControl("lblSval");
            Button lblstatus = (Button)gr.FindControl("btnstatus");
            if (statusval.Value == "1")
            {
                lblstatus.Attributes.Add("class", "btn btn-default");
                lblstatus.Text = "Active";
            }
            else
            {
                lblstatus.Attributes.Add("class", "btn btn-default");
                lblstatus.Text = "Blocked";
            }
        }
    }
}
