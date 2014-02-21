<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Jobpostlisting.aspx.cs" Inherits="Jobpostlisting" Title="Job Post Listing" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

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
								    Recruiters
								</li>
								<li >
									 Job Posts
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
	                	<h1>
	                	    Job Posts
                        </h1>
                    </div>
                   	</div>
                </div>
            <div class="row">
        <div class="col-sm-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover"
                DataKeyNames="ID" DataSourceID="SqlDataSource2" 
                onrowdatabound="GridView1_RowDataBound" 
                onrowcommand="GridView1_RowCommand" >
                <Columns>
                    <asp:TemplateField HeaderText="S.No.">
                        <ItemTemplate>
                            <asp:Label ID="lblSno" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="title" HeaderText="Title" 
                        SortExpression="title" />
                    <asp:BoundField DataField="name" HeaderText="Recruiter Name" 
                        SortExpression="name" />
                   
                    <asp:TemplateField HeaderText="Reference">
                        <ItemTemplate>
                            <asp:HiddenField ID="refval" runat="server" Value='<%# Eval("ref") %>' />
                            <asp:Label ID="lblRef" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCategory" Text='<%# Eval("category") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Location">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblLocation" Text='<%# Eval("location") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:BoundField DataField="postdate" HeaderText="Postdate" 
                        SortExpression="postdate" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:HiddenField ID="statusval"  runat="server" Value='<%# Eval("status") %>' />
                            <asp:Button runat="server" ID="btnVerify" CommandName="approve" Text="Approve" 
                                CssClass="btn btn-link" CommandArgument='<%# Eval("ID") %>' />
                            <asp:Button runat="server" ID="btnNverify" Text="Refuse" CommandName="refuse" 
                                CssClass="btn btn-link" CommandArgument='<%# Eval("ID") %>' />
                            <cc1:ConfirmButtonExtender ID="btnNverify_ConfirmButtonExtender" runat="server" 
                                ConfirmText="Are you sure abot the refusal ?" Enabled="True" 
                                TargetControlID="btnNverify" >
                            </cc1:ConfirmButtonExtender>
                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                SelectCommand="SELECT * FROM [joblist]"></asp:SqlDataSource>
            
        </div>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

