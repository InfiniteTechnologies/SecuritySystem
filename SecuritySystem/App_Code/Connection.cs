using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
//using AjaxControlToolkit;
using System.Data.SqlClient;


/// <summary>
/// Summary description for Connection
/// </summary>
public class Connection
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SecuritySystem"].ToString());
    public SqlCommand cmd = new SqlCommand();
    public SqlDataReader dr;

    public SqlDataAdapter adp = new SqlDataAdapter();

    public string str;
    public DataSet ds = new DataSet();

	public Connection()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void Connect()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
    }

    public void ExecuteQueries(string qry)
    {
        Connect();
        cmd.Connection = con;
        cmd.CommandText = qry;
        cmd.ExecuteNonQuery();
        con.Close();
    }

   

    public void FillDdl(string qry, string tbl, DropDownList ddl, string display, string value, string sText)
    {
        DataRow rw;
        if (ds.Tables.Contains(tbl))
        {
            ds.Tables.Remove(tbl);
        }
        Connect();
        cmd.Connection = con;
        cmd.CommandText = qry;
        adp.SelectCommand = cmd;
        adp.Fill(ds, tbl);
        con.Close();
        rw = ds.Tables[tbl].NewRow();
        rw[0] = "-1";
        rw[1] = sText;
        ds.Tables[tbl].Rows.InsertAt(rw, 0);
        ddl.DataSource = ds.Tables[tbl];
        ddl.DataTextField = display;
        ddl.DataValueField = value;
        ddl.DataBind();
    }
    public bool getdata(string query)
    {
        try
        {
            Connect();
            cmd.Connection = con;
            cmd.CommandText = query;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {

                return true;
            }
        }
        catch (Exception ex)
        {
            return false;
        }
        return false;
    }
    public DataSet fetchdatset(string qry, string tbl)
    {
        try
        {
            if (ds.Tables.Contains(tbl))
            {
                ds.Tables.Remove(tbl);
            }
            Connect();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = qry;
            adp.SelectCommand = cmd;
            adp.Fill(ds, tbl);
            con.Close();
            return ds;
        }
        catch (Exception ex)
        {
            return ds;
        }
    }


    public DataSet createDataSet(string qry, string tbl)
    {
        DataSet dsret = new DataSet();
        str = qry;
        Connect();
        cmd.Connection = con;
        cmd.CommandText = str;
        adp.SelectCommand = cmd;
        adp.Fill(dsret, tbl);
        con.Close();
        return dsret;
    }


    public int GenerateID(string tbl)
    {
        string str1 = "select isnull(max(id),0)+1 from " + tbl;
        int id = 0;
        Connect();
        cmd.Connection = con;
        cmd.CommandText = str1;
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            id = Convert.ToInt32(dr[0]);

        } con.Close();

        return id;
    }

}
