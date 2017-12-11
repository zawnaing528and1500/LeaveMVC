<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deletePendingRequest.aspx.cs" Inherits="Leave.Aspx.deletePendingRequest" %>
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
    <form id="form1" runat="server">
    <div>
        <%
            //string EmloyeeID = Session["EmpID"].ToString();
            //int EmpID = Int32.Parse(EmloyeeID);
            int EmpID = 1;

            string Id = Request.QueryString["ID"];
            int ID = Convert.ToInt32(Id);
            LeaveRequest l = new LeaveRequest();
            l.DeletePendingRequestFormUsedLeave(EmpID, ID);
            l.DeletePendingRequest(EmpID, ID);
            Response.Redirect("PendingLeave.aspx");
         %>
    </div>
    </form>
</body>
</html>
