
<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="managelocations.aspx.cs" Inherits="managelocations" Title="Manage Locations" %>

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
									 Manage Locations
								</li>
								<%--<li class="search-box">
									<form class="sidebar-search" action="" method="post">
										<div class="form-group">
											<input type="text" placeholder="Start Searching..." />
											<button class="submit">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</div>
									</form>
								</li>--%>
							</ol>
    	            	<div class="page_header">
	                	<h1>Locations :  
                        	<small>Job Locations</small>
                        </h1>
                    </div>
                   	</div>
                </div>
      <div class="row">
    	<div class="col-sm-4">
        	<div class="form-horizontal manageform">
                <asp:HiddenField ID="locid" runat="server" />
                <div class="form-group">
                    <label for="catname">Locations Name<i class="reuiredfields">*</i></label>
                    <asp:TextBox ID="textName" class="form-control" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textName" ErrorMessage="" ValidationGroup="A" ></asp:RequiredFieldValidator>
                </div>
                 <div class="form-group">
                    <label for="catname">Locations Keywords<i class="reuiredfields">*</i></label>
                    <asp:TextBox ID="textkeywords" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textkeywords" ErrorMessage="" ValidationGroup="A" ></asp:RequiredFieldValidator>
                </div>
               <div class="clearfix">
                    &nbsp;
                    <asp:Label ID="lblerror" runat="server" ForeColor="#FF3300" ></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Button ID="submitbtn" runat="server" CssClass="btn btn-info" Text="Add" 
                        onclick="submitbtn_Click"  />
                    <asp:Button ID="resetbtn" runat="server" CssClass="btn btn-warning" Text="Reset"/>
                    <asp:Button ID="cancelbtn" runat="server" CssClass="btn btn-danger" 
                        Text="Cancel" onclick="cancelbtn_Click" />
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <asp:GridView ID="GridView1" 
                CssClass="table table-striped table-bordered table-hover" runat="server" 
                AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                DataSourceID="SqlDataSource1" onrowdatabound="GridView1_RowDataBound" 
                onrowcommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="S. No.">
                        <ItemTemplate>
                            <asp:Label ID="lblSno" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="keywords" HeaderText="keywords" 
                        SortExpression="keywords" />
                    <asp:BoundField DataField="username" HeaderText="Created By " 
                        SortExpression="username" />
                    <asp:TemplateField HeaderText="Action" >
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                CommandArgument='<%# Eval("ID") %>' CommandName="ed" Height="18px" 
                                ImageUrl="~/images_admin/pencil.png" Width="16px" />
                            <asp:ImageButton ID="ImageButton2" runat="server" 
                                CommandArgument='<%# Eval("ID") %>' CommandName="del" 
                                ImageUrl="~/images_admin/cross.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                SelectCommand="SELECT * FROM [locationlog]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="row">
        <asp:Label ID="lbltest" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

