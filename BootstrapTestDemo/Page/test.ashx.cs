using BootstrapTestDemo.DataSet1TableAdapters;
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
    /// Summary description for test
    /// </summary>
    /// <summary>
    /// 测试调用bootstrap分页
    /// </summary>
    public class test : IHttpHandler
    {

        SQLDatabase db = new SQLDatabase();
        private int pageSize = 10;//一页显示的数据
        private int pageNumber = 1;//页码
        private string sortName = "";//排序字段
        private string sortOrder = "1";//asc or desc
        private string searchText = "";//关键字

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
                strWhere += string.Format(" (user_no like '%{0}%' or user_name like '%{0}%')", searchText);
            }

            string json = LoadTableByPagination("tb_user", "*", pageNumber, pageSize, Convert.ToInt32(sortOrder), strWhere, "user_no");
            context.Response.Write(json);
            context.Response.End();

        }

        /// <summary>
        /// 调用分页储存过程，返回table的json数据
        /// </summary>
        /// <param name="table">数据库表名</param>
        /// <param name="fields">查询的字段</param>
        /// <param name="pageNumber">当前页码</param>
        /// <param name="pageSize">一页显示的数据</param>
        /// <param name="orderSort">0降序，1升序</param>
        /// <param name="strWhere">查询条件</param>
        /// <param name="orderName">排序字段</param>
        /// <returns></returns>
        string LoadTableByPagination(string table, string fields, int pageNumber, int pageSize, int orderSort, string strWhere, string orderName)
        {
            string json = "";
            SqlParameter[] parameters = {new SqlParameter("@TABLE",SqlDbType.VarChar,50),
                new SqlParameter("@FEILDS",SqlDbType.VarChar,1000),
                new SqlParameter("@PAGE_INDEX",SqlDbType.Int,4),
                new SqlParameter("@PAGE_SIZE",SqlDbType.Int,4),
                 new SqlParameter("@ORDERTYPE",SqlDbType.Bit),
                  new SqlParameter("@ANDWHERE",SqlDbType.VarChar,1000),
                  new SqlParameter("@ORDERFEILD",SqlDbType.VarChar,100)
            };
          
            parameters[0].Value = table;//表格
            parameters[1].Value = fields;//字段
            parameters[2].Value = pageNumber;
            parameters[3].Value = pageSize;
            parameters[4].Value = orderSort;//0是降序，1是升序
            parameters[5].Value = strWhere;//条件
            parameters[6].Value = orderName;//排序字段
            DataSet dataSet = db.RunProcDataSet("pagination", parameters);
            if (dataSet != null)
            {
                DataTable dt = dataSet.Tables[0];
                //后台返回的json数据必须包含total，和rows属性，否则前台没数据
                if (dataSet.Tables[1] != null && dataSet.Tables[1].Rows.Count > 0)
                    json += "{\"total\":" + dataSet.Tables[1].Rows[0]["total"] + ",";
                if (dt != null & dt.Rows.Count > 0)
                    json += "\"rows\":" + DataTableToJson(dt) + "}";
            }
            return json;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        #region Json&DataTable
        /// <summary> 
        /// DataTable转为json 
        /// </summary> 
        /// <param name="dt">DataTable</param> 
        /// <returns>json数据</returns> 
        public static string DataTableToJson(DataTable dt)
        {
            List<Dictionary<string, object>> list = new List<Dictionary<string, object>>();
            foreach (DataRow dr in dt.Rows)
            {
                Dictionary<string, object> result = new Dictionary<string, object>();
                foreach (DataColumn dc in dt.Columns)
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
        }
        #endregion Json&DataTable
    }
}
