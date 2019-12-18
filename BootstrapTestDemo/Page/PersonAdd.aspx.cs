using BootstrapTestDemo.Models.PersonDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BootstrapTestDemo.Page
{
    public partial class PersonAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                Session["ASD"] = Request.QueryString["PASSWORD"];
                if (Request.QueryString["PersonId"] != null)
                {
                    string personId = Request["PersonId"];
                    string firstName = Request["FirstName"];
                    string lastName = Request["LastName"];
                    string stateName = Request["StateNmae"];
                    string Address = Request["Address"];
                    Update(personId, firstName, lastName, stateName, Address);
                }

            }

        }
        private void Update(string personid,string firstnakme,string lastname,string statename,string address)
        {
            QueriesTableAdapter adapter = new QueriesTableAdapter();
            int result=Convert.ToInt32(adapter.up_OrgChart_OrgUnintUpdatePersons(Convert.ToInt32(personid), firstnakme, lastname, statename, address));
            Response.Redirect("PersonAdd.aspx?result=" + result);
        }
    }
}