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
            LabelErr.Text = "Your record has been deleted";
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
        Page.Validate("A");
        if (Page.IsValid)
        {
        obj.cmd.Parameters.AddWithValue("@categ", TextCategory.Text);
        obj.ExecuteQueries("insert into CategoryMaster (categoryname) values (@categ)");
        GridView1.DataBind();
        TextCategory.Text = "";
        LabelErr.Text = "Your record has been added";
        }
        else
        {
             LabelErr.Text = "Please Enter the field!";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ButtonUpdate.Enabled = true;
            DataSet dss = obj.fetchdatset("select * from CategoryMaster where id='" + TextBox1.Text + "'", "fetch");
            foreach (DataRow drr in dss.Tables["fetch"].Rows)
            {
                TextCategory.Text = drr["categoryName"].ToString();
            }
           
    }
    protected void ButtonUpdate_Click(object sender, EventArgs e)
    {
         Page.Validate("A");
         if (Page.IsValid)
         {
             bool chck1 = obj.getdata("select * from CategoryMaster where id!='" + Convert.ToInt32(TextBox1.Text) + "' and CategoryName='" + TextCategory.Text + "' ");
             if (chck1 == true)
             {
                 LabelErr.Text = "Record already exists! Choose another";
             }
             else
             {
                 obj.cmd.Parameters.AddWithValue("@categ", TextCategory.Text);
                 obj.ExecuteQueries("update CategoryMaster set categoryname =@categ where id='" + TextBox1.Text + "'");
                 GridView1.DataBind();
                 TextCategory.Text = "";
                 LabelErr.Text = "Your record has been updated!";
             }
         }
         else
         {
             LabelErr.Text = "Please Enter the field!";
         }
    }
    protected void ButtonReset_Click(object sender, EventArgs e)
    {
        TextCategory.Text = "";
        LabelErr.Text="";
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        LabelCount.Text = GridView1.Rows.Count.ToString();
    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        string srch = "";
        if (TextCategory.Text != "")
        {
            srch = srch + "and categoryName like '" + TextCategory.Text + "%'";
        }
        SqlDataSource1.SelectCommand = "select * from CategoryMaster where id>0" + srch;

        GridView1.DataBind();
    }
}
