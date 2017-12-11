<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveReponsive.aspx.cs" Inherits="Leave.Aspx.LeaveReponsive" %>

<!DOCTYPE html>
<html>
  <head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <style>
            body {
                background-image: url("http://localhost:27975/Image/");
                background-color:darkseagreen;
                font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            }

            .size-1140 .line {
              margin:0 auto;
              max-width:60.25em;
              padding:0 0.625em;
            }

            .box {	
                  border-radius:5px;
                  margin:auto;
                  padding:12px;
                  max-width:1000px;
                }

           fieldset{
                font-size:17px;
                padding:15px;
                width:500px;
} 
        </style>
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

        <script>
            var leaveRequest = new Array();
            var i = 0;
        function myFunction() {
            
            var comboValue = document.getElementById("comboValue").value;
            var startDate = document.getElementById("sDate").value;
            var endDate = document.getElementById("eDate").value;

            var dateOne = new Date(startDate);
            var dateTwo = new Date(endDate);

            if (dateOne > dateTwo) {
                document.getElementById("error").innerHTML = "<font color='chocolate'>Start date need to earlier than end date.</font>"
            }
            else {

                document.getElementById("error").innerHTML = "";

                if (comboValue == "" || startDate == "" || endDate == "") {
                    document.getElementById("chooseButton").disabled = true
                }
                else {
                    document.getElementById("chooseButton").disabled = false;
                    var leaveRequestArray = comboValue + "  ,  " + startDate + "  ,  " + endDate;
                    leaveRequest.push(leaveRequestArray);
                    printInParagraph();
                }
            }
        }

        function onMouseOverEndDate() {
            document.getElementById("chooseButton").disabled = false;
        }

        function remove(j) {
            var retVal = confirm("Leave request will be removed. Do you want to continue?");
            if (retVal == true) {
                leaveRequest.splice(j, 1);
                printInParagraph();
                return true;
            }
        }
        
        function printInParagraph() {
            var requestString = "<table>";
            for (var j = 0; j < leaveRequest.length ; j++) {
                requestString = requestString + "<tr><td>" + leaveRequest[j] + "</td><td><input type='button' value='Remove' onClick=\"remove(\'" + j + "\')\"></td></tr>";
            }
            requestString = requestString + "</table>"
            document.getElementById("demo").innerHTML =  requestString;
        }

        function checkForOneDay() {
            var startDate = document.getElementById("sDate").value;
            var endDate = document.getElementById("eDate").value;

            var dateOne = new Date(startDate);
            var dateTwo = new Date(endDate);

            if (!(dateOne > dateTwo || dateOne < dateTwo)) {
                document.getElementById("forOneDay").hidden = false;
            }
            else {
                document.getElementById("forOneDay").hidden = true;
            }
        }
        </script>

    </head>
<body class="size-1140">

  <div class="container">
  <div class="row">
    <div class="col-sm-3"><input type="datetime" name="dateS" class="datepicker"  placeholder="Choose Leave Type" /></div>
    <div class="col-sm-3"><input type="datetime" name="dateS" class="datepicker"  placeholder="Enter Start Date" /></div>
    <div class="col-sm-3"><input type="datetime" name="dateS" class="datepicker"  placeholder="Enter End Date" /></div>
    <div class="col-sm-3"><input type="button" value="CHOOSE"/></div>
  </div>
  </div>

    <table class="table">
    <tr>
     <td class="col">
     <select id="comboValue">
      <option value="" required>Select Leave Type</option>
      <option value="Casual Leave">Casual Leave</option>
      <option value="Earn Leave">Earn Leave</option>
      <option value="Medical Leave">Medical Leave</option>
      <option value="Maternity Leave">Maternity Leave</option>
      <option value="Without pay Leave">Leave Without Pay</option>
    </select> 
     </td>  
       <td class="col">
         <input type="datetime" name="dateS" class="datepicker" id="sDate" placeholder="Enter Start Date" onmouseover="onMouseOverEndDate()"/>
       </td>
        <td class="col">
         <input type="datetime" name="dateE" class="datepicker" id="eDate" placeholder="Enter End Date" onmouseover="onMouseOverEndDate()" onmouseout="checkForOneDay()"/>
        </td>
        <td><button class="btn-primary" onclick="myFunction()" id="chooseButton" onmouseover="checkForOneDay()">CHOOSE</button></td>
    </tr>

        <tr id="forOneDay">
        <td>
      <input type="radio" name="gender" value="male" checked> Full Day
        </td>
        <td>
      <input type="radio" name="gender" value="female"> First Half Day
        </td>
        <td colspan="2">
      <input type="radio" name="gender" value="other"> Second Half Day
         </td>
        </tr>

 </table>

</body>
</html>
