<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="passFormData2.aspx.cs" Inherits="Leave.Aspx.passFormData2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div>
        <%
            string fName = Request.QueryString["txtFirstName"];
        %>
        <%=fName %>
    </div>
</body>
</html>
