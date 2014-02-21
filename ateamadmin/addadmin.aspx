<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addadmin.aspx.cs" Inherits="addadmin" Title="Add Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb">
                <li>
                    <a href="dashboard.aspx">
                        <i class="glyphicon glyphicon-home"></i>                        
                        Home
                    </a>
                </li>
                <li class="active">
                     Miscellaneous
                </li>
                <li>
                    Add Admin
                </li>
              <%--  <li class="search-box">
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
	             <h1>Add Admin User</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="myformcls form-horizontal">
                <div class="form-group">
                    <label for="">Admin ID<i class="reuiredfields">*</i></label>
                    <asp:TextBox ID="textID" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ValidationGroup="A" CssClass="myspanerror" ControlToValidate="textID" ErrorMessage="Admin ID Required"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="">New Password<i class="reuiredfields">*</i></label>
                    <asp:TextBox ID="textPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ValidationGroup="A" CssClass="myspanerror" ControlToValidate="textPass" ErrorMessage="New Password Required"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="">Confirm Password<i class="reuiredfields">*</i></label>
                    <asp:TextBox ID="textConf" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ValidationGroup="A" CssClass="myspanerror" ControlToValidate="textConf" ErrorMessage="Confirm Password Required"></asp:RequiredFieldValidator><asp:CompareValidator
                        ID="CompareValidator1" CssClass="myspanerror" runat="server" 
                        ErrorMessage="New Password and Confirm Password Should match" 
                        ControlToCompare="textPass" ControlToValidate="textConf"></asp:CompareValidator>
                </div>
                <div class="form-group">
                    <label for="">Permissions</label>
                    <div class="row">
                        <div class="col-sm-4">
                           
                        </div>
                        <div class="col-sm-4">
                           
                        </div>
                        <div class="col-sm-4">
                            
                        </div>
                    </div>
                </div>
                <div class="clearfix">
                    &nbsp;
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAdd" CssClass="btn btn-info" runat="server" Text="Add" 
                        ValidationGroup="A" onclick="btnAdd_Click" />
                    <asp:Button ID="resetBtn" CssClass="btn btn-warning" runat="server" Text="Reset" /> 
                    
                    <asp:Button ID="btnCan" CssClass="btn btn-danger" runat="server" Text="Cancel" ValidationGroup="A" /> 
                </div>
            </div>
        </div>
    </div>
</asp:Content>

