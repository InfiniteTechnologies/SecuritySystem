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

public partial class managenewsletters : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    string revise;
    protected void Page_Load(object sender, EventArgs e)
    {
         HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liMaster");
        HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("linews");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active mainlis");
        lichild.Attributes.Add("class", "active");   
        MultiView1.ActiveViewIndex = 0;
    }
    
    protected void submitbtn_Click(object sender, EventArgs e)
    {
        Page.Validate("A");
        
        if (Page.IsValid)
        {
            if (rdbbtn.SelectedIndex == 0)
            {
                revise = periodiclist.SelectedValue;
            }
            else
            {
                revise = textdays.Text;
            }
            if (submitbtn.Text == "Update")
            {
                obj.executeQueries("UPDATE [newsletter] SET [subject]='" + textsub.Text + "',[content]='" + texttemplate.Content + "',[date]='" + textDate.Text + "',[type]='" + rdbbtn.SelectedValue + "',[revise] = '" + revise + "' WHERE [ID]= '" + newsid.Value  + "' ");
            }
            else
            {
                obj.executeQueries("INSERT INTO [newsletter] ([subject],[content],[date],[type],[revise],[f_adminid]) VALUES ('" + textsub.Text + "','" + texttemplate.Content + "','" + textDate.Text + "','" + rdbbtn.SelectedValue + "','"+ revise +"','"+ dboperations.adminid +"')");
            }
            GridView1.DataBind();
            clear();
        }
        else
        {
            lblerror.Text = "Please complete all required fields ";
        }
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
    protected void rdbbtn_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdbbtn.SelectedIndex == 0)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        else
        {
            MultiView1.ActiveViewIndex = 1;
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ed")
        {
            string catid = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [newsletter] WHERE [ID] = " + catid + " ");
            if (dataexist == true)
            {
                textDate.Text = obj.dr["date"].ToString();
                textsub.Text = obj.dr["subject"].ToString();
                texttemplate.Content = obj.dr["content"].ToString();
                string typep = obj.dr["type"].ToString();
                if (typep == "P")
                {
                    rdbbtn.SelectedIndex = 0;
                    MultiView1.ActiveViewIndex = 0;
                    periodiclist.SelectedValue = obj.dr["revise"].ToString();
                }
                else
                {
                    rdbbtn.SelectedIndex = 1;
                    MultiView1.ActiveViewIndex = 1;
                    textdays.Text = obj.dr["revise"].ToString();
                }
                newsid.Value = catid;
                submitbtn.Text = "Update";
                
            }
        }
        if (e.CommandName == "del")
        {

            string catid = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [newsletter] WHERE [ID] = " + catid + " ");
            if (dataexist == true)
            {

                obj.executeQueries("DELETE FROM [newsletter] WHERE [ID] = '" + catid + "'");
            }
            clear();

            GridView1.DataBind();
        }
    }
    public void clear()
    {
        
        textdays.Text = "0";
        textdays.Text = "";
        textsub.Text = "";
        texttemplate.Content = "";
        textDate.Text = "";
        rdbbtn.SelectedIndex = 0;
        MultiView1.ActiveViewIndex = 0;
        submitbtn.Text = "Add";
    }
}
