using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Diagnostics;

namespace LeaveMVC.Controllers
{
    public class TestController : Controller
    {
        // GET: Test
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult callClassFunction()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetTextBoxValue()
        {
            string textboxValue = Request.Form["txtOne"];
            string textboxValue1 = Request.Form["txtTwo"];
            //Code To Insert into the Database
            Debug.WriteLine(textboxValue);
            Debug.WriteLine(textboxValue1);
            return View();
        }

        public string useQueryString()
        {
            return Request.QueryString["name"].ToString();
        }


    }
}