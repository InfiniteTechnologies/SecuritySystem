<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Managerecruiters.aspx.cs" Inherits="Managerecruiters" Title="Manage Recruiters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb">
                <li><i class="glyphicon glyphicon-home myiconcss"></i><a href="#"> Home </a></li>
                <li class="active">Masters </li>
                <li>Manage Recruiters </li>
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
                    Manage Recruiters <small>Total users(<asp:Label ID="lbltotal" runat="server"></asp:Label>)</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row alert alert-warning">
        <div class="col-sm-3">
            <span class="text text-info searchspan" >Name</span>
             <asp:TextBox ID="textName" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-3">
            <span class="text text-info searchspan" >Email</span>
            <asp:TextBox ID="textEmail" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
       
        <div class="col-sm-3">
            <span class="text text-info searchspan" >Country</span>
            <asp:TextBox ID="textCountry" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        
        <div class="col-sm-3">
            
            <span class="text text-info searchspan" >City</span>
            <asp:TextBox ID="textCity" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        
        <p>
            &nbsp;
        </p>
        <div class="col-sm-3">
            <span class="text text-info searchspan" >Company Name</span>
             <asp:TextBox ID="textCompany" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-3">
            <span class="text text-info searchspan" >Contact Number</span>
             <asp:TextBox ID="textContact" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-6">
                <br />
                <asp:Button CssClass="btn btn-info" runat="server" ID="btnSearc" Text="Search" onclick="btnSearc_Click" 
               />
        </div>
        <br />
        <p>
            &nbsp;
        </p>
      </div>
      <p>
        &nbsp;
      </p>
    <div class="row">
        <div class="col-sm-12">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <asp:GridView ID="grRecruiters" CssClass="table table-bordered" runat="server" 
                AutoGenerateColumns="False" DataKeyNames="ID" 
                DataSourceID="SqlDataSource1" onrowdatabound="grRecruiters_RowDataBound" 
                onrowcommand="grRecruiters_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="S. No.">
                        <ItemTemplate>
                            <asp:Label ID="lblSno" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                   
                    <asp:BoundField DataField="company" HeaderText="Company" 
                        SortExpression="company" />
                    <asp:BoundField DataField="country" HeaderText="Country" 
                        SortExpression="country" />
                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                    <asp:BoundField DataField="telephone" HeaderText="Telephone" 
                        SortExpression="telephone" />
                    <asp:TemplateField HeaderText="Confirmed ">
                        <ItemTemplate>
                            <asp:Label ID="lblIsactive" runat="server"></asp:Label>
                            <asp:HiddenField ID="isactive" runat="server" Value='<%# Eval("isactive") %>' />
                            
                            <asp:Button ID="btnSendmail" CommandName="mail"  runat="server" 
                                CssClass="btn btn-warning" Text="Remind" 
                                CommandArgument='<%# Eval("email") +"," + Eval("resetkey") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="More Details">
                        <ItemTemplate>
                            <a href='Viewrecruiter.aspx?recid=<%# Eval("ID") %>' >View More</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                SelectCommand="SELECT [ID], [email], [name], [company], [country], [city], [telephone], [isactive],[resetkey] FROM [recruiters]">
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

