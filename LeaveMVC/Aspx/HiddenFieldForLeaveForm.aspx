<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HiddenFieldForLeaveForm.aspx.cs" Inherits="Leave.Aspx.HiddenFieldForLeaveForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        var ComboValue = new Array(1,2,3,4);
        var StartDate = new Array("one","two","three","four");
        var EndDate = new Array(11,22,33,44);
        var OneDay = new Array(111,222,333,444);
        var DateDiff = new Array(1111, 1111, 1111, 1111);

        function addToHidden() {
            for (var i = 0 ; i < ComboValue.length ; i++) {
                document.getElementById("HC").value = document.getElementById("HC").value +","+ ComboValue[i];
            }
        }
    </script>
</head>
<body>
    <form action="InsertLeaveDetails.aspx" id="form1" method="get" name="form1">
     <div class="box">
                <div class="container-fluid">
	                <div class="row">
		                <div class="col-md-6">
                            Enter Your Contact Number: <input type="tel" name="EmpPhone" id="EmployeePhone" pattern="[0-9]{2}-[0-9]{9}" placeholder="09237706765" required />
		                </div>
                        <div class="col-md-6">
                            <textarea cols="30" name="reason" placeholder="Enter Your Leave Reason"></textarea>
                        </div>
                        <input type="hidden" name="HcomboValue" id="HC"/>
                        <input type="hidden" name="HStartDate" id="HS"/>
                        <input type="hidden" name="HEndDate" id="HE"/>
                        <input type="hidden" name="HOneDay" id="HO"/>
                        <input type="hidden" name="HDateDiff" id="HD"/>
                        <input type="button" onclick="addToHidden()" value="LOAD"/>
	                </div>
                </div>
                </div>
                       <input type="submit" value="REQUEST" /> 
    </form>
</body>
</html>
