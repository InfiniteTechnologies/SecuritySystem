<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkapplications.aspx.cs" Inherits="checkapplications" Title="Check Applications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
									 Manage Applications
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
	                	<h1>Applications
                        </h1>
                    </div>
                   	</div>
            </div>
            <div class="row alert alert-warning">
                    <div class="col-sm-12">
                        <div class="row">   
                            <div class="col-sm-4">
                                <span class="text-info searchspan">
                                    Job Title
                                </span>
                                <asp:TextBox ID="textTitle" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <span class="text-info searchspan">
                                    Company
                                </span>
                                <asp:TextBox ID="textComp" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <span class="text-info searchspan">
                                    Applicant Name
                                </span>
                                <asp:TextBox ID="textAname" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <span class="text-info searchspan">Applicant Email</span>
                                <asp:TextBox ID="textAemail" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <span class="text-info searchspan">Shortlist</span>
                                <asp:DropDownList ID="ddlShort" runat="server" CssClass="form-control" AutoPostBack="True">
                                    <asp:ListItem>-- Please Select --</asp:ListItem>
                                    <asp:ListItem Value="1">Shortlisted</asp:ListItem>
                                    <asp:ListItem Value="0">On Hold</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <p>
                            &nbsp;
                        </p>
                        <div class="row">
                            <div class="col-sm-12">
                                <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-info" Text="Search" 
                                    onclick="btnSearch_Click" />
                            </div>
                        </div>
                    </div>
              </div>
              <p>
                    &nbsp;
              </p>
            <div class="row">
    	            <div class="col-sm-12">
        	            <asp:GridView ID="grApplications" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover"
                            DataSourceID="SqlDataSource1" OnRowDataBound="grApplications_RowDataBound" 
                            AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:TemplateField HeaderText="S. No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSno" runat="server" Text="Label"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="title" HeaderText="Job Title" SortExpression="title" />
                                <asp:BoundField DataField="company" HeaderText="Company" 
                                    SortExpression="company" />
                                <asp:BoundField DataField="Sname" HeaderText="Applicant Name" SortExpression="Sname" />
                                <asp:BoundField DataField="Semail" HeaderText="Applicant Email" 
                                    SortExpression="Semail" />
                                
                                  <asp:TemplateField HeaderText="Application Status" >
                                        <ItemTemplate>
                                             <asp:HiddenField runat="server" ID="statusval" 
                                                 Value='<%# Eval("shortlisted") %>' />
                                             <asp:Label runat="server" ID="lblStatus" ></asp:Label>
                                        </ItemTemplate>
                                  </asp:TemplateField>
                            </Columns>
                    	    
        	            </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                            SelectCommand="SELECT * FROM [applicants]"></asp:SqlDataSource>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
   
    
                  
      
</asp:Content>

