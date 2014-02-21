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

public partial class Managesectors : System.Web.UI.Page
{
    dboperations obj  = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liMaster");
        HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("lisectors");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active");
        lichild.Attributes.Add("class", "active");
    }
    protected void grsectors_RowDataBound(object sender, GridViewRowEventArgs e)
    {
         int pagetotal = 10;
         int pageindex = grsectors.PageIndex;
        int count = pageindex * pagetotal;
        foreach (GridViewRow gr in grsectors.Rows)
        {
            count++;
            Label lblno = (Label)gr.FindControl("lblSno");
            lblno.Text = count.ToString();
        }
    }
    protected void grsectors_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ed")
        {
            string catid = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [sectormaster] WHERE [ID] = " + catid + " ");
            if (dataexist == true)
            {
                textName.Text = obj.dr["name"].ToString();
                textKey.Text = obj.dr["keywords"].ToString();
                textDesc.Text = obj.dr["description"].ToString();
                submitBtn.Text = "Update";
                secid.Value = catid;
            }
        }
        if (e.CommandName == "del")
        {

            string catid = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [sectormaster] WHERE [ID] = " + catid + " ");
            if (dataexist == true)
            {

                obj.executeQueries("DELETE FROM [sectormaster] WHERE [ID] = '" + catid + "'");
            }
            clear();

            grsectors.DataBind();
        }
    }
    protected void submitBtn_Click(object sender, EventArgs e)
    {
        Page.Validate("A");
        if (Page.IsValid)
        {
            if (submitBtn.Text == "Update")
            {
                obj.executeQueries("UPDATE [sectormaster] SET [name] = '" + textName.Text + "' , [keywords] = '" + textKey.Text + "', [description]='" + textDesc.Text + "' WHERE [ID] = " + secid.Value + "");

            }
            else
            {
                obj.executeQueries("INSERT INTO [sectormaster] ([name],[keywords],[description],[f_adminid]) VALUES ('" + textName.Text + "','" + textKey.Text + "','" + textDesc.Text + "'," + dboperations.adminid + ")");
            }
            grsectors.DataBind();
            clear();
        }
        else
        {
        }
    }
    public void clear()
    {
        textName.Text = "";
        textKey.Text = "";
        textDesc.Text = "";
        secid.Value = "";
        submitBtn.Text = "Add";
        lblerror.Text = "";
    }
}
