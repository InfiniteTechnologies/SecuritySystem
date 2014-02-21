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

public partial class manageusers : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liseek");
        HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("liuser");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active mainlis");
        lichild.Attributes.Add("class", "active");
        lbltotal.Text = obj.totalno("select COUNT(ID) as 'count' from [jobseekers];");
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
            Label lblContact = (Label)gr.FindControl("lblContact");
            Label lblCity = (Label)gr.FindControl("lblCity");
            Label lblCountry = (Label)gr.FindControl("lblCountry");
            Label lblDob = (Label)gr.FindControl("lblDob");
            HiddenField lblPaid = (HiddenField)gr.FindControl("lblPaid");
            if (lblPaid.Value == "True")
            {
                gr.Style.Add("background-color", "#5cb85c");
                gr.Style.Add("color", "#fff");
            }
            else
            {
                gr.Style.Add("background-color", "#d9534f");
                gr.Style.Add("color", "#fff");
            }
            if (lblContact.Text == "")
            {
                lblContact.Text = "NA";
            }
            if (lblCity.Text == "")
            {
                lblCity.Text = "NA";
            }
            if (lblCountry.Text == "")
            {
                lblCountry.Text = "NA";
            }
            if (lblDob.Text == "")
            {
                lblDob.Text = "NA";
            }
            lblno.Text = count.ToString();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "more")
        {
            Response.Redirect("viewmore.aspx?ID="+e.CommandArgument.ToString());
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnSearc_Click(object sender, EventArgs e)
    {
        string dynamic = "";
        string sql = "SELECT * FROM [jobseekers] WHERE id>0 ";
        if (textName.Text != "")
        {
            dynamic = dynamic + " and [name] like '"+ textName.Text +"%'";
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
            dynamic = dynamic + "and [country] like  '"+ textCountry.Text +"%' ";
        }
        
        sql = sql + dynamic ; 
        SqlDataSource1.SelectCommand = sql ;
        GridView1.DataBind();
    }
}
