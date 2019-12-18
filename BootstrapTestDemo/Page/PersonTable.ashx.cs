using BootstrapTestDemo.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace BootstrapTestDemo.Page
{
    /// <summary>
    /// Summary description for PersonTable
    /// </summary>
    public class PersonTable : IHttpHandler
    {
        PersonInfoData db = new PersonInfoData();
        private int pageSize = 10;
        private int pageNumber = 1;
        private string sortName = "";
        private string sortOrder = "1";
        private string searchText = "";

        public void ProcessRequest(HttpContext context)
        {

            if (!string.IsNullOrEmpty(context.Request["pageSize"]))
                pageSize = Convert.ToInt32(context.Request["pageSize"]);

            if (!string.IsNullOrEmpty(context.Request["pageNumber"]))
                pageNumber = Convert.ToInt32(context.Request["pageNumber"]);

            if (!string.IsNullOrEmpty(context.Request["sortName"]))
                sortName = (context.Request["sortName"]);

            if (!string.IsNullOrEmpty(context.Request["sortOrder"]))
            {
                sortOrder = (context.Request["sortOrder"]);
                if (sortOrder == "asc")
                    sortOrder = "1";
                else if (sortOrder == "desc")
                    sortOrder = "0";
            }
            string strWhere = "";
            if (!string.IsNullOrEmpty(context.Request["searchText"]))
            {
                searchText = (context.Request["searchText"]);
                strWhere += string.Format("(Id_p like '%{0}%' or FirstName like '{0}')", searchText);
            }
            string json = LoadTableByPagination("Persons","*",pageNumber,pageSize,Convert.ToInt32(sortOrder),strWhere,"Id_P");
            context.Response.Write(json);
            context.Response.End();

        }

        private string LoadTableByPagination(string table, string fields, int pageNumber, int pageSize, int orderSort, string strWhere, string orderName)
        {
            string json = "";
            SqlParameter[] parameters = {
                new SqlParameter("@TABLE",System.Data.SqlDbType.VarChar,50),
                new SqlParameter("@FEILDS",System.Data.SqlDbType.VarChar,1000),
                new SqlParameter("@PAGE_INDEX",System.Data.SqlDbType.Int,4),
                new SqlParameter("@PAGE_SIZE",System.Data.SqlDbType.Int,4),
                new SqlParameter("@ORDERTYPE",System.Data.SqlDbType.Bit),
                new SqlParameter("@ANDWHERE",System.Data.SqlDbType.VarChar,1000),
                new SqlParameter("@ORDERFEILD",System.Data.SqlDbType.VarChar,100)
            };
            parameters[0].Value = table;
            parameters[1].Value = fields;
            parameters[2].Value = pageNumber;
            parameters[3].Value = pageSize;
            parameters[4].Value = orderSort;
            parameters[5].Value = strWhere;
            parameters[6].Value = orderName;
            DataSet dataSet = db.RunProcDataSet("pagination", parameters);
            if (dataSet != null)
            {
                DataTable dt = dataSet.Tables[0];
                
                if (dataSet.Tables[1] != null && dataSet.Tables[1].Rows.Count > 0)
                    json += "{\"total\":" + dataSet.Tables[1].Rows[0]["total"] + ",";
                if (dt != null & dt.Rows.Count > 0)
                    json += "\"rows\":" + DataTableToJson(dt) + "}";
            }
            return json;
            throw new NotImplementedException();
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        #region Json&DataTable
        private string DataTableToJson(DataTable dt)
        {
            List<Dictionary<string, object>> list = new List<Dictionary<string, object>>();
            foreach(DataRow dr in dt.Rows)
            {
                Dictionary<string,object>result=new Dictionary<string, object>();
                foreach(DataColumn dc in dt.Columns)
                {
                    result.Add(dc.ColumnName, dr[dc]);
                }
                list.Add(result);
            }
            int recursionLimit = 100;
            JavaScriptSerializer serialize = new JavaScriptSerializer();
            serialize.RecursionLimit = recursionLimit;
            serialize.MaxJsonLength = Int32.MaxValue;
            return serialize.Serialize(list);

            throw new NotImplementedException();
        }
        #endregion Json&DataTable


    }
}