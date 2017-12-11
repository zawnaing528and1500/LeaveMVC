using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Diagnostics;
using Leave.App_Code;
using LeaveMVC.App_Code;

namespace LeaveMVC.Controllers
{
    public class LeaveApplyController : Controller
    {
        // GET: LeaveApply
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult EditForm()
        {
            return View();
        }

        public ActionResult ApplicationForm()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetValueFromLeaveApplicationForm()
        {
            string EmloyeeID = Session["EmpID"].ToString();
            int EmpID = Int32.Parse(EmloyeeID);

            string ComboValue = Request.Form["HComboValue"];
            string StartDate = Request.Form["HStartDate"];
            string EndDate = Request.Form["HEndDate"];
            string DateDiff = Request.Form["HDateDiff"];
            string Handover = Request.Form["HHandover"];
            string Mobile = Request.Form["mobile"];
            string reason = Request.Form["reason"];

            string isCompassionate = Request.Form["HIscompassionate"];
            string isHalfDay = Request.Form["HIsHalfDay"];

            string[] separater = { "," };
            string[] comboValue = ComboValue.Split(separater, StringSplitOptions.RemoveEmptyEntries);
            string[] startDate = StartDate.Split(separater, StringSplitOptions.RemoveEmptyEntries);
            string[] endDate = EndDate.Split(separater, StringSplitOptions.RemoveEmptyEntries);
            string[] dateDiff = DateDiff.Split(separater, StringSplitOptions.RemoveEmptyEntries);

            Boolean checkForHalfDay = false;
            Boolean checkForCompassionate = false;
            int handover = 0;
            if (isHalfDay == "full day" || isHalfDay == "first half day" || isHalfDay == "second half day")
            {
                checkForHalfDay = true;
            }
            if (isCompassionate == "compassionate")
            {
                checkForCompassionate = true;
            }
            //ReplaceEmpID
            if (Handover != null)
            {
                handover = Convert.ToInt32(Handover);
            }
            int i = 0;

            foreach (var word in comboValue)
            {
                string LeaveName = comboValue[i];
                string SDate = startDate[i];
                DateTime sDate = DateTime.Parse(SDate);
                string EDate = endDate[i];
                DateTime eDate = DateTime.Parse(EDate);


                LeaveApply lea = new LeaveApply();
                int LeaveID = lea.getLeaveID(LeaveName);

                double diff2 = (eDate - sDate).TotalDays;
                int Diff = Convert.ToInt32(diff2);
                Diff = Diff + 1;
                decimal diff = Convert.ToDecimal(Diff);

                lea.InsertLeaveRequest(EmpID, reason, sDate, eDate, Diff, checkForHalfDay, checkForCompassionate, handover);
                lea.InsertLeaveRequestToUsedLeave(EmpID, LeaveID, sDate, eDate, diff);
                i = i + 1;
            }
            Response.Redirect("/LeaveApply/ApplicationForm");
            return View();
        }
    }
}