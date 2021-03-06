﻿using System;
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

public partial class ManageClients : System.Web.UI.Page
{
    Connection obj = new Connection();

    public void reset()
    {
        TextGname.Text = "";
        DdlCategory.SelectedIndex = 0;
        txtboxGST.Text = "";
        TextMail.Text = "";
        TextUser.Text = "";
        TextBoxPass.Text = "";
        TextNo.Text = "";
        Textadd1.Text = "";
        Textadd2.Text = "";
        TextCity.Text = "";
        TextStt.Text = "";
        DropDownList1.SelectedIndex = 0;
        TextId.Text = "";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            obj.FillDdl("select Id,CategoryName from CategoryMaster ", "CategoryMaster", DdlCategory, "CategoryName", "id", "-select category-");
        }
    }
    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        Page.Validate("A");
        if (Page.IsValid)
        {
            string imagename = "";
            string nopic = "";
            if (FileUpload1.FileName != "")
            {
                //check extension
                string ext = System.IO.Path.GetExtension(FileUpload1.FileName);
                ext = ext.ToLower();
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string appendname = DateTime.Now.ToString("ddMMyyyyhhmmsstt");
                    FileUpload1.SaveAs(Server.MapPath("./uploads/" + appendname + FileUpload1.FileName));
                    imagename = appendname + FileUpload1.FileName.ToString();
                    obj.cmd.Parameters.AddWithValue("@imgname", appendname + FileUpload1.FileName);
                    nopic = FileUpload1.FileName;
                }
                else
                {
                    // lblerr.Text = "Please upload an image in( jpg, png, gif, jpeg format)";
                }
            }
            else
            {
                nopic = "nopic.jpg";
            }

            bool chck1 = obj.getdata("select * from ManageGuards where GuardName='" + TextGname.Text + "' or GuardUserid='" + TextUser.Text + "'");
            if (chck1 == true)
            {
                LabelErr.Text = "User already exists! Choose another";
            }
            else
            {
                int id = obj.GenerateID("ManageGuards");
                obj.cmd.Parameters.AddWithValue("@idd", id);
                obj.cmd.Parameters.AddWithValue("@Gname", TextGname.Text);
                obj.cmd.Parameters.AddWithValue("@cat", DdlCategory.SelectedValue);

                obj.cmd.Parameters.AddWithValue("@ml", TextMail.Text);
                obj.cmd.Parameters.AddWithValue("@usr", TextUser.Text);
                obj.cmd.Parameters.AddWithValue("@pas", TextBoxPass.Text);
                obj.cmd.Parameters.AddWithValue("@No", TextNo.Text);
                obj.cmd.Parameters.AddWithValue("@Add1", Textadd1.Text);
                obj.cmd.Parameters.AddWithValue("@add2", Textadd2.Text);
                obj.cmd.Parameters.AddWithValue("@cty", TextCity.Text);
                obj.cmd.Parameters.AddWithValue("@stt", TextStt.Text);
                obj.cmd.Parameters.AddWithValue("@pic", FileUpload1.FileName);
                obj.cmd.Parameters.AddWithValue("@proof", DropDownList1.SelectedValue.ToString());
                obj.cmd.Parameters.AddWithValue("@idno", TextId.Text);
                obj.ExecuteQueries("insert into ManageGuards (id,GuardName,F_CategoryId,GuardEmail,GuardUserid,GuardPass,AddressLine1,AddressLine2,contactno,City,State,GuardPhoto,GuardIdProof,GuardIdNo)" +
                "values(@idd,@Gname,@cat,@ml,@usr,@pas,@No,@Add1,@add2,@cty,@stt,@pic,@proof,@idno)");
                GridView1.DataBind();
                reset();
                LabelErr.Text = "Guard Added successfully";
            }
        }
        else
        {
            LabelErr.Text = "Fill all the fields!";
        }


        int idd = obj.GenerateID("ManageGuards");
        obj.cmd.Parameters.AddWithValue("@idd", idd);
        obj.cmd.Parameters.AddWithValue("@Gname",TextGname.Text);
        obj.cmd.Parameters.AddWithValue("@cat", DdlCategory.SelectedValue);
        obj.cmd.Parameters.AddWithValue("@tax", txtboxGST.Text);

        obj.cmd.Parameters.AddWithValue("@ml", TextMail.Text);
        obj.cmd.Parameters.AddWithValue("@usr", TextUser.Text);
        obj.cmd.Parameters.AddWithValue("@pas", TextBoxPass.Text);
        obj.cmd.Parameters.AddWithValue("@No", TextNo.Text);
        obj.cmd.Parameters.AddWithValue("@Add1", Textadd1.Text);
        obj.cmd.Parameters.AddWithValue("@add2", Textadd2.Text);
        obj.cmd.Parameters.AddWithValue("@cty", TextCity.Text);
        obj.cmd.Parameters.AddWithValue("@stt", TextStt.Text);
        obj.cmd.Parameters.AddWithValue("@pic", FileUpload1.FileName);
        obj.cmd.Parameters.AddWithValue("@proof",DropDownList1.SelectedItem.Text);
        obj.cmd.Parameters.AddWithValue("@idno", TextId.Text);
        obj.ExecuteQueries("insert into ManageGuards (id,GuardName,F_CategoryId,GuardTaxNo,GuardEmail,GuardUserid,GuardPass,AddressLine1,AddressLine2,contactno,City,State,GuardPhoto,GuardIdProof,GuardIdNo)" +
        "values(@idd,@Gname,@cat,@tax,@ml,@usr,@pas,@No,@Add1,@add2,@cty,@stt,@pic,@proof,@idno)");
        GridView1.DataBind();
        reset();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       // Response.Write("<script>alert('p')</script>");
        DataSet dss = obj.fetchdatset("select * from ManageGuards where id='" + TextBox1.Text + "'", "fetch");
        foreach (DataRow drr in dss.Tables["fetch"].Rows)
        {
            TextGname.Text = drr["GuardName"].ToString();
            DdlCategory.SelectedValue=drr["F_CategoryId"].ToString();
            TextMail.Text = drr["GuardEmail"].ToString();
            TextUser.Text = drr["GuardUserid"].ToString();
            TextBoxPass.Text = drr["GuardPass"].ToString();
            TextNo.Text = drr["contactno"].ToString();
            Textadd1.Text = drr["AddressLine1"].ToString();
            Textadd2.Text = drr["AddressLine2"].ToString();
            TextCity.Text=drr["City"].ToString();
            TextStt.Text=drr["State"].ToString();
            DropDownList1.SelectedValue = drr["GuardIdProof"].ToString();
           
            TextId.Text = drr["GuardIdNo"].ToString();

            imgdemo.Attributes.Add("src", "uploads/" + drr["GuardPhoto"].ToString());
            LabelErr.Text = "Record Entered successfully";

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
   
   
    protected void ButtonUpdate_Click(object sender, EventArgs e)
    {
        Page.Validate("A");
        if (Page.IsValid)
        {

            bool chck1 = obj.getdata("select * from ManageGuards where id!='" + Convert.ToInt32(TextBox1.Text) + "' and (GuardName='" + TextGname.Text + "' or GuardUserid='" + TextUser.Text + "')");
            if (chck1 == true)
            {
                LabelErr.Text = "Record already exists! Choose another";
            }
            else
            {
                obj.cmd.Parameters.AddWithValue("@Gname", TextGname.Text);
                obj.cmd.Parameters.AddWithValue("@cat", DdlCategory.SelectedValue);
                obj.cmd.Parameters.AddWithValue("@ml", TextMail.Text);
                obj.cmd.Parameters.AddWithValue("@usr", TextUser.Text);
                obj.cmd.Parameters.AddWithValue("@pas", TextBoxPass.Text);
                obj.cmd.Parameters.AddWithValue("@No", TextNo.Text);
                obj.cmd.Parameters.AddWithValue("@Add1", Textadd1.Text);
                obj.cmd.Parameters.AddWithValue("@add2", Textadd2.Text);
                obj.cmd.Parameters.AddWithValue("@cty", TextCity.Text);
                obj.cmd.Parameters.AddWithValue("@stt", TextStt.Text);
                obj.cmd.Parameters.AddWithValue("@pic", FileUpload1.FileName);
                obj.cmd.Parameters.AddWithValue("@proof", DropDownList1.SelectedItem.Text);
                obj.cmd.Parameters.AddWithValue("@idno", TextId.Text);
                obj.ExecuteQueries("update ManageGuards set GuardName=@Gname,F_CategoryId=@cat,GuardEmail=@ml,GuardUserid=@usr,GuardPass=@pas,AddressLine1=@Add1,AddressLine2=@add2,contactno=@no,City=@cty,State=@stt,GuardPhoto=@pic,GuardIdProof=@proof,GuardIdNo=@idno where id='" + TextBox1.Text + "'");
                GridView1.DataBind();
                LabelErr.Text = "Record updated successfully";
                reset();
            }
        }
        else
        {
            LabelErr.Text = "Fill all the fields!";
        }
    }
    protected void ButtonReset_Click(object sender, EventArgs e)
    {
        reset();
        LabelErr.Text = "";
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "remove")
        {
            SqlDataSource1.DeleteCommand="delete from ManageGuards where id=" + e.CommandArgument;
            SqlDataSource1.Delete();
            GridView1.DataBind();
            LabelErr.Text = "Record Deleted successfully";
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        LabelCount.Text = GridView1.Rows.Count.ToString();
    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        string srch="";
            if(TextGname.Text!="")
        {
            srch = srch + "and GuardName like '" + TextGname.Text + "%'";
        }
            if (DdlCategory.SelectedIndex != 0)
            {
                srch = srch + "and F_CategoryId like '" + DdlCategory.SelectedValue + "%'";
            }
            if (TextMail.Text != "")
            {
                srch = srch + "and GuardEmail like '" + TextMail.Text + "%'";
            }
            if (TextUser.Text != "")
            {
                srch = srch + "and GuardUserid like '" + TextUser.Text + "%'";
            }


            SqlDataSource1.SelectCommand = "select * from ManageGuards where id>0" + srch;
           
            GridView1.DataBind();
    }
}
