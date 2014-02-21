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

public partial class managecategories : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl list = (HtmlGenericControl)Page.Master.FindControl("liMaster");
        HtmlGenericControl listchild = (HtmlGenericControl)Page.Master.FindControl("managecat");
        list.Attributes.Add("class","open");
        list.Attributes.Add("class", "active mainlis");
        listchild.Attributes.Add("class", "active");
        if (IsPostBack != true)
        {
            obj.filldropDown("SELECT [ID],[name] FROM [catagorymaster] WHERE [parent_cat] = '-1' ", "parent", ddlParent, "name", "ID", "-- No Parent --");
        }
        else
        {

        }
       
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

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
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ed")
        {
            string catid = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [catagorymaster] WHERE [ID] = " + catid + " ");
            if (dataexist == true)
            {
                textName.Text = obj.dr["name"].ToString();
                textKey.Text = obj.dr["keywords"].ToString();
                textDesc.Text = obj.dr["description"].ToString();
                ddlParent.SelectedValue = obj.dr["parent_cat"].ToString();
                submitBtn.Text = "Update";
                catids.Value = catid;
            }
        }
        if (e.CommandName == "del")
        {
            
            string catid = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [catagorymaster] WHERE [ID] = " + catid + " ");
            if (dataexist == true)
            {

                obj.executeQueries("DELETE FROM [catagorymaster] WHERE [ID] = '" + catid + "'");
            }
            clear();

            GridView1.DataBind();
        }
    }
    protected void submitBtn_Click(object sender, EventArgs e)
    {
        Page.Validate("A");
        if (Page.IsValid)
        {
            if (submitBtn.Text == "Update")
            {
                obj.executeQueries("UPDATE [catagorymaster] SET [name] = '" + textName.Text + "' , [keywords] = '" + textKey.Text + "', [description]='" + textDesc.Text + "', [parent_cat] = '"+ ddlParent.SelectedValue +"' WHERE [ID] = " + catids.Value + "");

            }
            else
            {
                obj.executeQueries("INSERT INTO [catagorymaster] ([name],[keywords],[description],[f_adminid],[parent_cat]) VALUES ('" + textName.Text + "','" + textKey.Text + "','" + textDesc.Text + "'," + dboperations.adminid + ",'"+ ddlParent.SelectedValue +"')");

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
        textKey.Text = "";
        textDesc.Text = "";
        catids.Value = "";
        submitBtn.Text = "Add";
        lblerror.Text = "";
    }
    protected void resetbtn_Click(object sender, EventArgs e)
    {
        clear();
    }
}
