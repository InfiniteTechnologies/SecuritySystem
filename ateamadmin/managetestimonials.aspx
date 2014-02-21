<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="managetestimonials.aspx.cs" Inherits="managetestimonials" Title="Manage Testimonials" %>

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
									 Manage Testimonials
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
	                	<h1>Testimonials :
                        </h1>
                    </div>
                   	</div>
                </div>
              
      <div class="row">
        <div class="col-sm-4">
               <div class="form-horizontal manageform">
                    <asp:HiddenField ID="testid" runat="server" />
                    <asp:HiddenField ID="imgoldtest" runat="server" />
                    <div class="form-group">
                        <label for="">Testimonial Name<i class="reuiredfields">*</i></label>
                        <asp:TextBox ID="textName" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textName"  ValidationGroup="A" ></asp:RequiredFieldValidator>                    
                    </div>
                    <div class="form-group">
                        <label for="">Testimonial Position<i class="reuiredfields">*</i></label>
                        <asp:TextBox ID="textPos" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="textPos" ErrorMessage="" ValidationGroup="A" CssClass=""></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="">Testimonial Message (Not more than 500 words)<i class="reuiredfields">*</i></label>
                        <asp:TextBox ID="textMsg" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="textMsg" ValidationGroup="A" ></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Testimonial Image<img src="testi/defaulttest.png" id="oldimg" runat="server" style="height:30px;width:30px" /></label>
                          <asp:FileUpload ID="testiImages" runat="server" CssClass="form-control" />
                    </div>
                    <div class="clearfix" style="float:none;clear:both">
                        &nbsp;     
                        <asp:Label ID="lblerror" runat="server" ForeColor="#FF3300" ></asp:Label>               
                    </div>
                    <div class="form-group">
                        <asp:Button ID="submitbtn" runat="server" CssClass="btn btn-info" Text="Add" 
                            onclick="submitbtn_Click" />
                        <asp:Button ID="reseybtn" runat="server" CssClass="btn btn-warning" 
                            Text="Reset" onclick="reseybtn_Click"/>
                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" />
                    </div>
                </div>
        </div>
        <div class="col-sm-8">
            <asp:GridView CssClass="table table-striped table-bordered table-hover" 
                AllowPaging="True" ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5" 
                onrowcommand="GridView1_RowCommand" onrowdatabound="GridView1_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <asp:Label ID="lblSno" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:TemplateField HeaderText="Images">
                         <ItemTemplate>
                            <img src="" id="imgsrc" runat="server" style="height:30px;width:30px" />
                            <asp:HiddenField ID="imgurl" runat="server" Value='<%# Eval("images") %>' 
                                Visible="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="position" HeaderText="position" 
                        SortExpression="position" />
                    <asp:BoundField DataField="test" HeaderText="message" SortExpression="test" />
                   
                    <asp:BoundField DataField="username" HeaderText="Created By" 
                        SortExpression="username" />
                    <asp:TemplateField HeaderText="Action">
                         <ItemTemplate>
                          
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                CommandArgument='<%# Eval("id") %>' CommandName="ed" Height="18px" 
                                ImageUrl="~/images_admin/pencil.png" Width="16px" />
                            <asp:ImageButton ID="ImageButton2" runat="server" 
                                CommandArgument='<%# Eval("id") %>' CommandName="del" 
                                ImageUrl="~/images_admin/cross.png" />
                          
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                SelectCommand="SELECT * FROM [testimonialslog]"></asp:SqlDataSource>
            
        </div>
    </div>
</asp:Content>

