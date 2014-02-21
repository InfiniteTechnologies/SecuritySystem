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

public partial class shortlisted : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liseek");
         HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("lishort");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active");
        lichild.Attributes.Add("class", "active");
        if (Page.IsPostBack != true)
        {
            //no no
            obj.filldropDown("SELECT [ID],[name] FROM [sectormaster]", "sector", ddlSec, "name", "ID", "-- Please Select --");
        }
        else
        {
            //no no
        }
    }
    protected void grShortlisted_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int pagetotal = 10;
        int pageindex = grShortlisted.PageIndex;
        int count = pageindex * pagetotal;
        foreach (GridViewRow gr in grShortlisted.Rows)
        {
            count++;
            Label lblno = (Label)gr.FindControl("lblSno");
            lblno.Text = count.ToString();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string selectqry = "SELECT * FROM [applicants] WHERE [shortlisted] = 1 ";
        string dynamic = "";
        if (textTitle.Text != "")
        {
            dynamic = dynamic + " AND [title] like '"+ textTitle.Text +"%' ";
        }
        if (textRemail.Text != "")
        {
            dynamic = dynamic + " AND [name] like '" + textRemail.Text + "%' ";
        }
        if (textCmpny.Text != "")
        {
            dynamic = dynamic + " AND [company] like '" + textCmpny.Text + "%' ";
        }
        if (textJloc.Text != "")
        {
            dynamic = dynamic + " AND [location] like '" + textJloc.Text + "%' ";
        }
        if (textAname.Text != "")
        {
            dynamic = dynamic + " AND [Sname] like '" + textAname.Text + "%' ";
        }
        if (textAemail.Text != "")
        {
            dynamic = dynamic + " AND [Semail] like '" + textAemail.Text + "%' ";
        }
        if (ddlSec.SelectedIndex != 0)
        {
            dynamic = dynamic + " AND [Sector] = '" + ddlSec.SelectedItem.Text + "' ";
        }

//        dynamic = dynamic + " AND [title] like '" + textTitle.Text + "%' ";

        string finalqry = selectqry + dynamic;
        SqlDataSource1.SelectCommand = finalqry ;
        grShortlisted.DataBind();
    }
}
