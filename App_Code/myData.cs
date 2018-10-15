using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Configuration;

using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public class myData
{

    string connectionAddress;

    public myData()
    {
        connectionAddress = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;


    }

    public void myExecuteNonQuery(string cmdText, string cmdType, Dictionary<string, object> param)
    {
        var con = new SqlConnection(connectionAddress);
        var cmd = new SqlCommand(cmdText, con);

        cmd.CommandType = cmdType == "stored" ? CommandType.StoredProcedure : CommandType.Text;

        foreach (var par in param )
        {
            cmd.Parameters.AddWithValue(par.Key, par.Value);
        }

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
        //catch{}
        finally
        {
            con.Close();
        }
    }


    public DataSet myExecuteQuery(string cmdText, string cmdType, Dictionary<string, object> param)
    {
        var con = new SqlConnection(connectionAddress);
        var cmd = new SqlCommand(cmdText, con);

        cmd.CommandType = cmdType == "stored" ? CommandType.StoredProcedure : CommandType.Text;
        var da = new SqlDataAdapter(cmd);
        var ds = new DataSet();

        foreach (var par in param)
        {
            cmd.Parameters.AddWithValue(par.Key, par.Value);
        }

        try
        {
            con.Open();
            da.Fill(ds);
        }
        //catch{}
        finally
        {
            con.Close();
        }

        return ds;

    }

}