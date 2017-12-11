<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertLeaveDetails.aspx.cs" Inherits="Leave.Aspx.InsertLeaveDetails" %>
<%@ Import Namespace="Leave.App_Code" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Diagnostics" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div>
    <%
        string EmloyeeID = Session["EmpID"].ToString();
        int EmpID = Int32.Parse(EmloyeeID);

        string Mobile= Request.QueryString["mobile"];
        string ComboValue = Request.QueryString["HComboValue"];
        string StartDate= Request.QueryString["HStartDate"];
        string EndDate= Request.QueryString["HEndDate"];
        string OneDay= Request.QueryString["HOneDay"];//ishalfday, iscompasionate
        string DateDiff= Request.QueryString["HDateDiff"];
        string Handover= Request.QueryString["HHandover"];

        string[] separater = { "," };
        string[] comboValue = ComboValue.Split(separater, StringSplitOptions.RemoveEmptyEntries);
        string[] startDate = StartDate.Split(separater, StringSplitOptions.RemoveEmptyEntries);
        string[] endDate = EndDate.Split(separater, StringSplitOptions.RemoveEmptyEntries);
        string[] oneDay = OneDay.Split(separater, StringSplitOptions.None);
        string[] dateDiff = DateDiff.Split(separater, StringSplitOptions.RemoveEmptyEntries);

        string Reason= Request.QueryString["reason"];
        string isHalfDay = Request.QueryString["HIsHalfDay"];
        string isCompassionate = Request.QueryString["HIscompassionate"];
        Boolean checkForHalfDay = false;
        Boolean checkForCompassionate = false;
        int handover = 0;
        if(isHalfDay == "full day" || isHalfDay == "first half day" || isHalfDay == "second half day")
        {
            checkForHalfDay = true;
        }
        if(isCompassionate == "compassionate")
        {
            checkForCompassionate = true;
        }
        //ReplaceEmpID
        if(Handover != null)
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

            Leave lea = new Leave();
            int LeaveID = lea.getLeaveID(LeaveName);

            double diff2= (eDate - sDate).TotalDays;
            int Diff = Convert.ToInt32(diff2);
            Diff = Diff + 1;
            decimal diff = Convert.ToDecimal(Diff);

            lea.InsertLeaveRequest(EmpID, Reason, sDate, eDate,Diff,checkForHalfDay,checkForCompassionate,handover);
            lea.InsertLeaveRequestToUsedLeave(EmpID, LeaveID, sDate, eDate,diff);
            i = i + 1;
        }
        Response.Redirect("leaveFormVersionTwo.aspx");
%>

    </div>
    
</body>
</html>
