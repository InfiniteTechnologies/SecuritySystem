<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="manageusers.aspx.cs" Inherits="manageusers" Title="Manage Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb">
                <li><i class="glyphicon glyphicon-home myiconcss"></i><a href="#">Home </a></li>
                <li class="active">Masters </li>
                <li>Manage Users </li>
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
                    Manage Users <small>Total users(<asp:Label ID="lbltotal" runat="server"></asp:Label>)</small>
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
            Country
            <asp:TextBox ID="textCountry" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        
        <div class="col-sm-3">
            City
            <asp:TextBox ID="textCity" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <br />
        <p>
            &nbsp;
        </p>
        <div class="col-sm-12">
            <asp:Button CssClass="btn btn-info" runat="server" ID="btnSearc" Text="Search" 
                onclick="btnSearc_Click" />
        </div>
      </div>
      <p>
        &nbsp;
      </p>
    <div class="row">
        <div class="col-sm-12">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>"
                SelectCommand="SELECT * FROM [jobseekers]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"
                AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1"
                OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                AllowSorting="True">
                <Columns>
                    <asp:TemplateField HeaderText="S. No.">
                        <ItemTemplate>
                            <asp:HiddenField ID="lblPaid" runat="server" Value='<%# Eval("paid") %>' />
                            <asp:Label ID="lblSno" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:TemplateField HeaderText="Contact no">
                        <ItemTemplate>
                            <asp:Label ID="lblContact" runat="server" Text='<%# Eval("contactno") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("country") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date of Birth">
                        <ItemTemplate>
                            <asp:Label ID="lblDob" runat="server" Text='<%# Eval("dob") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="lastlogin" HeaderText="Last Login" SortExpression="lastlogin" />
                    <asp:TemplateField HeaderText="More">
                        <ItemTemplate>
                            <asp:LinkButton ID="viemore" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="more">view details</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
