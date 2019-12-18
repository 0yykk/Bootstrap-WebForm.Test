using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BootstrapTestDemo.Page
{
    public partial class PersonSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void PersonSearch_PreRender(object sender,System.EventArgs e)
        //{

        //}
        //protected override object SaveViewState()
        //{
        //    object baseState = base.SaveViewState();
        //    string password = EncryptPassword(passwordText);
        //    object[] viewStates = new object[2];
        //    viewStates[0] = baseState;
        //    viewStates[1] = password;
        //    return viewStates;
        //}
        //public static string EncryptPassword(string PasswordString, string PasswordFormat)
        //{
        //    string encryptPassword = null;
        //    if (PasswordFormat == "SHA1")
        //    {
        //        encryptPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(PasswordString, "SHA1");
        //    }
        //    else if (PasswordFormat == "MD5")
        //    {
        //        encryptPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(PasswordString, "MD5");
        //    }
        //    return encryptPassword;
        //}
        //protected override void LoadViewState(object savedState)
        //{
        //    if(null!=savedState)
        //    {
        //        base.LoadViewState(savedState[0]);
        //        string password=(string)savedState[1];
        //        passwordText = DecryptPassword(password);
        //    }
        //    base.LoadViewState(savedState);
        //}
     
        
        private void BindTable()
        {
            
        }
    }
}