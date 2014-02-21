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

public partial class managelocations : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liMaster");
        HtmlGenericControl liloc = (HtmlGenericControl)Page.Master.FindControl("liLoca");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active mainlis");
        liloc.Attributes.Add("class", "active");
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
        }
    }
    protected void submitbtn_Click(object sender, EventArgs e)
    {
        Page.Validate("A");
        if (Page.IsValid)
        {
            if (submitbtn.Text == "Update")
            {
                obj.executeQueries("UPDATE [locationmaster] SET [name] = '" + textName.Text + "' , [keywords] = '" + textkeywords.Text + "' WHERE [ID] = " + locid.Value + "");

            }
            else
            {
                obj.executeQueries("INSERT INTO [locationmaster] ([name],[keywords],[f_adminid]) VALUES ('" + textName.Text + "','" + textkeywords.Text + "'," + dboperations.adminid + ")");

            }
            clear();
            GridView1.DataBind();
        }
        else
        {
            lblerror.Text = "Please complete all required fields";
        }
        
    }
    public void clear()
    {
        textName.Text = "";
        textkeywords.Text = "";
        submitbtn.Text = "Add";
        locid.Value = "";
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ed")
        {
            string locids = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [locationmaster] WHERE [ID] = " + locids + " ");
            if (dataexist == true)
            {
                textName.Text = obj.dr["name"].ToString();
                textkeywords.Text = obj.dr["keywords"].ToString();
                
                submitbtn.Text = "Update";
                locid.Value = locids;
            }
        }
        if (e.CommandName == "del")
        {

            string locids = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [locationmaster] WHERE [ID] = " + locids + " ");
            if (dataexist == true)
            {

                obj.executeQueries("DELETE FROM [locationmaster] WHERE [ID] = '" + locids + "'");
            }
            clear();

            GridView1.DataBind();
        }
    }
    protected void cancelbtn_Click(object sender, EventArgs e)
    {

    }
}
