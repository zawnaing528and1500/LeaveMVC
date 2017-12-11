<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test1.aspx.cs" Inherits="Leave.Aspx.Test1" %>
<%@ Import Namespace="Leave.App_Code" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Diagnostics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function display() {
            var txt = document.getElementById("para").innerText;
            alert(txt);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%
            DatabaseAccess d = new DatabaseAccess();
            DataTable dt = d.GetData();
            foreach (DataColumn col in dt.Columns)
            {
            foreach (DataRow row in dt.Rows)
                {%>
                  <%=row[col.ColumnName].ToString() %>           
                <% }
                 }
                    ClassProgram1 c = new ClassProgram1();
                    string[] values = c.getTrimData();
                    foreach(var item in values)
                        {%>
                         <%=item.ToString() %>
                       <%}%>
    </div>
      <p id="para">This is the text to display</p>
      <input type="button" value="DISPLAY" onclick="display()" />
    </form>
</body>
</html>

