<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveForm.aspx.cs" Inherits="Leave.Aspx.LeaveForm" %>

<!DOCTYPE html>
<html>
  <head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <link rel="stylesheet" href="http://localhost:27975/Content/bootstrap.css" />
  <link rel="stylesheet" href="http://localhost:27975/Content/leave.css" />
  <link rel="stylesheet" href="http://localhost:27975/Content/bootstrap.min.css" />
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">
  <link rel="stylesheet" href="http://localhost:27975/Content/buttons.css">
  <script type="text/javascript" src="http://localhost:27975/Content/buttons.js"></script>
        <style>
            body {
                     background-repeat: no-repeat;
                     background-size: auto;
                     background-color:aliceblue;
                     background-image:url("http://localhost:27975/Image/");
                     font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            }

            .box {	
                background-color:lightgoldenrodyellow;
                  border-radius:5px;
                  margin:auto;
                  padding:12px;
                  max-width:900px;
                }

            .widebox {	
                background-color:ghostwhite;
                  border-radius:5px;
                  margin:auto;
                  padding:12px;
                  max-width:900px;
                  min-width:300px;
                }

            .pageSize {
              background-color:azure;
              margin:0 auto;
              max-width:70em;
              padding:0 0.625em;
            }

          .bodyHeadText{font-size:2em;font-family:Monotype Corsiva;} 

           fieldset{
                font-size:17px;
                padding:15px;
                width:500px;
                    }
           input{
                padding: 0;
                height: 40px;
                position: relative;
                left: 0;
                outline: none;
                border: 1px solid #cdcdcd;
                border-color: rgb(182, 255, 0);
                background-color: white;
                font-size: 16px;
            }

            .select {
                width: 225px;
                height: 40px;
                cursor: pointer;
                background-color: white;
                box-shadow: 0 2px 0 white;
                border-radius: 2px;
                      }
             .borderTable{
            border: 1px groove #ECF1EF;
                }

             th{
                 background-color:#EEF3E2;
             }
            @media screen and (max-width: 600px) {
              .hideTd1 {
                clear: both;
                float: left;
                margin: 10px auto 5px 20px;
                width: 28%;
                display: none;
              }
            }


            @media screen and (min-width: 600px) {
                table.borderTable td {
                    min-width:11em;
                }
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

            var ComboValue = new Array();
            var StartDate = new Array();
            var EndDate = new Array();
            var OneDay = new Array();
            var i = 0;
        

        function myFunction() {
            var oneDay = null;
            var duplicate = false;
            var comboValue = document.getElementById("comboValue").value;
            var startDate = document.getElementById("sDate").value;
            var endDate = document.getElementById("eDate").value;
            var dateOne = new Date(startDate);
            var dateTwo = new Date(endDate);

            var radios = document.getElementsByName('gender');

            for (var i = 0, length = radios.length; i < length; i++) {
                if (radios[i].checked) {
                    alert(radios[i].value);
                    OneDay.push(radios[i].value);
                    radios[i].checked = false;
                    break;
                }
            }

            if (ComboValue.length  >= 1) {
                for (var k = 0 ; k < ComboValue.length ; k++) {
                    if (comboValue == ComboValue[k] || startDate == StartDate[k] || endDate == EndDate[k] || startDate == EndDate[k]) {
                        duplicate = true; break;
                    }
                }
            }

            if (dateOne > dateTwo) {
                document.getElementById("error").innerHTML = "<font color='chocolate'>Start date need to earlier than end date.</font>"
            }
            else {
                    document.getElementById("error").innerHTML = "";

                    if (comboValue == "" || startDate == "" || endDate == "") {
                        document.getElementById("chooseButton").disabled = true
                    }
                    else if (duplicate == true) {
                        return;
                    }
                    else {
                        document.getElementById("chooseButton").disabled = false;
                        var leaveRequestArray = comboValue + "  ,  " + startDate + "  ,  " + endDate;
                        leaveRequest.push(leaveRequestArray);
                        ComboValue.push(comboValue);
                        StartDate.push(startDate);
                        EndDate.push(endDate);
                        printInParagraph();
                    }
            }
        }

        function onMouseOverEndDate() {
            document.getElementById("chooseButton").disabled = false;
        }

        function remove(j) {
                leaveRequest.splice(j, 1);
                ComboValue.splice(j, 1);
                StartDate.splice(j, 1);
                EndDate.splice(j, 1);
                printInParagraph();
        }

        function edit(j) {
            var editComboValue = ComboValue[j];
            var editStartValue = StartDate[j];
            var editEndValue = EndDate[j];
            document.getElementById("comboValue").value = editComboValue;
            document.getElementById("sDate").value = editStartValue;
            document.getElementById("eDate").value = editEndValue;
            remove(j);

        }
        
        function printInParagraph() {
            var requestString = "<div style='overflow-x:auto;'><table class='borderTable'>";
            var arrayLength = ComboValue.length;
            if (arrayLength > 0) {
                requestString = requestString + "<th>Leave Type</th><th class='hideTd'>Start Date</th><th class='hideTd'>End Date</th><th></th>";
            }
            for (var j = 0; j < leaveRequest.length ; j++) {
                requestString = requestString + "<tr><td>" + ComboValue[j] + "</td><td class='hideTd'>" + StartDate[j] + "</td><td class='hideTd'>" + EndDate[j] + "</td><td>&nbsp&nbsp<img src='http://localhost:27975/Image/remove.png' onClick=\"remove(\'" + j + "\')\">";
                requestString = requestString + "&nbsp&nbsp<img src='http://localhost:27975/Image/edit.png' onClick=\"edit(\'" + j + "\')\"></td></tr>";
            }
            requestString = requestString + "</table></div>"
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
<body>


<center><br /><br />

   
        <div class="pageSize">

            <div class="box">
            <div class="container-fluid">
	            <div class="row">
		            <div class="col-md-4">Your Available Leave Balances :
		            </div>
		            <div class="col-md-8">
                        Casual Leave = 2 days, Earn Leave = 3 days, Medical Leave = 30 days
		            </div>
	            </div>
            </div>
            </div>

        <div class="box">
    	<div class="row">
		<div class="col-md-3">
             <select id="comboValue" class="select">
              <option value="" required>Select Leave Type</option>
              <option value="Casual Leave">Casual Leave</option>
              <option value="Earn Leave">Earn Leave</option>
              <option value="Medical Leave">Medical Leave</option>
              <option value="Maternity Leave">Maternity Leave</option>
              <option value="Without pay Leave">Leave Without Pay</option>
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
    Chosen Leave Request List<hr />
        <div class="container-fluid">
	        <div class="row">
		        <div class="col-sm-12">
                        <p id="error"></p>      
                        <p id="demo"> </p>
		        </div>
	        </div>
        </div>
    </div>

</div>
</center>


</body>
</html>

