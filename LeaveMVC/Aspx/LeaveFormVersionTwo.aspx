﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveFormVersionTwo.aspx.cs" Inherits="Leave.Aspx.LeaveFormVersionTwo" %>

<%@ Import Namespace="Leave.App_Code" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Diagnostics" %>
<!DOCTYPE html>
<html>
  <head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <link rel="stylesheet" href="http://localhost:58756/Content/bootstrap.css" />
  <link rel="stylesheet" href="http://localhost:58756/Content/leave.css" />
  <link rel="stylesheet" href="http://localhost:58756/Content/bootstrap.min.css" />
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">
  <link rel="stylesheet" href="http://localhost:58756/Content/buttons.css">
  <script type="text/javascript" src="http://localhost:58756/Content/buttons.js"></script>
  <script type="text/javascript" src="http://localhost:58756/Content/leaveForm.js"></script>
          <script>
              $(document).ready(function () {
                  document.getElementById("forOneDay").hidden = true;
              });
          </script>
         <script>
        $(function () {
            $(".datepicker").datepicker();
            dateFormat: 'yyyy-mm-dd'
        });
         </script>

    </head>
<body style="background-color:#F6F9ED"><br />
                         <%
                        Session["EmpID"] = 1;
                        string EmloyeeID = Session["EmpID"].ToString();
                        int x = Int32.Parse(EmloyeeID);
                             Leave l = new Leave();
                         %>

<center>
        <p class="pageSize">
            <div class="hideOnPhone">
            <div class="container-fluid">
                <div class="widebox">
	            <div class="row">
		            <div class="col-md-12">
			            <div class="row">
				            <div class="col-md-6" align="left" style="color:#8B7D6B">
                                <table>
                                    <tr><td>Name:</td><td> <%=l.getEmpName(x)%></td></tr>
                                    <tr><td>Figer ID:</td><td><%=l.getFingerID(x) %></td></tr>
      
                                   <tr><td>Position:</td><td>No Position Table</td></tr>                    
                                    <tr><td></td><td></td></tr>
                                </table>
				            </div>
				            <div class="col-md-6" align="right" style="color:#8FBC8F;">
                                <table>
                                    <tr><td>Apply Date:</td><td> <%=DateTime.Now.ToString("yyyy-MM-dd")%></td></tr>
                                   <tr><td>Employ Date:</td><td> <%=l.getEmployDate(x) %></td></tr>
                                    <tr><td>Approval Date:</td><td><%=l.getApprovalDate(x)%> </td></tr>
                                    <tr><td colspan="2">
                                        <select class="select" id="handoverSelect" onmouseover="checkHandover()">
                                            <option value="">Enter Handover Employee</option>
                                            <% 
                                                int ini = 1;
                                                Leave le = new Leave();
                                                int branch = le.getBranch(x);
                                                int dept = le.getDept(x);
                                                DataTable dt1 = le.GetHandOverEmployee(branch,dept);
                                                foreach (DataColumn col in dt1.Columns)
                                                {
                                                    foreach (DataRow row in dt1.Rows)
                                                    {
                                                         string name = row[col.ColumnName].ToString();
                                                        %>
                                                <option value="<%=le.getFigerID(name) %>"><%=name %></option> 
                                                    <% 
                                                            ini = ini + 1;
                                                        }
                                                    }
                                                %>
                                          </select>
                                          FingerID:<span id="fingerID"></span>
                                        </td></tr>
                                </table>
				            </div>
			            </div>
		            </div>
	            </div>
                </div>
            </div>
           </div>


            <div class="box">
                <div class="row">
                    <div class="col-md-3">Enter Required Leave Duration:</div>
                    <div class="col-md-3"><input type="datetime" name="dateRS" class="datepicker" id="RSDate" placeholder="Start Date"/></div>
                    <div class="col-md-3"><input type="datetime" name="dateRE" class="datepicker" id="REDate" placeholder="End Date"/></div>
                    <div class="col-md-3">Required Day:<span id="requiredDay"></span></div>
                </div>
                <table align="center" class="table">
                    <tr id="forOneDay" class="col-sm-12">
                    <td>
                  <input type="checkbox" class="compassionate" value="compassionate"> Is Compassionate
                    </td>
                    <td>
                  <input type="radio" name="gender" value="full day"> Full Day
                    </td>
                    <td>
                  <input type="radio" name="gender" value="first half day"> First Half Day
                    </td>
                    <td>
                  <input type="radio" name="gender" value="second half day"> Second Half Day
                     </td>
                    </tr>
                </table> 
            </div>
            <hr class="style13">


        <div class="box" onmouseover="checkForOneDay()">
    	<div class="row">
		<div class="col-md-3">
             <select id="comboValue" class="select" style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
              <option value="" required>Select Leave Type</option>
              <option value="Casual Leave">Casual Leave</option>
              <option value="Earn Leave">Earn Leave</option>
              <option value="Medical Leave">Medical Leave</option>
              <option value="Maternity Leave">Maternity Leave</option>
              <option value="Unpaid Leave">Unpaid Leave</option>
            </select>
		</div>
		<div class="col-md-3">
            <input type="datetime" name="dateS" class="datepicker" id="sDate" placeholder="Enter Start Date" onmouseover="onMouseOverEndDate()"/>
		</div>
		<div class="col-md-3">
            <input type="datetime" name="dateE" class="datepicker" id="eDate" placeholder="Enter End Date" onmouseover="onMouseOverEndDate()" onmouseout="checkForOneDay()"/>
		</div>
		<div class="col-md-3">
            <button onclick="myFunction()" id="chooseButton" onmouseover="checkForOneDay()" class="button button-3d-primary button-rounded">CHOOSE</button>
		</div>
	    </div>
    </div>

    <div class="widebox">
        <div class="container-fluid">
	        <div class="row">
                <div class="col-md-12">
			        <div class="row">
                <div class="col-md-4">
                    <div>
                    <table class="borderTable1">
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
                </div>
		        <div class="col-md-8">
                        <p id="error"></p>      
                        <p id="demo"> </p>
		        </div>
                <br />
               </div>
               </div>
	        </div>
        </div>
    </div>
    <br />
            <div onmouseover="addArrayDataToHiddenField()" />
            <form action="InsertLeaveDetails.aspx" id="form1" method="get" name="form1">
            <div class="box">
            <div class="container-fluid">
	            <div class="row">
		            <div class="col-md-6">
                        <input type="tel" name="mobile" id="EmployeePhone" pattern="^\d{2}[-]?\d{5,9}$" placeholder="Enter Mobile Number" required />
                        <input type="hidden" name="HComboValue" id="HC"/>
                        <input type="hidden" name="HStartDate" id="HS"/>
                        <input type="hidden" name="HEndDate" id="HE"/>
                        <input type="hidden" name="HOneDay" id="HO"/><!--To put isCompassionate, first half day, and second half day -->
                        <input type="hidden" name="HDateDiff" id="HD"/>
                        <input type="hidden" name="HIscompassionate" id="HI"/>
                        <input type="hidden" name="HIsHalfDay" id="HIH"/>
                        <input type="hidden" name="HHandover" id="HH"/>
                        <textarea cols="30" class="forTextarea" name="reason" placeholder="Enter Your Leave Reason" required></textarea>
		            </div>
                    <div class="col-md-6">
                       <textarea cols="30" class="forTextarea" name="comment" placeholder="HOD Comment" disabled="true"></textarea> 
                        <input type="submit" value="REQUEST"/>
                    </div>
	            </div>
            </div>
            </form>
            </div>
             <br/>
</div>
</center>


</body>
</html>