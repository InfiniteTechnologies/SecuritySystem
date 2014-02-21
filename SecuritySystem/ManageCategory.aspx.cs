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

public partial class ManageCategory : System.Web.UI.Page
{
    Connection obj = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "remove")
        {
            SqlDataSource1.DeleteCommand="delete from CategoryMaster where id=" + e.CommandArgument;
            SqlDataSource1.Delete();
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
          if (e.Row.RowType == DataControlRowType.DataRow &&
   (e.Row.RowState == DataControlRowState.Normal ||
    e.Row.RowState == DataControlRowState.Alternate))
        {
            e.Row.TabIndex = -1;
            e.Row.Attributes["onclick"] =
              string.Format("javascript:SelectRow(this, {0});", e.Row.RowIndex);
            e.Row.Attributes["onkeydown"] = "javascript:return SelectSibling(event);";
            e.Row.Attributes["onselectstart"] = "javascript:return false;";
        }
    }
    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        obj.cmd.Parameters.AddWithValue("@categ", TextCategory.Text);
        obj.ExecuteQueries("insert into CategoryMaster (categoryname) values (@categ)");
        GridView1.DataBind();
        TextCategory.Text = "";
   
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet dss = obj.fetchdatset("select * from CategoryMaster where id='" + TextBox1.Text + "'", "fetch");
        foreach (DataRow drr in dss.Tables["fetch"].Rows)
        {
            //  int id = drr["id"].ToString();
            TextCategory.Text = drr["categoryName"].ToString();
        } 
    }
    protected void ButtonUpdate_Click(object sender, EventArgs e)
    {
        obj.cmd.Parameters.AddWithValue("@categ", TextCategory.Text);
        obj.ExecuteQueries("update CategoryMaster set categoryname =@categ where id='"+TextBox1.Text+"'");
        GridView1.DataBind();
        TextCategory.Text = "";
    }
    protected void ButtonReset_Click(object sender, EventArgs e)
    {
        TextCategory.Text = "";
    }
}
