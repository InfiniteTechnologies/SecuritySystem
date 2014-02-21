<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="managenewsletters.aspx.cs" Inherits="managenewsletters" Title="Manage Newsletters" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
             function checkingno(e)
	        {
		        var evt = e || window.event;
		        var keypressed = evt.which || evt.keycode;
        		if(keypressed!="48"  && keypressed!="49" && keypressed!="46" && keypressed!="50" && keypressed!="51" && keypressed!="52" && keypressed!="53" && keypressed!="54" && keypressed!="55" && keypressed!="8" && keypressed!="56" && keypressed!="57"  && keypressed!="37"  && keypressed!="9")
		        { 
 			        return false;
		        }
	        }  
    </script>
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
	                	<h1>Newsletter :  
                        	
                        </h1>
                    </div>
                   	</div>
                </div>
            <div class="row">
    	        <div class="col-sm-4">
        	        <div class="form-horizontal manageform">
                            <asp:HiddenField ID="newsid" runat="server" />
                            <div class="form-group">
                                <label for="">Newletter Date<i class="reuiredfields">*</i></label>
                                <asp:TextBox ID="textDate" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textDate" ValidationGroup="A" ></asp:RequiredFieldValidator>
                             </div>
                             <div class="form-group">
                                <label for="">Newletter Subject<i class="reuiredfields">*</i></label>
                                <asp:TextBox ID="textsub" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="textsub" ValidationGroup="A" ></asp:RequiredFieldValidator>
                             </div>
                            <div class="form-group">
                                <label for="">Newletter Template<i class="reuiredfields">*</i></label>
                                <cc1:Editor ID="texttemplate" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="texttemplate" ValidationGroup="A" ></asp:RequiredFieldValidator>
                             </div>
                            <div class="clearfix" style="float:left;clear:both">
                                &nbsp;
                            </div>
                            <div class="form-group">
                                <label for="">Shedule Time<i class="reuiredfields">*</i></label>
                                <asp:RadioButtonList ID="rdbbtn" runat="server" 
                                    RepeatDirection="Horizontal" AutoPostBack="True" onselectedindexchanged="rdbbtn_SelectedIndexChanged" 
                                    >
                                    <asp:ListItem Selected="True" Value="P" >Periodic</asp:ListItem>
                                    <asp:ListItem Value="N">Non Periodic</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="form-group">    
                                <asp:MultiView ID="MultiView1" runat="server">
                                    <asp:View ID="View1" runat="server">
                                        <label>Select Time Period<i class="reuiredfields">*</i></label>
                                        <asp:DropDownList ID="periodiclist" runat="server" CssClass="form-control" >
                                            <asp:ListItem Value="1">Daily</asp:ListItem>
                                            <asp:ListItem Value="7">Weekly</asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:View>
                                    <asp:View ID="View2" runat="server">
                                        <label>No of Days<i class="reuiredfields">*</i></label>
                                        <asp:TextBox ID="textdays" CssClass="form-control" runat="server" onKeyPress="return checkingno(event)" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textdays" ValidationGroup="B" ></asp:RequiredFieldValidator>
                                    </asp:View>
                                    
                                </asp:MultiView>
                            </div>
                            <div class="clearfix" style="float:none;clear:both">
                                &nbsp;     
                                <asp:Label ID="lblerror" runat="server" ForeColor="#FF3300" ></asp:Label>               
                             </div>
                            <div class="form-group">
                                <asp:Button ID="submitbtn" runat="server" CssClass="btn btn-info" Text="Add" onclick="submitbtn_Click"  />
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
                        onrowcommand="GridView1_RowCommand" 
                        >
                        <Columns>
                            <asp:TemplateField HeaderText="S. No.">
                                <ItemTemplate>
                                    <asp:Label ID="lblSno" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:BoundField DataField="subject" HeaderText="Subject" 
                                SortExpression="subject" />
                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                            
                            <asp:BoundField DataField="creationdate" HeaderText="Date" SortExpression="creationdate" />
                            <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                            <asp:BoundField DataField="revise" HeaderText="Revise" 
                                SortExpression="revise" />
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
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                        SelectCommand="SELECT * FROM [newsletterlog]"></asp:SqlDataSource>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

