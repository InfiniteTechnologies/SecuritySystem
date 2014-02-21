<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="shortlisted.aspx.cs" Inherits="shortlisted" Title="Short Listed" %>

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
									         Short Listed
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
	                	                Short Listed
                                    </h1>
                            </div>
                   	        </div>
                     </div>
                      <div class="row alert alert-warning ">
                        <div class="col-sm-12">
                                <div class="row">
                                    <div class="col-sm-3">
                                            <span class=" text-info searchspan" >Job Title</span>
                                            <asp:TextBox ID="textTitle" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class=" text-info searchspan" >Recruiter Name</span>
                                        <asp:TextBox id="textRemail" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class=" text-info searchspan">Company Name</span>
                                        <asp:TextBox id="textCmpny" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                   <div class="col-sm-3">
                                            <span class=" text-info searchspan">Job Location</span>
                                            <asp:TextBox id="textJloc" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">   
                                        <div class="col-sm-3">
                                            <span class=" text-info searchspan">Applicant Name</span>
                                            <asp:TextBox id="textAname" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <span class=" text-info searchspan">Applicant Email</span>
                                            <asp:TextBox id="textAemail" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        
                                        <div class="col-sm-3">
                                            <span class=" text-info searchspan">Job Sector</span>                            
                                            <asp:DropDownList ID="ddlSec" runat="server" CssClass="form-control" 
                                                AutoPostBack="True"></asp:DropDownList>
                                        </div>
                                </div>
                                <p>
                                    &nbsp;
                                </p>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:Button ID="btnSearch" CssClass="btn btn-info" Text="Search" runat="server" 
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
        	                <asp:GridView runat="server" ID="grShortlisted" 
                                CssClass="table table-bordered " AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSource1" onrowdatabound="grShortlisted_RowDataBound" 
                                AllowPaging="True" AllowSorting="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="S. No.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSno" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:BoundField DataField="title" HeaderText="Applied for" SortExpression="title" /> 
                                    <asp:BoundField DataField="name" HeaderText="Recruiter Name" SortExpression="name" /> 
                                    <asp:BoundField DataField="company" HeaderText="Company Name" 
                                        SortExpression="company" />
                                    <asp:BoundField DataField="Sector" HeaderText="Sector" 
                                        SortExpression="Sector" />
                                    <asp:BoundField DataField="location" HeaderText="Job Location" 
                                        SortExpression="location" />
                                    <asp:BoundField DataField="Sname" HeaderText="Candidate Name" SortExpression="Sname" />
                                    <asp:BoundField DataField="Semail" HeaderText="Candidate Email" 
                                        SortExpression="Semail" />
                                    <asp:TemplateField HeaderText="Application Time">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%#  " At " + Eval("apptime") + Eval("appdate")  %>' ID="lblDisp"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
        	                </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                                SelectCommand="SELECT * FROM [applicants] WHERE ([shortlisted] = @shortlisted)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="shortlisted" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
            </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>

