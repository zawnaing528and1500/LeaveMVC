<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editLeaveRequest.aspx.cs" Inherits="Leave.Aspx.editLeaveRequest" %>
<!DOCTYPE html>
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
  <!--<script type="text/javascript" src="http://localhost:58756/Content/leaveForm.js"></script>-->

          <script>
              var str = ""; var numberOfLeave;
              var StartDate = new Array();
              var EndDate = new Array();
              var LeaveAllowedDay = new Array();
              var CountOfUsedRegisteredLeave = new Array();
              var leftDay = new Array();
              var comboValue; var startDate; var endDate; var diffOfRequiredDay; var requestString;

                $(function () {
                    $(".datepicker").datepicker();
                    dateFormat: 'yyyy-mm-dd'
                });

                $(document).ready(function () {
                    document.getElementById("forOneDay").hidden = true;
                    document.getElementById("hideOnBoth").hidden = true;

                    $("#forStartDateArray").each(function () {
                        var value = $(this).text()
                        str = value;
                        StartDate = str.split(',');
                    });

                    $("#forEndDateArray").each(function () {
                        var value = $(this).text()
                        str = value;
                        EndDate = str.split(',');
                    });

                    $("#forLeaveAllowedDay").each(function () {
                        var value = $(this).text()
                        str = value;
                        LeaveAllowedDay = str.split(',');
                        numberOfLeave = LeaveAllowedDay.length - 1;
                    });

                    $("#countOfUsedRegisteredLeave").each(function () {
                        var value = $(this).text()
                        str = value;
                        CountOfUsedRegisteredLeave = str.split(',');
                    });

                    for (var i = 0 ; i < LeaveAllowedDay.length ; i++) {
                        leftDay[i] = LeaveAllowedDay[i] - CountOfUsedRegisteredLeave[i];
                    }
                });
              
                function show() {
                    
                    alert(leftDay[0]);
                }

                function myFunction() {
                    var oneDay = null;
                    var duplicate = false;
                    comboValue = document.getElementById("comboValue").value;//1,2,3,4,..
                    var leaveID = parseInt(comboValue);
                    startDate = document.getElementById("sDate").value;//string format
                    endDate = document.getElementById("eDate").value;//string format

                    var dateOne = new Date(startDate);
                    var dateTwo = new Date(endDate);
                    diffOfRequiredDay = dateTwo - dateOne;
                    diffOfRequiredDay = (diffOfRequiredDay / 86400000) + 1;

                    //To compare datetime format, convert them in to string format first
                    for (var k = 0 ; k < StartDate.length ; k++) {


                        var ED = new Date(EndDate[k]);
                        var SD = new Date(StartDate[k]);
                        ED = ED.toString();
                        SD = SD.toString();
                        var DO = dateOne.toString();
                        var DT = dateTwo.toString();

                        if (comboValue == "" || startDate == "" || endDate == "") {
                            document.getElementById("chooseButton").disabled = true;
                            duplicate = true;
                        }
                       
                       else if (DO == SD || DT == ED || DO == ED) {
                           document.getElementById("error").innerHTML = "<font color='chocolate'>Note that you can't last requested date that is still pending.</font>";
                                duplicate = true; break;
                       }
                    }

                    if (duplicate == false) {
                        if (dateOne > dateTwo) {
                            document.getElementById("error").innerHTML = "<font color='chocolate'>Start date need to earlier than end date.</font>";
                        }
                        else if (leftDay[leaveID] < 1) {
                            document.getElementById("error").innerHTML = "<font color='chocolate'>You Don't left Leave Day in this type.</font>";
                        }
                            document.getElementById("error").innerHTML = "";
                            document.getElementById("chooseButton").disabled = false;


                            document.getElementById("HC").value = comboValue;//1,2,3,...
                            document.getElementById("HS").value = startDate;
                            document.getElementById("HE").value = endDate;
                            document.getElementById("HD").value = diffOfRequiredDay;

                            if (document.getElementsByName('gender').value != null) {
                                document.getElementById("HIH").value = document.getElementsByName('gender').value;
                            }

                            if (document.getElementsByClassName('compassionate').value != null) {
                                document.getElementById("HI").value = document.getElementsByClassName('compassionate').value;
                            }

                            alert("success");
                            printInParagraph();

                    }
                }

                function printInParagraph() {
                    requestString = "<div style='overflow-x:auto;'><table class='borderTable'>";
                    requestString = requestString + "<th>Leave Type</th><th class='hideTd'>Start Date</th><th class='hideTd'>End Date</th><th class='hideTd'>Day</th><th></th>";
             
                    requestString = requestString + "<tr><td>" + $("#comboValue option:selected").text() + "</td><td class='hideTd'>" + startDate + "</td><td class='hideTd'>" + endDate + "</td><td>" + diffOfRequiredDay + "</td><td>&nbsp&nbsp<img src='http://localhost:58756/Image/delete.png'></td></tr>";
       
                    requestString = requestString + "</table></div>"
                    document.getElementById("demo").innerHTML = requestString;
                }

                function onMouseOverEndDate() {
                    document.getElementById("chooseButton").disabled = false;
                }
                
                function checkForLeftDay() {
                    //checkForOneDay();
                    var comboValue = document.getElementById("comboValue").value;//get LeaveID from SelectBox
                    var leftLeaveDay = leftDay[comboValue];//get left day for a particular leave type
                    alert(leftLeaveDay);
                }

                function checkForOneDay() {
                    var startDate = document.getElementById("sDate").value;
                    var endDate = document.getElementById("eDate").value;
                    var dateOne = new Date(startDate);
                    var dateTwo = new Date(endDate);
                    var radios = document.getElementsByName('gender');
                    var compassionate = document.getElementsByClassName('compassionate');
                    var isHalf;
                    var isCompassionate;
                    for (var i = 0, length = radios.length; i < length; i++) {
                        if (radios[i].checked) {
                            isHalf = radios[i].value;
                            radios[i].checked = false;
                            break;
                        }
                        document.getElementById("HIH").value = isHalf;
                    }

                    for (var i = 0; compassionate[i]; ++i) {
                        if (compassionate[i].checked) {
                            isCompassionate = compassionate[i].value;
                            compassionate[i].checked = false;
                            break;
                        }
                    }
                    document.getElementById("HI").value = isCompassionate;

                    var diff = dateTwo - dateOne;
                    if (!(dateOne > dateTwo || dateOne < dateTwo)) {
                        document.getElementById("forOneDay").hidden = false;
                        document.getElementById("requiredDay").innerHTML = (diff / 86400000) + 1;
                    }
                    else {
                        document.getElementById("forOneDay").hidden = true;
                        document.getElementById("requiredDay").innerHTML = (diff / 86400000) + 1;
                    }

                    for(var  i = 0 ; i< LeaveAllowedDay.length ; i++){
                        leftDay[i] = LeaveAllowedDay[i] - CountOfUsedRegisteredLeave[i];
                    }
                }
              </script>
      

    </head>
