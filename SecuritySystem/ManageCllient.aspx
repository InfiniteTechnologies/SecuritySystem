﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageCllient.aspx.cs" Inherits="ManageCllient" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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
        <h2>Manage Clients</h2>
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
       <asp:Label ID="LabelErr" runat="server" ForeColor="#CC0000"></asp:Label>
    
    <table width="100%">
        <tr>
            <td valign="top" width="50%">
             
                <h3 align="left">
                    Please Fill in the form below to add a new client
                </h3>
                
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                
                <table width="100%">
                    <tr>
                    <td class="cell">Company Name</td>
                    <td>
                        <asp:TextBox ID="TextCOmpny" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextCOmpny" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                    <td class="cell">Client Name</td>
                    <td>
                        <asp:TextBox ID="TextClient" runat="server" CssClass="form-control"></asp:TextBox>
                           <cc1:FilteredTextBoxExtender ID="TextClient_FilteredTextBoxExtender" 
                            runat="server" Enabled="True" TargetControlID="TextClient" FilterType="UppercaseLetters, LowercaseLetters, Custom" ValidChars=" ">
                        </cc1:FilteredTextBoxExtender>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextClient" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                    <td class="cell">Email Id</td>
                    <td>
                        <asp:TextBox ID="TextMail" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TextMail" ErrorMessage="Not a valid mail id." 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="A"></asp:RegularExpressionValidator>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextMail" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                    <td class="cell">Password</td>
                    <td>
                        <asp:TextBox ID="TextPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextPass" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                    <td class="cell">Contact No</td>
                    <td>
                        <asp:TextBox ID="TextNo" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                           <cc1:FilteredTextBoxExtender ID="TextNo_FilteredTextBoxExtender" 
                            runat="server" Enabled="True" TargetControlID="TextNo" FilterType="Numbers">
                        </cc1:FilteredTextBoxExtender>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextNo" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                    <td class="cell">Address Line 1</td>
                    <td>
                        <asp:TextBox ID="TextADd1" runat="server" CssClass="form-control"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextADd1" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                    <td class="cell">Address Line 2</td>
                    <td>
                        <asp:TextBox ID="TextAdd2" runat="server" CssClass="form-control"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextAdd2" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                    <td class="cell">City</td>
                    <td>
                        <asp:TextBox ID="TextCity" runat="server" CssClass="form-control"></asp:TextBox>
                           <cc1:FilteredTextBoxExtender ID="TextCity_FilteredTextBoxExtender" 
                            runat="server" Enabled="True" TargetControlID="TextCity" FilterType="UppercaseLetters, LowercaseLetters, Custom" ValidChars=" ">
                        </cc1:FilteredTextBoxExtender>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextCity" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                    <td class="cell">State</td>
                    <td>
                        <asp:TextBox ID="TextState" runat="server" CssClass="form-control"></asp:TextBox>
                           <cc1:FilteredTextBoxExtender ID="TextState_FilteredTextBoxExtender" 
                            runat="server" Enabled="True" TargetControlID="TextState" FilterType="UppercaseLetters, LowercaseLetters, Custom" ValidChars=" ">
                        </cc1:FilteredTextBoxExtender>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextState" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                    <td class="cell"></td>
                    <td>
                        <asp:Button ID="ButtonAdd" runat="server" CssClass="btn btn-warning" 
                            Text="Submit" onclick="ButtonAdd_Click" />
                        <asp:Button ID="ButtonUpdate" runat="server" CssClass="btn btn-warning" 
                            Text="Update" onclick="ButtonUpdate_Click" />
                            
                             <asp:Button ID="ButtonSearch" runat="server" Text="Search" 
                        CssClass="btn btn-warning" onclick="ButtonSearch_Click"/>
                            
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
                </table>
      </ContentTemplate>          
               
                 <Triggers>
        <asp:PostBackTrigger ControlID="ButtonAdd" />
         <asp:PostBackTrigger ControlID="ButtonUpdate" />
         <asp:PostBackTrigger ControlID="ButtonReset" />
         <asp:PostBackTrigger ControlID="ButtonSearch" />
         
    </Triggers>
         
       </asp:UpdatePanel>
       
            </td>
            <td width="50%" valign="top">
                <h3 align="left">
                    List of Existing Clients:</h3>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" width="100%"
                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1" 
                    ForeColor="Black" GridLines="Vertical" onrowcreated="GridView1_RowCreated" 
                    onrowcommand="GridView1_RowCommand" 
                    onrowdatabound="GridView1_RowDataBound">
                    <Columns>
                     <asp:TemplateField HeaderStyle-CssClass="hidecls" ItemStyle-CssClass="hidecls">
                            <ItemTemplate >
                                <%# Eval("id") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sr No" SortExpression="id">
                            <ItemTemplate>
                                  <asp:Label ID="LabelSrNo" runat="server" Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
                            SortExpression="CompanyName" />
                        <asp:BoundField DataField="ClientName" HeaderText="Client Name" 
                            SortExpression="ClientName" />
                        <asp:BoundField DataField="ClientEmail" HeaderText="Email Id" 
                            SortExpression="ClientEmail" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                  
                   <asp:TemplateField HeaderText="Remove">
                                      <ItemTemplate>
                                          <asp:ImageButton ID="ImageButton1" runat="server" 
                                              CommandArgument='<%# Eval("id") %>' CommandName="remove" 
                                              ImageUrl="~/images/deleterow.png" />
                                              
                                          <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server"  ConfirmText="Are you sure you want to delete this record?" TargetControlID="ImageButton1">
                                          </cc1:ConfirmButtonExtender>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                  
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                     <EmptyDataTemplate>
                                  No Records Found
                              </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>     
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SecurityConnectionString %>" 
                    SelectCommand="SELECT * FROM [ManageClients]"></asp:SqlDataSource>
           
            <br />
                 Total Clients:&nbsp;
             <asp:Label ID="LabelCount" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

