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

public partial class ManageCllient : System.Web.UI.Page
{
    Connection obj = new Connection();
    public void reset()
    {
        TextCOmpny.Text = "";
        TextClient.Text = "";
        TextMail.Text = "";
        TextPass.Text = "";
        TextNo.Text = "";
        TextADd1.Text = "";
        TextAdd2.Text = "";
        TextCity.Text = "";
        TextState.Text = "";
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        Page.Validate("A");
        if (Page.IsValid)
        {
            
            bool chck1 = obj.getdata("select * from ManageClients where ClientName='" + TextClient.Text + "'");
            if (chck1 == true)
            {
                LabelErr.Text = "Record already exists! Choose another";
            }
            else
            {
                int id = obj.GenerateID("ManageClients");
                obj.cmd.Parameters.AddWithValue("@idd", id);
                obj.cmd.Parameters.AddWithValue("@cmpny", TextCOmpny.Text);
                obj.cmd.Parameters.AddWithValue("@clint", TextClient.Text);
                obj.cmd.Parameters.AddWithValue("@ml", TextMail.Text);
                obj.cmd.Parameters.AddWithValue("@pas", TextPass.Text);
                obj.cmd.Parameters.AddWithValue("@No", TextNo.Text);
                obj.cmd.Parameters.AddWithValue("@Add1", TextADd1.Text);
                obj.cmd.Parameters.AddWithValue("@add2", TextAdd2.Text);
                obj.cmd.Parameters.AddWithValue("@cty", TextCity.Text);
                obj.cmd.Parameters.AddWithValue("@stt", TextState.Text);
                obj.ExecuteQueries("insert into ManageClients (Id,CompanyName,ClientName,ClientEmail,ClientPass,ContactNo,AddressLine1,AddressLine2,City,State)" +
                 "values(@idd,@cmpny,@clint,@ml,@pas,@No,@Add1,@add2,@cty,@stt)");
                GridView1.DataBind();
                reset();
                LabelErr.Text = "Record inserted successfully";
            }
        }
        else
        {
            LabelErr.Text = "Fill all the fields";
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
    protected void ButtonReset_Click(object sender, EventArgs e)
    {
        reset();
        LabelErr.Text = "";
    }
    protected void ButtonUpdate_Click(object sender, EventArgs e)
    { 
        
        Page.Validate("A");
        if (Page.IsValid)
        {

            bool chck1 = obj.getdata("select * from ManageClients where id!='" + Convert.ToInt32(TextBox1.Text) + "' and ClientName='" + TextClient.Text + "' ");
            if (chck1 == true)
            {
                LabelErr.Text = "Record already exists! Choose another";
            }
            else
            {
                obj.cmd.Parameters.AddWithValue("@cmpny", TextCOmpny.Text);
                obj.cmd.Parameters.AddWithValue("@clint", TextClient.Text);
                obj.cmd.Parameters.AddWithValue("@ml", TextMail.Text);
                obj.cmd.Parameters.AddWithValue("@pas", TextPass.Text);
                obj.cmd.Parameters.AddWithValue("@No", TextNo.Text);
                obj.cmd.Parameters.AddWithValue("@Add1", TextADd1.Text);
                obj.cmd.Parameters.AddWithValue("@add2", TextAdd2.Text);
                obj.cmd.Parameters.AddWithValue("@cty", TextCity.Text);
                obj.cmd.Parameters.AddWithValue("@stt", TextState.Text);
                obj.ExecuteQueries("Update ManageClients set CompanyName=@cmpny,ClientName=@clint,ClientEmail=@ml,ClientPass=@pas,ContactNo=@No,AddressLine1=@Add1,AddressLine2=@Add2,City=@cty,State=@stt where id='" + Convert.ToInt32(TextBox1.Text) + "'");

                GridView1.DataBind();
                reset();
                LabelErr.Text = "Record updated successfully";
            }
        }
        else
        {
            LabelErr.Text = "Fill all the fields";
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet dss = obj.fetchdatset("select * from ManageClients where id='" + TextBox1.Text + "'", "fetch");
        foreach (DataRow drr in dss.Tables["fetch"].Rows)
        {
          TextCOmpny.Text=drr["CompanyName"].ToString();
          TextClient.Text = drr["ClientName"].ToString();
          TextMail.Text=drr["ClientEmail"].ToString();
          TextPass.Text = drr["ClientPass"].ToString();
           TextNo.Text=drr["ContactNo"].ToString();
           TextADd1.Text = drr["AddressLine1"].ToString();
           TextAdd2.Text = drr["AddressLine2"].ToString();
            TextCity.Text=drr["City"].ToString(); 
            TextState.Text=drr["State"].ToString();
           
        } 

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "remove")
        {
            SqlDataSource1.DeleteCommand="delete from ManageClients where id=" + e.CommandArgument;
            SqlDataSource1.Delete();
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        LabelCount.Text = GridView1.Rows.Count.ToString();
    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        string srch = "";
        if (TextCOmpny.Text != "")
        {
            srch = srch + "and CompanyName like '" + TextCOmpny.Text + "%'";
        }
        if (TextClient.Text!= "")
        {
            srch = srch + "and ClientName like '" + TextClient.Text + "%'";
        }
        if (TextMail.Text != "")
        {
            srch = srch + "and ClientEmail like '" + TextMail.Text + "%'";
        }
        if (TextPass.Text != "")
        {
            srch = srch + "and ClientPass like '" + TextPass.Text + "%'";
        }


        SqlDataSource1.SelectCommand = "select * from ManageClients where id>0" + srch;

        GridView1.DataBind();
    }
}
