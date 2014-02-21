<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="managecv.aspx.cs" Inherits="managecv" Title="Manage CV" %>

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
									 Manage CV Templates
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
	                	<h1>CV Templates 
                        	
                        </h1>
                    </div>
                   	</div>
                </div>
    <div class="row">
    	<div class="col-sm-4">
        	<div class="form-horizontal manageform">
                <asp:HiddenField ID="cvid" runat="server" />
                <asp:HiddenField ID="cvold" runat="server" />
                <div class="form-group">
                    <label for="catname">Select Catagory<i class="reuiredfields">*</i></label>
                     <asp:DropDownList ID="catlist" runat="server" class="form-control">
                        <asp:ListItem Value="-1">Select Category</asp:ListItem>
                        <asp:ListItem Value="0">Entry Level</asp:ListItem>
                        <asp:ListItem Value="1">Mid Level</asp:ListItem>
                        <asp:ListItem Value="2">Senior Level</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="catlist" ValidationGroup="A" ></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Upload Image 
                        <img id="oldimg" src="testimonialImages/cvtemp.png" style="height:30px;width:30px" alt="CV Img" runat="server" />
                    </label>
                    <asp:FileUpload ID="tempImages" runat="server" CssClass="form-control" />
                   
                </div>
               <div class="form-group">
                    <label>Page Url<i class="reuiredfields">*</i></label>
                    <asp:TextBox ID="textURL" class="form-control" runat="server"  ontextchanged="textURL_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textURL"  ValidationGroup="A" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" EnableTheming="True" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"  
                        ValidationGroup="A" ControlToValidate="textURL" ErrorMessage="Enter a valid url"></asp:RegularExpressionValidator>
                    </div>
                <div class="clearfix" style="clear:both;float:none;">
                    &nbsp;
                    <asp:Label ID="lblerror" runat="server" ForeColor="#FF3300" ></asp:Label>
                </div>
                <div class="form-group">
                      <asp:Button ID="submitbtn" runat="server" CssClass="btn btn-info" Text="Add" 
                          onclick="submitbtn_Click"   />
                      <asp:Button ID="resetbtn" runat="server" CssClass="btn btn-warning" Text="Reset" />
                      <asp:Button ID="cancelbtn" runat="server" CssClass="btn btn-danger" Text="Cancel" />
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <asp:GridView ID="GridView1" runat="server"  
                CssClass="table table-striped table-bordered table-hover" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="ID" 
                DataSourceID="SqlDataSource1" onrowdatabound="GridView1_RowDataBound" 
                onrowcommand="GridView1_RowCommand" >
                <Columns>
                    <asp:TemplateField HeaderText="S. No">
                        <ItemTemplate>
                            <asp:Label ID="lblSno" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="lblCat" runat="server"></asp:Label>
                            <asp:HiddenField ID="catval" runat="server" Value='<%# Eval("category") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src="" id="imgsrc" runat="server" style="height:30px;width:30px" />
                            <asp:HiddenField ID="imgurl" runat="server" Value='<%# Eval("image") %>' 
                                Visible="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" />
                    <asp:BoundField DataField="username" HeaderText="username" 
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
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                SelectCommand="SELECT * FROM [cvlog]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

