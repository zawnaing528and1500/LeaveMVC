using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using LeaveMVC.App_Code;

namespace LeaveMVC.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult checkUsernameAndPassword()
        {
            string username = Request.Form["username"];
            string password = Request.Form["password"];
            LoginAuthorization l = new LoginAuthorization();
            if (l.checkUser(username, password))
            {
                int EmpID = l.getEmpID();
                Session["EmpID"] = EmpID;
                //Actually, it is needed to redirect to pending/approved leave request
                Response.Redirect("/LeaveApply/ApplicationForm");
            }
            return View();
        }


    }
}