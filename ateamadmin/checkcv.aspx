<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkcv.aspx.cs" Inherits="checkcv" Title="Check CV" %>

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
									 Check CV
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
                        	<small>Check Cv</small>
                        </h1>
                    </div>
                   	</div>
                </div>
      <div class="row alert alert-warning">
        <div class="col-sm-1">
            <span class="text text-info searchspan" >Name</span>
        </div>
        <div class="col-sm-3">
            <asp:TextBox ID="textName" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-1">
            <span class="text text-info searchspan" >Email</span>
        </div>
        <div class="col-sm-3">
            <asp:TextBox ID="textEmail" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-info"  Text="Search"
                onclick="btnSearch_Click" />
        </div>
      </div>
      <p>
        &nbsp;
      </p>
      <div class="row">
    	<div class="col-sm-12">
            <asp:GridView ID="gridCv" runat="server" 
                CssClass="table table-striped table-bordered table-hover" 
                AutoGenerateColumns="False" DataKeyNames="ID" 
                DataSourceID="SqlDataSource1" AllowPaging="True" 
                onrowdatabound="gridCv_RowDataBound" onrowcommand="gridCv_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="S. No.">
                        <ItemTemplate>
                            <asp:Label ID="lblSno" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lblname" runat="server" Text='<%#  Eval("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="Email" />
                    <asp:TemplateField HeaderText="CV File">
                        <ItemTemplate>
                            <asp:HiddenField ID="hidCv" runat="server" Value='<%# Eval("cvfile") %>' />
                          
                            <asp:Button ID="maillink" CssClass="btn btn-warning" runat="server"  
                                text="send mail" CommandArgument='<%# Eval("email") %>' CommandName="sendmail"/>
                            <a href="" runat="server" id="adown" target="_blank" class="btn btn-link">View </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                SelectCommand="SELECT [ID], [name], [email], [cvfile] FROM [jobseekers]">
            </asp:SqlDataSource>
        </div>
         
    </div>
</asp:Content>

