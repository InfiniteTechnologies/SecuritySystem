<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="css_changepassword" Title="Change Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
               		<div class="col-sm-12">
	                	<ol class="breadcrumb">
								<li>
									<i class="glyphicon glyphicon-home myiconcss"></i>
									<a href="#">
										Home
									</a>
								</li>
								<li class="active" >
								    Masters
								</li>
								<li >
									Change Password
								</li>
								<%--<li class="search-box">
									<div class="sidebar-search">
										<div class="form-group">
											<input type="text" placeholder="Start Searching..." />
											<button class="submit">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</div>
									</div>
								</li>--%>
							</ol>
    	            	<div class="page_header">
	                	    <h1>Change Password</h1>
                        </div>
                   	</div>
    </div>
    <div class="row">
        <div class="col-sm-12">
        	<div id="Form2" class="myformcls form-horizontal" >
        	    <asp:Label ID="labelMsg" runat="server"></asp:Label>
        	    <div class="form-group">
                    <label for="">
                   
                    Old Password <i class="reuiredfields">*</i></label>
                   
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" TextMode="Password" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Old Password Required" 
                        ValidationGroup="A" CssClass="myspanerror"></asp:RequiredFieldValidator>
                    
                </div>
                <div class="form-group">
                    <label for="">New Password <i class="reuiredfields">*</i></label>
                   
                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" TextMode="Password" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="New Password Required" 
                        ValidationGroup="A" CssClass="myspanerror"></asp:RequiredFieldValidator>
                    
                </div>
                <div class="form-group">
                    <label for="">Confirm Password <i class="reuiredfields">*</i></label>
                     <asp:TextBox ID="TextBox3" runat="server" class="form-control" TextMode="Password" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Confirm Password Required" 
                        ValidationGroup="A" CssClass="myspanerror"></asp:RequiredFieldValidator> 
                         <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="TextBox2" ControlToValidate="TextBox3" 
                        CssClass="myspanerror" ErrorMessage="New Password and Confirm Password must match" 
                        ValidationGroup="A"></asp:CompareValidator>
                    
                </div>
                <div class="form-group">
                    <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" 
                        Text="Change Password" onclick="Button1_Click" ValidationGroup="A" />
                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-warning" Text="Reset" />
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-danger" Text="Cancel" />
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>

