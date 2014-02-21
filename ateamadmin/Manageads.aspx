<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Manageads.aspx.cs" Inherits="Manageads" Title="Manage Ads " %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

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
									 Manage Ads
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
	                	<h1>Ads :  
                        	<small></small>
                        </h1>
                    </div>
                   	</div>
                </div>
      <div class="row">
    	<div class="col-sm-4">
        	<div class="form-horizontal manageform">
                <asp:HiddenField ID="adsid" runat="server" />
                <div class="form-group">
                    <label for="catname">Ads Name<i class="reuiredfields">*</i></label>
                    <asp:TextBox ID="textName" class="form-control" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textName" ErrorMessage="" ValidationGroup="B" ></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Ads Image : <img src="ads/postad.jpg" id="oldimg" runat="server" style="height:30px;width:50px" /></label>
                    <asp:FileUpload ID="adsImage" runat="server" CssClass="form-control" />
                    <asp:HiddenField ID="lblOld" runat="server" />
                </div>
                 <div class="form-group">
                    <label for="catname">Starting Date<i class="reuiredfields">*</i></label>
                    <asp:TextBox ID="textStartdate" runat="server" class="form-control" 
                         BackColor="White" ReadOnly="True"></asp:TextBox>
                     <cc1:CalendarExtender ID="textStartdate_CalendarExtender" runat="server" 
                         Enabled="True" Format="dd/MM/yyyy" TargetControlID="textStartdate">
                     </cc1:CalendarExtender>
                </div>
                <div class="form-group">
                    <label>Ending Date</label>
                    <asp:TextBox ID="textEnddate" runat="server" CssClass="form-control" 
                        BackColor="White" ReadOnly="True"></asp:TextBox>
                    <cc1:CalendarExtender ID="textEnddate_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd/MM/yyyy" TargetControlID="textEnddate">
                    </cc1:CalendarExtender>
                </div>
               <div class="clearfix">
                    &nbsp;
                    <asp:Label ID="lblerror" runat="server" ForeColor="#FF3300" ></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Button ID="submitbtn" runat="server" CssClass="btn btn-info" Text="Add" 
                        onclick="submitbtn_Click"  />
                    <asp:Button ID="resetbtn" runat="server" CssClass="btn btn-warning" 
                        Text="Reset" onclick="resetbtn_Click"/>
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
                            <asp:Label ID="lblSno" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:BoundField DataField="name" HeaderText="Ads Name" 
                        SortExpression="name" />
                    <asp:BoundField DataField="startdate" HeaderText="Starting Date" 
                        SortExpression="startdate" />
                    <asp:BoundField DataField="enddate" HeaderText="Ending Date" 
                        SortExpression="enddate" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label runat="server" Text="Approved" ID="lblApprove">
                            </asp:Label>
                            <asp:LinkButton runat="server" Text="Approve" CommandName="appr"  ID="lbApr" 
                                CssClass="btn btn-link" CommandArgument='<%# Eval("ID") +","+ Eval("image") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:HiddenField ID="lblStatus" runat="server" Value='<%# Eval("status") %>' />
                            <asp:HiddenField ID="lblImagename" runat="server" Value='<%# Eval("image") %>' />
                            <img src='<%# "ads/" + Eval("image") %>' style="height:60px;width:100px" id="adimages" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="username" HeaderText="Creted By" 
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
                    
                        <tr class="success">
                            <td align="center" class="text-center text-danger" >
                                No Result Found !
                            </td>
                        </tr>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                SelectCommand="SELECT * FROM [adslog]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="row">
        <asp:Label ID="lbltest" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

