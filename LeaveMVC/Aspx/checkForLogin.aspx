<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkForLogin.aspx.cs" Inherits="Leave.Aspx.checkForLogin" %>
<%@ Import Namespace="LeaveMVC.App_Code" %>
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
            string username = Request.QueryString["username"];
            string password = Request.QueryString["password"];
            LoginAuthorization l = new LoginAuthorization();
            Boolean isUser = l.checkUser(username, password);
            if(isUser == true)
            {
                int EmpID = l.getEmpID();
                Session["EmpID"] = EmpID;
                Response.Redirect("LeaveFormVersionTwo.aspx");
                //Response.Redirect("/LeaveApply/ApplicationForm");//It is working
            }
            %>
    </div>
    </form>
</body>
</html>
