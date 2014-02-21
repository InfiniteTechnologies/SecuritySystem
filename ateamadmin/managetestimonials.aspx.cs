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

public partial class managetestimonials : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liMaster");
        HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("litest");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active");
        lichild.Attributes.Add("class", "active");

    }
    protected void submitbtn_Click(object sender, EventArgs e)
    {
        Page.Validate("A");
        if (Page.IsValid)
        {
            if (testiImages.FileName == "")
            {

            }
            else
            {
                testiImages.SaveAs(Server.MapPath("./testi/cv_" + testiImages.FileName));
            }
            if (submitbtn.Text == "Update")
            {

                string imgname = testiImages.FileName == "" ? imgoldtest.Value.ToString() : "cv_" + testiImages.FileName;
                obj.executeQueries("UPDATE [testimonials] SET [name] = '" + textName.Text + "' ,[images] = '" + imgname + "' , [position] = '" + textPos.Text + "' , [test] = '" + textMsg.Text + "' WHERE [ID] = " + testid.Value + "");

            }
            else
            {
                string imgname = testiImages.FileName == "" ? "defaulttest.png" : "cv_" + testiImages.FileName;
                obj.executeQueries("INSERT INTO [testimonials] ([name],[images],[position],[test],[f_adminid]) VALUES ('" + textName.Text + "','" + imgname + "','" + textPos.Text + "','"+ textMsg.Text +"'," + dboperations.adminid + ")");
            }
        }
        else
        {
            lblerror.Text = "Please complete all required fields";
        }
        clear();
        GridView1.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ed")
        {
            string catid = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [testimonials] WHERE [id] = " + catid + " ");
            if (dataexist == true)
            {

                textName.Text = obj.dr["name"].ToString();
                textPos.Text = obj.dr["position"].ToString();
                textMsg.Text = obj.dr["test"].ToString();
                oldimg.Attributes.Add("src", "testi/" + obj.dr["images"].ToString());
                submitbtn.Text = "Update";
                testid.Value = catid;
                imgoldtest.Value = obj.dr["images"].ToString();
            }
        }
        if (e.CommandName == "del")
        {

            string catid = e.CommandArgument.ToString();
            bool dataexist = obj.getdata("SELECT * FROM [testimonials] WHERE [id] = " + catid + " ");
            if (dataexist == true)
            {

                obj.executeQueries("DELETE FROM [testimonials] WHERE [id] = '" + catid + "'");
            }
            clear();

            GridView1.DataBind();
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int pagetotal = 5;
        int pageindex = GridView1.PageIndex;
        int count = pageindex * pagetotal;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            count++;
            Label lblno = (Label)gr.FindControl("lblSno");
            System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)gr.FindControl("imgsrc");
         
            HiddenField imurl = (HiddenField)gr.FindControl("imgurl");
            img.Attributes.Add("src", "testi/" + imurl.Value);
          
            lblno.Text = count.ToString();
        }
    }
    public void clear()
    {
        textName.Text = "";
        textPos.Text = "";
        textMsg.Text = "";
        submitbtn.Text = "Add";
        testid.Value = "";
        oldimg.Attributes.Add("src", "testi/defaulttest.png");
    }
    protected void reseybtn_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void textName_TextChanged(object sender, EventArgs e)
    {

    }
}
