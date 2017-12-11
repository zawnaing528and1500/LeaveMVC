﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoignForm.aspx.cs" Inherits="Leave.Aspx.LoignForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <link rel="stylesheet" href="http://localhost:58756/Content/bootstrap.css" />
  <link rel="stylesheet" href="http://localhost:58756/Content/leave.css" />
  <link rel="stylesheet" href="http://localhost:58756/Content/bootstrap.min.css" />
    <title></title>
    <style>
       

body {
	background: #eee !important;	
}

.wrapper {	
	margin-top: 80px;
  margin-bottom: 80px;
}

.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0,0,0,0.1);  

  .form-signin-heading,
	.checkbox {
	  margin-bottom: 30px;
	}

	.checkbox {
	  font-weight: normal;
	}

	.form-control {
	  position: relative;
	  font-size: 16px;
	  height: auto;
	  padding: 10px;
		@include box-sizing(border-box);

		&:focus {
		  z-index: 2;
		}
	}

	input[type="text"] {
	  margin-bottom: -1px;
	  border-bottom-left-radius: 0;
	  border-bottom-right-radius: 0;
	}

	input[type="password"] {
	  margin-bottom: 20px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
}

    </style>
</head>
<body>
     <div class="wrapper">
    <form action="checkForLogin.aspx" class="form-signin" id="form1" method="get" name="form1">     
      <h2 class="form-signin-heading">Please login</h2>
      <input type="text" class="form-control" name="username" placeholder="First Name-FiguerID" required="" autofocus="" /><br />
      <input type="password" class="form-control" name="password" placeholder="Password" required=""/><br />  
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    </form>
  </div>
</body>
</html>
