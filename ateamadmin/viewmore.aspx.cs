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

public partial class testimonialImages_viewmore : System.Web.UI.Page
{
    dboperations obj = new dboperations();

    protected void Page_Load(object sender, EventArgs e)
    {
         HtmlGenericControl limain = (HtmlGenericControl)Page.Master.FindControl("liMaster");
        HtmlGenericControl lichild = (HtmlGenericControl)Page.Master.FindControl("litest");
        limain.Attributes.Add("class", "open");
        limain.Attributes.Add("class", "active");
        lichild.Attributes.Add("class", "active");
        if (IsPostBack != true)
        {
            string IDuser = Request.QueryString["ID"];
            bool existdata = obj.getdata("SELECT * FROM [jobseekers] WHERE [ID]='"+ IDuser +"'");
            if (existdata == true)
            {
                //HtmlAnchor cvdown =(HtmlAnchor) Page.FindControl("cvdown");
                lblFname.Text = lblname.Text = obj.dr["name"].ToString() ;
                labEmail.Text = obj.dr["email"].ToString();
                profile.Attributes.Add("src", "./seekers_images/"+obj.dr["image"].ToString());
                lblPass.Text = obj.dr["password"].ToString();
                lblRecv.Text = obj.dr["recvemail"].ToString() == "True" ? "Yes" : "No";
                lblThird.Text = obj.dr["thirdparty"].ToString() == "True" ? "Yes" : "No";
                lblPaid.Text = obj.dr["paid"].ToString() == "True" ? "Yes" : "No";
                lblGen.Text = obj.dr["gender"].ToString() == "F" ? "Female" : "Male";
                lblCont.Text = obj.dr["contactno"].ToString();
                lblCsum.Text = obj.dr["careersum"].ToString();
                lblAddr.Text = obj.dr["address"].ToString();
                lblAbt.Text = obj.dr["aboutme"].ToString();
                lblAlt.Text = obj.dr["alternateno"].ToString();
                lblCity.Text = obj.dr["city"].ToString();
                lblCoun.Text = obj.dr["country"].ToString();
                lblDob.Text = obj.dr["dob"].ToString();
                lblLast.Text = obj.dr["lastlogin"].ToString();
                lblReg.Text = obj.dr["regdate"].ToString();
                string cvlink = obj.dr["cvfile"].ToString();
                if (cvlink == "")
                {
                    cvdown.Style.Add("display", "none");
                }
                else
                {

                    cvdown.Attributes.Add("href", "http://ateamhospitality.co.in/cv/" + cvlink);
                }
                
            }
        }
    }
}
