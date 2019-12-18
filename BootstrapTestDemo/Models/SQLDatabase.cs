using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BootstrapTestDemo.Models
{
    public class SQLDatabase
    {
        public DataSet RunProcDataSet(string str, SqlParameter[] parameters)
        {
            SqlConnection conn = new SqlConnection("Data Source=PXTJ-DEV-002;Initial Catalog=TestLogin;Integrated Security=True");
              conn.Open();
               SqlCommand comm = new SqlCommand();
               comm.Connection = conn;
               comm.CommandText = "dbo."+str;
               comm.CommandType = System.Data.CommandType.StoredProcedure;
             comm.Parameters.AddRange(parameters);
          // object result = comm.ExecuteScalar();
            //comm.Connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(comm);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            //comm.Connection.Close();
            return ds;
        }
    }
}