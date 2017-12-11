<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PendingLeave.aspx.cs" Inherits="Leave.Aspx.PendingLeave" %>
<%@ Import Namespace="Leave.App_Code" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Diagnostics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pending Leave Request List</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <link rel="stylesheet" href="http://localhost:27975/Content/bootstrap.css" />
  <link rel="stylesheet" href="http://localhost:27975/Content/leave.css" />
  <link rel="stylesheet" href="http://localhost:27975/Content/bootstrap.min.css" />
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">
  <link rel="stylesheet" href="http://localhost:27975/Content/buttons.css">
    <link rel="stylesheet" href="http://localhost:27975/Content/hover.css">
  <script type="text/javascript" src="http://localhost:27975/Content/buttons.js"></script>
  <script type="text/javascript" src="http://localhost:27975/Content/leaveForm.js"></script>
</head>
<body style="background-color:#F6F9ED"><br />
<center>
<p class="">

    <div class="boxForLeaveRequest">
        <div class="container-fluid">
	        <div class="row">
		        <div class="col-md-12">

                    <form action="PendingLeave.aspx" id="form1" method="get" name="form1">
                        <select id="comboValue" name="status" class="select" style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                          <option value="" required>Select Leave Request Status</option>
                          <option value="pending">Pending Request</option>
                          <option value="approve">Approved Request</option>
                        </select>
                        <input type="submit" value="SEARCH" />
                        <a href="LeaveFormVersionTwo.aspx"><img src='http://localhost:27975/Image/new.png' class="button cta hvr-float-shadow" align="right"/></a>
                    </form>
		        </div>
	        </div>
        </div>
        
        <br />

    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
            <table class="borderTableLeave">
                        <tr><th>From Day</th><th>To Day</th><th>Day</th><th class="hideOnPhone">Reason</th><th class="hideOnPhone">Remark</th><th></th></tr>
                <%
                    int EmpID = 1;DataTable dt;
                    LeaveRequest l = new LeaveRequest();
                    string status = Request.QueryString["status"];
                        if (status == null || status.Equals("pending"))
                        {
                             dt = l.GetPendingLeave(EmpID);
                        }
                        else
                        {
                             dt = l.GetApprovedLeave(EmpID);
                        }
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {%>
                                    <tr>
                                        <td><%=dt.Rows[i][1].ToString() %></td>
                                        <td><%=dt.Rows[i][2].ToString() %></td>
                                        <td><%=dt.Rows[i][3].ToString() %></td>
                                        <td class="hideOnPhone"><%=dt.Rows[i][4].ToString() %></td>
                                        <td class="hideOnPhone"><%=dt.Rows[i][5].ToString() %></td>
                                        <td><a href="deletePendingRequest.aspx?ID=<%=dt.Rows[i][0].ToString() %>"><img src='http://localhost:27975/Image/delete.png' /></a>&nbsp&nbsp<img src='http://localhost:27975/Image/edit.png' /></td>
                                    </tr>
                                     <%}%>

            </table>
		</div>
	</div>
    </div>
    </div>
</p>
</center>
</body>
</html>
