<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>A-team Hospitality | Admin </title>
    <link rel="Stylesheet" type="text/css" href="css/loginstyles.css" />
    <link rel="Stylesheet" type="text/css" href="css/main.css" />    
    <link rel="Stylesheet" type="text/css" href="css/bootstrap.css" /> 
</head>
<body class="login">
    <div class="main-login col-sm-4 col-sm-offset-4">
        <div class="logo">
            <h2>A-team Hospitality</h2>
        </div>
        <div class="box-login">
            <h4> Sign In To Your Account </h4>
            <p>Please enter your name and password to log in.</p>
            <form class="form-login" action="" runat="server">
					    <div>
					        <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
					    </div>
					<fieldset>
					    
						<div class="form-group">
							<span class="input-icon">
                                <asp:TextBox ID="TextBox1" class="form-control" runat="server" placeholder="username"></asp:TextBox>
								
								<i class="glyphicon glyphicon-user"></i> </span>
						</div>
						<div class="form-group form-actions">
							<span class="input-icon">
								<asp:TextBox ID="TextBox2" class="form-control" runat="server" TextMode="Password" placeholder="password"></asp:TextBox>
								<i class="glyphicon glyphicon-lock" style="top: 59px;"></i>
								<a class="forgot" href="#">
									I forgot my password
								</a> </span>
						</div>
						<div class="form-actions">
							<asp:Button ID="btnLog" runat="server" Text="Login" 
                                CssClass="btn btn-danger pull-right" onclick="btnLog_Click" />
							
						</div>
						<div class="new-account">
							Designed By : 
							<a href="http://www.infinitetechnologies.in/" target="_blank" class="register">
								Infinite Technologies (P) Ltd.
							</a>
						</div>
					</fieldset>
				</form>
        </div>
    </div>
</body>
</html>
