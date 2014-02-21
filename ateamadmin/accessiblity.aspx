<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="accessiblity.aspx.cs" Inherits="accessiblity" Title="A-team Hospitality | Accessiblity" %>

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
									Accessibility
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
	                	<h1>Accessibility</h1>
                    </div>
                   	</div>
                </div>
    <div class="row">
    	<div class="col-sm-12">
            <asp:GridView ID="GridView1" runat="server" 
                CssClass="table table-striped table-bordered table-hover" 
                AutoGenerateColumns="False" DataKeyNames="ID" 
                DataSourceID="SqlDataSource1" AllowPaging="True" 
                onrowdatabound="GridView1_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="S. No.">
                        <ItemTemplate>
                            <asp:Label ID="lblSno" runat="server" Text="Label" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="fullname" runat="server" Text='<%# Eval("title") +" "+ Eval("fname") +" " + Eval("lname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:BoundField DataField="lastlogin" HeaderText="Last Login" 
                        SortExpression="lastlogin" />
                    <asp:BoundField DataField="regdate" HeaderText="regdate" 
                        SortExpression="regdate" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:HiddenField ID="lblSval" runat="server" Value='<%# Eval("status") %>' />
                            <asp:Button ID="btnstatus" runat="server" Text="" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                SelectCommand="SELECT [ID], [fname], [lname], [lastlogin], [regdate],[title], [status] FROM [jobseekers]">
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

