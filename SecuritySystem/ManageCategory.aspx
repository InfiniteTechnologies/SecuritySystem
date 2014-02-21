﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageCategory.aspx.cs" Inherits="ManageCategory" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

  <script src="jscript/jquery-1.9.1.js"></script>
    <script src="jscript/jquery.contextMenu.js" type="text/javascript"></script>
		<link href="jscript/jquery.contextMenu.css" rel="stylesheet" type="text/css" />


    <script type="text/javascript">
        var SelectedRow = null;
        var SelectedRowIndex = null;
        var UpperBound = null;
        var LowerBound = null;
        var value = null;
        window.onload = function() {
            UpperBound = parseInt('<%= this.GridView1.Rows.Count %>') - 1;
            LowerBound = 0;
            SelectedRowIndex = -1;
        }

        function SelectRow(CurrentRow, RowIndex) {
            if (SelectedRow == CurrentRow || RowIndex > UpperBound || RowIndex < LowerBound)
                return;

            if (SelectedRow != null) {
                SelectedRow.style.backgroundColor = SelectedRow.originalBackgroundColor;
                SelectedRow.style.color = SelectedRow.originalForeColor;

            }

            if (CurrentRow != null) {
                CurrentRow.originalBackgroundColor = CurrentRow.style.backgroundColor;
                CurrentRow.originalForeColor = CurrentRow.style.color;
                CurrentRow.style.backgroundColor = '#DCFC5C';
                CurrentRow.style.color = 'Black';
            }

            SelectedRow = CurrentRow;
            SelectedRowIndex = RowIndex;

            console.log($(SelectedRow).find("td:first").html());
            value = $(SelectedRow).find("td:first").html();
            setTimeout("SelectedRow.focus();", 0);
            $('#<%=TextBox1.ClientID %>').val(value);
            $('#<%=Button1.ClientID %>').click();
            SelectedRow = CurrentRow;
            SelectedRowIndex = RowIndex;
            setTimeout("SelectedRow.focus();", 0);
            console.log(SelectedRow);

        }

        function SelectSibling(e) {
            var e = e ? e : window.event;
            var KeyCode = e.which ? e.which : e.keyCode;

            if (KeyCode == 40)
                SelectRow(SelectedRow.nextSibling, SelectedRowIndex + 1);
            else if (KeyCode == 38)
                SelectRow(SelectedRow.previousSibling, SelectedRowIndex - 1);

            return false;
        }

       
    </script>
      <script type="text/javascript">

        $(document).ready(function() {

            // Show menu when #myDiv is clicked
            $("#<%=GridView1.ClientID %>").contextMenu({
                menu: 'myMenu'
            },
					function(action, el, pos) {
					    if (action == "edit") {
					        console.log(value);
					    }
					});
        });
			
		</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h2>Manage Categories</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <table width="100%" >
    <tr>
        <td  width="50%" valign="top">
        
             <h3 align="left">
                                  Please Fill in the form below to add a new category
                              </h3>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            
        <table cellpadding="5px" cellspacing="5px">
                          <caption>
                             
                              <tr>
                                  <td class="cell">
                                      Enter Category</td>
                                  <td>
                                      <asp:TextBox ID="TextCategory" runat="server" CssClass="form-control"></asp:TextBox>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                  </td>
                                  <td>
                                      <asp:Button ID="ButtonAdd" runat="server" CssClass="btn btn-warning" 
                                          onclick="ButtonAdd_Click" Text="Submit" />
                                           <asp:Button ID="ButtonUpdate" runat="server" CssClass="btn btn-warning" 
                                           Text="Update" onclick="ButtonUpdate_Click" />
                                           <asp:Button ID="ButtonReset" runat="server" CssClass="btn btn-warning" 
                                           Text="Reset" onclick="ButtonReset_Click" />
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="display: none;"
                                          Text="Button" />
                                  </td>
                                  <td>
                                      <asp:TextBox ID="TextBox1" runat="server" Style="display: none;"></asp:TextBox>
                                  </td>
                              </tr>
                          </caption>
                      </table>
            </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="ButtonAdd" />
                    <asp:PostBackTrigger ControlID="ButtonUpdate" />
                    <asp:PostBackTrigger ControlID="ButtonReset" />
                </Triggers>
            </asp:UpdatePanel>
        </td>
        
        <td width="50%" valign="top">
                      <h3 align="left">
                                  List of existing categories:
                              </h3>
                          <asp:GridView ID="GridView1" runat="server" Width="100%" 
                              AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" 
                              BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" 
                              DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" 
                              onrowcommand="GridView1_RowCommand" 
                          onrowcreated="GridView1_RowCreated">
                              <RowStyle BackColor="White" />
                              <Columns>
                                  <asp:BoundField DataField="id" HeaderText="Sr No" InsertVisible="False" 
                                      ReadOnly="True" SortExpression="id" />
                                  <asp:BoundField DataField="categoryName" HeaderText="Category Name" 
                                      SortExpression="categoryName" />
                                  <asp:TemplateField HeaderText="Remove">
                                      <ItemTemplate>
                                          <asp:ImageButton ID="ImageButton1" runat="server" 
                                              CommandArgument='<%# Eval("id") %>' CommandName="remove" 
                                              ImageUrl="~/images/deleterow.png" />
                                      </ItemTemplate>
                                  </asp:TemplateField>
                              </Columns>
                              <FooterStyle BackColor="#CCCCCC" />
                              <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                              <EmptyDataTemplate>
                                  No Records Found
                              </EmptyDataTemplate>
                              <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                              <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                          </asp:GridView>
                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                              ConnectionString="<%$ ConnectionStrings:SecurityConnectionString %>" 
                              SelectCommand="SELECT * FROM [CategoryMaster]"></asp:SqlDataSource>
                      </td>
     
          
          </tr>
          </table>  
                
      
         
</asp:Content>

