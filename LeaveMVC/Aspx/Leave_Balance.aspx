<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Leave_Balance.aspx.cs" Inherits="Leave.Aspx.Leave_Balance" %>
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
            Session["EmpID"] = "1";
            string EmloyeeID = Session["EmpID"].ToString();
            int x = Int32.Parse(EmloyeeID);
                 Leave l = new Leave();
             %>
        <table border="1px">
            <tr><th>Leave Type</th><th>Allowed Days</th><th>Used</th><th>Balance</th></tr>
            <tr><td>Casual Leave</td><td><%=l.getLeaveDay(1)%></td><td><%=l.getUsedLeave(x,1)%></td>
                <td>
                <%
                    int left1 = l.getLeaveDay(1) - l.getUsedLeave(x, 1);
                %>
                <%=left1 %>
                </td></tr>
            <tr><td>Earn Leave</td><td><%=l.getLeaveDay(2)%></td><td><%=l.getUsedLeave(x,2)%></td>
                <td>
                <%
                    int left2 = l.getLeaveDay(2) - l.getUsedLeave(x, 2);
                %>
                <%=left2 %>
                </td></tr>
            <tr><td>Medical Leave</td><td><%=l.getLeaveDay(3)%></td><td><%=l.getUsedLeave(x,3)%></td>
                <td>
                <%
                    int left3 = l.getLeaveDay(3) - l.getUsedLeave(x, 3);
                %>
                <%=left3 %>
                </td></tr>    
            <tr><td>Maternity Leave</td><td><%=l.getLeaveDay(4)%></td><td><%=l.getUsedLeave(x,4)%></td>
                <td>
                <%
                    int left4 = l.getLeaveDay(4) - l.getUsedLeave(x, 4);
                %>
                <%=left4 %>
                </td></tr>
            <tr><td>Unpaid Leave</td><td><%=l.getLeaveDay(5)%></td><td><%=l.getUsedLeave(5,4)%></td>
                <td>
                <%
                    int left5 = l.getLeaveDay(5) - l.getUsedLeave(x, 5);
                %>
                <%=left5 %>
                </td></tr>        
        </table>
    </div>
    </form>
</body>
</html>
