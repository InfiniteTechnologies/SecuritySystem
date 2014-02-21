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

public partial class managecv : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    string oldname = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liMaster");
        HtmlGenericControl listchild = (HtmlGenericControl)Page.Master.FindControl("licv");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active");
        listchild.Attributes.Add("class", "active");
    }
    protected void textURL_TextChanged(object sender, EventArgs e)
    {

    }
    protected void submitbtn_Click(object sender, EventArgs e)
    {
        Page.Validate("A");
        if (Page.IsValid)
        {
            if (tempImages.FileName == "")
            {

            }
            else
            {
                tempImages.SaveAs(Server.MapPath("./testimonialImages/cv_" + tempImages.FileName));
            }

            //
            if (submitbtn.Text == "Update")
            {

                string imgname = tempImages.FileName == "" ? cvold.Value.ToString() : "cv_" + tempImages.FileName;
                obj.executeQueries("UPDATE [cvtemplatemaster] SET [category] = '" + catlist.SelectedValue + "' , [image] = '" + imgname + "' , [url] = '" + textURL.Text + "' WHERE [ID] = " + cvid.Value + "");

            }
            else
            {
                string imgname = tempImages.FileName == "" ? "cvtemp.png" : "cv_" + tempImages.FileName;
                obj.executeQueries("INSERT INTO [cvtemplatemaster] ([category],[image],[url],[f_adminid]) VALUES ('" + catlist.SelectedValue + "','" + imgname + "','"+ textURL.Text +"'," + dboperations.adminid + ")");
            }
            clear();
            GridView1.DataBind();
        }
        else
        {
            lblerror.Text = "Please complete all required fields";
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
            Label lbcat = (Label)gr.FindControl("lblCat");
            System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)gr.FindControl("imgsrc");
            HiddenField val = (HiddenField)gr.FindControl("catval");
            HiddenField imurl = (HiddenField)gr.FindControl("imgurl");
            img.Attributes.Add("src", "testimonialImages/"+imurl.Value);
            string cval = val.Value.ToString();
            lbcat.Text = cval == "2" ? "Senior Level" : (cval == "1" ? "Mid Level" : "Entry Level");
            lblno.Text = count.ToString();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "ed")
        {
            string catid = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [cvtemplatemaster] WHERE [ID] = " + catid + " ");
            if (dataexist == true)
            {

                catlist.SelectedValue = obj.dr["category"].ToString();
                textURL.Text = obj.dr["url"].ToString(); obj.dr["image"].ToString();
               // oldname = obj.dr["image"].ToString();
                oldimg.Attributes.Add("src", "testimonialImages/"+obj.dr["image"].ToString());
                submitbtn.Text = "Update";
                cvid.Value = catid;
                cvold.Value=obj.dr["image"].ToString();
            }
        }
        if (e.CommandName == "del")
        {

            string catid = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [cvtemplatemaster] WHERE [ID] = " + catid + " ");
            if (dataexist == true)
            {

                obj.executeQueries("DELETE FROM [cvtemplatemaster] WHERE [ID] = '" + catid + "'");
            }
            clear();

            GridView1.DataBind();
        }
    }
    public void clear()

    {
        textURL.Text = "";
        catlist.SelectedIndex = 0;
        cvid.Value = "";
        oldimg.Attributes.Add("src", "testimonialImages/cvtemp.png");
        submitbtn.Text = "Add";
    }
}
