<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PassParameter2.aspx.cs" Inherits="Leave.Aspx.PassParameter2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <%
        String s1 = Request.QueryString["field1"].ToString();
        String s2 = Request.QueryString["field2"].ToString();
         %>

        <%=s1 %>
        <%=s2 %>
        <%-- Response.Redirect(action,controller) --%>
    </div>
    </form>
</body>
</html>