<body style="background-color:#F6F9ED"><br />
                         <%

                             int numberOfRegisteredLeave = 0;
                             Session["EmpID"] = 1;
                             string EmloyeeID = Session["EmpID"].ToString();
                             int x = Int32.Parse(EmloyeeID);
                             Leave l = new Leave();
                         %>

<center>
        <p class="pageSize">
        
                <div id="hideOnBoth">
                <select id="forStartDateArray">
                                             <% 
                                                 LeaveRequest le = new LeaveRequest();
                                                 DataTable dt1 = le.GetStartDateForArray(x);
                                                 foreach (DataColumn col in dt1.Columns)
                                                 {
                                                     foreach (DataRow row in dt1.Rows)
                                                     {
                                                         string name = row[col.ColumnName].ToString();
                                                        %>
                                                <option value=""><%=name %>,</option> 
                                                    <% 
                                                        }
                                                    }
                                                %>
                </select>
                <select id="forEndDateArray">
                     <% 
                         DataTable dt2 = le.GetEndDateForArray(x);
                         foreach (DataColumn col in dt2.Columns)
                         {
                             foreach (DataRow row in dt2.Rows)
                             {
                                 string name = row[col.ColumnName].ToString();
                                                        %>
                                                <option value=""><%=name %>,</option> 
                                                    <% 
                                                        }
                                                    }
                                                %>
                </select>
                <select id="forLeaveAllowedDay">
                     <% 
                         DataTable dt4 = le.GetLeaveAllowDay();
                         foreach (DataColumn col in dt4.Columns)
                         {
                             foreach (DataRow row in dt4.Rows)
                             {
                                 string name = row[col.ColumnName].ToString();
                                                        %>
                                                <option value=""><%=name %>,</option> 
                                                    <% 
                                                                numberOfRegisteredLeave++;
                                                            }
                                                        }
                                                %>
                </select>
                <select id="countOfUsedRegisteredLeave">
                    <%
                        LeaveRequest l1 = new LeaveRequest();
                        for(int j = 1; j < numberOfRegisteredLeave; j++)
                        {%>
                            <option value=""><%=l1.getCountOfUsedRegisteredLeave(j, x)%>,</option> 
                       <%} %>
                </select>
                </div>

        <div class="box">
    	<div class="row">
		<div class="col-md-3">
             <select id="comboValue" class="select" style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
              <option value="" required>Select Leave Type</option>
                <% 
                    DataTable dt3 = le.GetLeaveName();
                    foreach (DataColumn col in dt3.Columns)
                    {
                        int i = 0;
                        foreach (DataRow row in dt3.Rows)
                        {
                            string name = row[col.ColumnName].ToString();
                                                        %>
                                                <option value="<%=i %>"><%=name %></option> 
                                                    <% i = i + 1;
                                                        }
                                                    }
                                                %>
            </select>
            <input type="button" value="CLICK" onclick="show()"/>
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
        

    <table align="center" class="table">
        <tr id="forOneDay" class="col-sm-12">
        <td>
      <input type="radio" name="gender" value="full day" onmouseout="checkForOneDay()"> Full Day
        </td>
        <td>
      <input type="radio" name="gender" value="first half day" onmouseout="checkForOneDay()"> First Half Day
        </td>
        <td colspan="2">
      <input type="radio" name="gender" value="second half day" onmouseout="checkForOneDay()"> Second Half Day
         </td>
        </tr>
    </table> 
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
    <br/>
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
		            </div>
                    <div class="col-md-6">
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



