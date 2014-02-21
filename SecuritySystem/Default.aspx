<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
<link href="StyleSheet.css" rel="Stylesheet" type="text/css" />


</head>
<body>
    <form id="form1" runat="server">
    <div>
              <div id="back">  <center>     
     <div id="outerdiv" >
               <div id="headdiv">
                  <h4 class="h4a">Login to Admin Panel</h4>     
              </div>    
               <div id="content">
                    <table width="400px">
                        <tr>
                            <td class="cell1" width="300px" height="20px" style="margin-top:10px;">
                            <br />    Username
                            </td>
                            <td width="100px" height="20px">
                            
                            </td>
                        </tr>
                        <tr>   
                            <td width="300px"  height="25px">
                                <asp:TextBox ID="TextBox1" runat="server"  height="23px" Width="270px" style="margin-left:10px;padding-left:10px;" PlaceHolder="Enter user name" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td width="100px" height="25px" >
                            
                            </td>
                        </tr>
                    
                         <tr>
                            <td class="cell1" width="300px"  height="20px" style="margin-top:5px;">
                              <br /> Password
                            </td>
                            <td width="100px"  height="20px">
                            
                            </td>
                        </tr>
                        <tr>   
                            <td width="300px"  height="25px">
                                <asp:TextBox ID="TextBox2" runat="server" Width="270px" height="23px"
                                    style="margin-left:10px;padding-left:10px;" CssClass="form-control" PlaceHolder="Enter password" TextMode="Password"></asp:TextBox>
                            </td>
                            <td width="100px" height="25px">
                            
                            </td>
                        </tr>
                    </table>
                    
                    <table width="400px" align="left" style="margin-left:6px;">
                        <tr>
                            <td style="width:60px"class="button1">
                     
                            <asp:Button ID="Button1" runat="server" Text="Login" width="70px" Height="25px" onclick="Button1_Click" class="btn btn-active" />
                      
                        </td>
                        <td  style="width:60px"class="button1" align="left">
                        <asp:Button ID="Button2" runat="server" Text="Reset" width="70px" Height="25px" class="btn btn-active" onclick="Button2_Click"  /> 
                        </td>
                        <td width="280px">
                            <asp:Label ID="Label1" runat="server" Text="" class="lbl"></asp:Label>
                            </td>
                    </tr>
                    <tr>
                        <td width="400px" colspan="3">
                            <table width="400px">
                        <tr> 
                        
                        <td width="200px"></td>
                        <td width="200px" valign="top" align="right" style="padding-right:20px;"> 
                            <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Forgot Password</asp:LinkButton>
                        </td>
                        </tr>
                   
                   </table>
                        </td>
                    </tr>
                  
             <br />
               </div>
           </div>
   
    </div>
    </div>
    </form>
</body>
</html>
