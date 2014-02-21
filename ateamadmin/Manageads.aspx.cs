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
using System.Net;

public partial class Manageads : System.Web.UI.Page
{
    dboperations obj = new dboperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liMaster");
        HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("liads");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active");
        lichild.Attributes.Add("class", "active");
        if (Page.IsPostBack != true)
        {
            textStartdate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            textEnddate.Text = DateTime.Now.AddDays(10).ToString("dd/MM/yyyy");
        }
    }
    protected void submitbtn_Click(object sender, EventArgs e)
    {
        Page.Validate("B");
        if (Page.IsValid)
        {
            bool errors = false;
            if(submitbtn.Text=="Update")
            {
                string imgname = "";
                if (adsImage.HasFile)
                {
                    string ext = System.IO.Path.GetExtension(adsImage.FileName);
                    ext = ext.ToLower();
                    if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                    {
                        string appendname = DateTime.Now.ToString("ddMMyyyyhhmmsstt");
                        adsImage.SaveAs(Server.MapPath("./ads/" + appendname + adsImage.FileName));
                        imgname = appendname + adsImage.FileName.ToString();
                        //  obj.cmd.Parameters.AddWithValue("@imgname", appendname + adsImage.FileName);
                    }
                    else
                    {
                        errors = true;
                        lblerror.Text = "Please upload an image ( jpg, png, gif, jpeg format)";
                    }
                }
                else
                {
                    imgname = lblOld.Value.ToString();
                }
                if (errors == false)
                {
                    obj.cmd.Parameters.AddWithValue("@aname", textName.Text);
                    obj.cmd.Parameters.AddWithValue("@aimage", imgname);
                    obj.cmd.Parameters.AddWithValue("@sdate", textStartdate.Text);
                    obj.cmd.Parameters.AddWithValue("@edate", textEnddate.Text);
                    obj.executeQueries("UPDATE [admanage] SET [name] = @aname ,[startdate] = @sdate ,[enddate] =@edate ,[image] = @aimage WHERE [ID] = '" + adsid.Value + "' ");
                    GridView1.DataBind();
                }
            }
            else{

                string imgname = "";
                if (adsImage.HasFile)
                {
                    string ext = System.IO.Path.GetExtension(adsImage.FileName);
                    ext = ext.ToLower();
                    if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                    {
                        string appendname = DateTime.Now.ToString("ddMMyyyyhhmmsstt");
                        adsImage.SaveAs(Server.MapPath("./ads/" + appendname + adsImage.FileName));
                        imgname = appendname + adsImage.FileName.ToString();
                      //  obj.cmd.Parameters.AddWithValue("@imgname", appendname + adsImage.FileName);
                    }
                    else
                    {
                        errors = true;
                        lblerror.Text = "Please upload an image ( jpg, png, gif, jpeg format)";
                    }
                }
                else
                {
                    imgname = "postad.jpg";
                    //obj.cmd.Parameters.AddWithValue("@imgname", "postad.jpg");
                }
                if (errors == false)
                {
                    obj.cmd.Parameters.AddWithValue("@aname", textName.Text);
                    obj.cmd.Parameters.AddWithValue("@aimage", imgname);
                    obj.cmd.Parameters.AddWithValue("@sdate", textStartdate.Text);
                    obj.cmd.Parameters.AddWithValue("@edate", textEnddate.Text);
                    obj.cmd.Parameters.AddWithValue("@adminid", Session["adminid"].ToString());
                    obj.executeQueries("INSERT INTO [admanage] ([name],[startdate],[enddate],[image],[f_adminid]) VALUES (@aname,@sdate,@edate,@aimage,@adminid) ");
                    GridView1.DataBind();
                }
            }
        }
        else
        {
            lblerror.Text = "Please complete all required fields ! ";
        }
        clear();
    }
    protected void resetbtn_Click(object sender, EventArgs e)
    {

    }
    protected void cancelbtn_Click(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            string ID = e.CommandArgument.ToString();
            obj.executeQueries("DELETE FROM [admanage] WHERE [ID] = '"+ ID +"' ");
            GridView1.DataBind();
        }
        if (e.CommandName == "ed")
        {
            string ID = e.CommandArgument.ToString();
            bool getdata = obj.getdata("SELECT * FROM [admanage] WHERE [ID] = '" + ID + "' ");
            if (getdata == true)
            {
                GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                System.Web.UI.HtmlControls.HtmlImage adimages = (System.Web.UI.HtmlControls.HtmlImage)row.FindControl("adimages");
                string src = adimages.Src.ToString();
                adsid.Value = ID;
                textName.Text = obj.dr["name"].ToString();
                textStartdate.Text = obj.dr["startdate"].ToString();
                textEnddate.Text = obj.dr["enddate"].ToString();
                oldimg.Attributes.Add("src", src);
                lblOld.Value = obj.dr["image"].ToString();
                submitbtn.Text = "Update";
            }
            GridView1.DataBind();
        }
        if (e.CommandName.ToString() == "appr")
        {
            string ID = e.CommandArgument.ToString();
            //lblerror.Text = ID;
            string[] darray = ID.Split(',');
            lblerror.Text = darray.Length.ToString();
            lblerror.Text = darray[1];
           
            //download image into admin's side 
            try
            {
                string remoteImgPath = "http://ateamhospitality.co.in/adds/" + darray[1];
                string fileName = System.IO.Path.GetFileName(remoteImgPath);
                string localPath = AppDomain.CurrentDomain.BaseDirectory + "ads\\" + fileName;
                WebClient webClient = new WebClient();
                webClient.DownloadFile(remoteImgPath, localPath);
                obj.executeQueries("UPDATE [admanage] SET [status] = '1' WHERE [ID] = '" + darray[0] + "'");
            }
            catch (Exception ex)
            {
                lblerror.Text = ex.Message.ToString();
            }
            
            GridView1.DataBind();

        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    { int pagetotal = 10;
        int pageindex = GridView1.PageIndex;
        int count = pageindex * pagetotal;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            count++;
            Label lblno = (Label)gr.FindControl("lblSno");
            System.Web.UI.HtmlControls.HtmlImage adimages = (System.Web.UI.HtmlControls.HtmlImage)gr.FindControl("adimages");
            HiddenField lblStatus = (HiddenField)gr.FindControl("lblStatus");
            HiddenField lblImagename = (HiddenField)gr.FindControl("lblImagename");
            Label lblApprove = (Label)gr.FindControl("lblApprove");
            LinkButton lbApr = (LinkButton)gr.FindControl("lbApr");
            if (lblStatus.Value != "1")
            {
                adimages.Attributes.Add("src", "http://ateamhospitality.co.in/adds/" + lblImagename.Value);
                lblApprove.Style.Add("display", "none");
               // adimages.Style.Add("display", "none");
            }
            else
            {
                lbApr.Style.Add("display", "none");
            }
            lblno.Text = count.ToString();
        }

    }
    public void clear()
    {
        textName.Text = "";
        oldimg.Attributes.Add("src", "ads/postad.jpg");
        textStartdate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        textEnddate.Text = DateTime.Now.AddDays(10).ToString("dd/MM/yyyy");
        submitbtn.Text = "Add";
    }
}
