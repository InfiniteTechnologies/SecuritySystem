<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Managesectors.aspx.cs" Inherits="Managesectors" Title="Manage Sectors" %>

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
									 Manage Sectors
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
	                	    <h1>Sectors</h1>
                        </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
        	<div class="form-horizontal manageform">
        	    <asp:HiddenField ID="secid" runat="server" />
        	     <div class="form-group">
                    <label for="catname">Sector Name<i class="reuiredfields">*</i></label><asp:TextBox 
                        ID="textName" class="form-control" runat="server" name="catname" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="textName" 
                        ValidationGroup="A"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="catname">Sector Keywords<i class="reuiredfields">*</i></label>
                    
                    <asp:TextBox ID="textKey" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="textKey" 
                        ValidationGroup="A"></asp:RequiredFieldValidator>
                </div>
                  <div class="form-group">
                    <label for="catname">Sector Desctription<i class="reuiredfields">*</i></label>
                   
                    <asp:TextBox ID="textDesc" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="textDesc" 
                        ValidationGroup="A"></asp:RequiredFieldValidator>
                </div>
                <div class="clearfix">
                    &nbsp;
                    <asp:Label ID="lblerror" runat="server" ForeColor="#FF3300" ></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Button ID="submitBtn" runat="server" CssClass="btn btn-info" Text="Add" 
                        onclick="submitBtn_Click" />
                    <asp:Button ID="cancelbtn" runat="server" CssClass="btn btn-danger" Text="Cancel" />
                    <asp:Button ID="resetbtn" runat="server" CssClass="btn btn-warning" 
                        Text="Reset"  />
                </div>
        	</div>
        </div>
        <div class="col-sm-8">
            <asp:GridView ID="grsectors" runat="server" 
                CssClass="table table-striped table-bordered table-hover" 
                AutoGenerateColumns="False" DataKeyNames="ID" 
                DataSourceID="SqlDataSource2" onrowdatabound="grsectors_RowDataBound" 
                onrowcommand="grsectors_RowCommand" >
                <Columns>
                    <asp:TemplateField HeaderText="S. No.">
                        <ItemTemplate>
                            <asp:Label ID="lblSno" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                    <asp:BoundField DataField="keywords" HeaderText="Keywords" 
                        SortExpression="keywords" />
                    <asp:BoundField DataField="description" HeaderText="Description" 
                        SortExpression="description" />
                    <asp:BoundField DataField="username" HeaderText="Created By" 
                        SortExpression="username" />
                    <asp:TemplateField HeaderText="Action">
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
                <EmptyDataTemplate>
                    <div class="text-center text-info">
                        No Result Found
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                SelectCommand="SELECT * FROM [sectorlog]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

