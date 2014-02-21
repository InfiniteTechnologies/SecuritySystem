<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Viewrecruiter.aspx.cs" Inherits="Viewrecruiter" Title="Recruiter Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%
         if (Request.QueryString.Count > 0)
         {
             string ID = Request.QueryString["recid"].ToString();
             dboperations objs = new dboperations();
             bool getdata = objs.getdata("SELECT * FROM [recruiters] WHERE [ID] = '"+ ID +"' ");
             if (getdata == true)
             {
            %>
    
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
									 view details
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
	                	    
	                	   Comapny : <%=objs.dr["company"].ToString() %>
                                                    <small></small>
	                	</h1>
                    </div>
                   	</div>
     </div>
     
            <div class="row">
                <div class="col-sm-12" align="left">
                    <div>
                       <img src="" />
                    </div>
                    
                </div>
             </div>
             <div class="row">
                <div class="col-sm-12">
                    <b>Created By : </b><%=objs.dr["name"].ToString() %> |
                    <b>Recruiter type : </b><%=objs.dr["type"].ToString() %>
                </div>
                <div class="col-sm-12">
                    <b>Registration time and Date </b> <%=objs.dr["regtime"].ToString()%>  <%=objs.dr["regdate"].ToString()%> 
                </div>
             </div>
                <div class="row">
                    <div class="col-sm-12">
                       <b> Email  </b><%=objs.dr["email"].ToString() %> |
                       <b>Contact </b> <%=objs.dr["telephone"].ToString()%>  / <%=objs.dr["cell"].ToString()%> 
                    </div>
                    <div class="col-sm-12">
                       <b>Company Name </b><%=objs.dr["company"].ToString() %>
                       <b><a href='<%=objs.dr["website"].ToString() %>' target="_blank">Visit Website</a> </b>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-sm-12">
                         <b>About  </b> <%=objs.dr["about"].ToString() %>
                    </div>
                    
                    <div class="col-sm-12">
                         <b>Address </b><%=objs.dr["addr"].ToString() %>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <b>City </b> <%=objs.dr["city"].ToString() %> | 
                        <b>Country </b> <%=objs.dr["country"].ToString() %> |
                         <b>Region </b> <%=objs.dr["region"].ToString() %> |
                         <b>Pincode</b><%=objs.dr["pin"].ToString() %>
                    </div>
                    
                </div>
                <div class="row">
                    <%
                        objs.ds = objs.fetchdatset("SELECT * FROM [joblist] WHERE [rec_id] = '"+ ID +"' ", "jlists");
                        if (objs.ds.Tables["jlists"].Rows.Count > 0)
                        {
                    %>
                            <div class="col-sm-12">
                               Total No of Job Posts : <%=objs.ds.Tables["jlists"].Rows.Count.ToString() %>
                            </div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="ID" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:TemplateField HeaderText="S. No.">
                                <ItemTemplate>
                                    <asp:Label ID="lblSno" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                           
                            <asp:BoundField DataField="salary" HeaderText="salary" 
                                SortExpression="salary" />
                            <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />
                            <asp:BoundField DataField="ref" HeaderText="ref" SortExpression="ref" />
                          
                            <asp:BoundField DataField="sector" HeaderText="sector" 
                                SortExpression="sector" />
                            <asp:BoundField DataField="category" HeaderText="category" 
                                SortExpression="category" />
                            <asp:BoundField DataField="location" HeaderText="location" 
                                SortExpression="location" />
                            <asp:BoundField DataField="locdesc" HeaderText="locdesc" 
                                SortExpression="locdesc" />
                            <asp:BoundField DataField="postdate" HeaderText="postdate" 
                                SortExpression="postdate" />
                            <asp:BoundField DataField="lastdate" HeaderText="lastdate" 
                                SortExpression="lastdate" />
                             <asp:BoundField DataField="status" HeaderText="status" 
                                SortExpression="status" />
                            <asp:BoundField DataField="ispost" HeaderText="ispost" 
                                SortExpression="ispost" />
                        </Columns>
                    </asp:GridView>
                
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ateamdbConnectionString %>" 
                        SelectCommand="SELECT * FROM [jobpost] WHERE ([rec_id] = @rec_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="rec_id" QueryStringField="recid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                
                    <%
                        }
                    %>
                </div>        
                    <%
         }
         }
     %>
</asp:Content>

