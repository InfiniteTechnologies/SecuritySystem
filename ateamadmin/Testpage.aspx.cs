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

public partial class Testpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //code to download file and save it .
        string remoteImgPath = "http://2.bp.blogspot.com/-EQ4_VZN9QPk/UBaktSSWq9I/AAAAAAAAEDo/Un7GHKNkTBM/s1600/butterfly-fire_mobile_wallpapers.jpg";
        string fileName = System.IO.Path.GetFileName(remoteImgPath);
        string localPath = AppDomain.CurrentDomain.BaseDirectory + "ads\\" + fileName;
        Label1.Text = localPath;
       WebClient webClient = new WebClient();
       webClient.DownloadFile(remoteImgPath, localPath);
       // return localPath;
    }
}
