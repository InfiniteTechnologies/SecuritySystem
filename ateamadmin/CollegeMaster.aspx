<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CollegeMaster.aspx.cs" Inherits="CollegeMaster" Title="a-team hospitality |  Colleges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
                AutoGenerateColumns="False" DataKeyNames="id" 
                DataSourceID="SqlDataSource1" onrowdatabound="grRecruiters_RowDataBound" 
                onrowcommand="grRecruiters_RowCommand" 
                onrowcreated="grRecruiters_RowCreated">
                <Columns>
                    
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                   
                 
                    <asp:BoundField DataField="cname" HeaderText="College Name" 
                        SortExpression="cname" />
                    <asp:BoundField DataField="ccode" HeaderText="Code" SortExpression="ccode" />
                    
                    
                    <asp:BoundField DataField="regdate" HeaderText="Registration date" 
                        SortExpression="regdate" />
                    <asp:BoundField DataField="regtime" HeaderText="regtime" 
                        SortExpression="regtime" />
                    <asp:BoundField DataField="logindate" HeaderText="logindate" 
                        SortExpression="logindate" />
                    <asp:BoundField DataField="logintime" HeaderText="logintime" 
                        SortExpression="logintime" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                SelectCommand="SELECT * FROM [collegemaster]">
            </asp:SqlDataSource>
        </div>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

