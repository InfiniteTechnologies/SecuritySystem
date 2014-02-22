<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageGuards.aspx.cs" Inherits="ManageClients" Title="Untitled Page" %>

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

        function uploadimg() {
            var file=document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
            var preview = document.getElementById('<%=imgdemo.ClientID %>');
            var reader = new FileReader();

            reader.onloadend = function() {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
            
        }
    </script>

 function uploadimg() {
            var file=document.querySelector('#<%=FileUpload1.ClientID%>').files[0];
            var preview = document.getElementById('<%=imgdemo.ClientID %>');
            var reader = new FileReader();

            reader.onloadend = function() {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
            
        }


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h2>Manage Guards</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <table width="100%" >
    <tr>
        <td  width="50%" valign="top">
             <h3 align="left">Please Fill in the form below to add a new Guard
                              </h3>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            
            
         <table width="100%">
            <tr>
                <td class="cell">Guard Name</td>
                <td>
                    <asp:TextBox ID="TextGname" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td class="cell">Category</td>
                <td>
                    <asp:DropDownList ID="DdlCategory" runat="server" Height="35px" Width="200px">
                    </asp:DropDownList>
                </td>
            </tr>

             <tr>
                <td class="cell">GST Number</td>
                <td>
                    <asp:TextBox ID="txtboxGST" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td class="cell">Email Id</td>
                <td>
                    <asp:TextBox ID="TextMail" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            
                        <tr>
                <td class="cell">User Id</td>
                <td>
                    <asp:TextBox ID="TextUser" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            
                        <tr>
                <td class="cell">Password</td>
                <td>
                    <asp:TextBox ID="TextBoxPass" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            
                        <tr>
                <td class="cell">Address Line 1</td>
                <td>
                    <asp:TextBox ID="Textadd1" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            
                        <tr>
                <td class="cell">Address Line 2</td>
                <td>
                    <asp:TextBox ID="Textadd2" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            
                        <tr>
                <td class="cell">Contact No</td>
                <td>
                    <asp:TextBox ID="TextNo" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            
                        <tr>
                <td class="cell">City</td>
                <td>
                    <asp:TextBox ID="TextCity" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td class="cell">State</td>
                <td>
                    <asp:TextBox ID="TextStt" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            
            
            <tr>
                <td class="cell">Upload Photo</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="uploadimg();"  /></td>
            </tr>
            
            
           <tr>
                <td class="cell">Id Proof</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="0">Select Id Proof</asp:ListItem>
                        <asp:ListItem Value="1">Passport</asp:ListItem>
                        <asp:ListItem Value="2">SSN</asp:ListItem>
                        <asp:ListItem Value="3">Driving License</asp:ListItem>
                    </asp:DropDownList>
                  </td>
            </tr>
            
            <tr>
                <td class="cell">Enter Id Number</td>
                <td>
                    <asp:TextBox ID="TextId" runat="server" CssClass="form-control"></asp:TextBox>   
                </td>
            </tr>
            
           <tr>
                <td class="cell"><img ID="imgdemo" runat="server" alt="" src="" style="width:50px;height:50px" /></td>
                <td>
                    <asp:Button ID="ButtonAdd" runat="server" Text="Submit" 
                        CssClass="btn btn-warning" onclick="ButtonAdd_Click"/>
                     <asp:Button ID="ButtonUpdate" runat="server" Text="Update" 
                        CssClass="btn btn-warning" onclick="ButtonUpdate_Click"/>
                      <asp:Button ID="ButtonReset" runat="server" Text="Reset" 
                        CssClass="btn btn-warning" onclick="ButtonReset_Click"/>
                    </td>
            </tr>
             <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                style="display:none;" Text="Button" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" style="display:none;"></asp:TextBox>
                        </td>
                    </tr>
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
            <h3 align="left">List of Existing Guards:</h3>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" 
                 BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                 CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1" 
                 ForeColor="Black" GridLines="Vertical" onrowcreated="GridView1_RowCreated" 
                 onrowcommand="GridView1_RowCommand">
                 <Columns>
                     <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                         SortExpression="id" />
                     <asp:BoundField DataField="GuardName" HeaderText="GuardName" 
                         SortExpression="GuardName" />
                     <asp:BoundField DataField="F_CategoryId" HeaderText="F_CategoryId" 
                         SortExpression="F_CategoryId" />
                     <asp:BoundField DataField="GuardEmail" HeaderText="GuardEmail" 
                         SortExpression="GuardEmail" />
                     <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                     <asp:BoundField DataField="GuardIdProof" HeaderText="GuardIdProof" 
                         SortExpression="GuardIdProof" />
                         
                  <asp:TemplateField HeaderText="Remove">
                                      <ItemTemplate>
                                          <asp:ImageButton ID="ImageButton1" runat="server" 
                                              CommandArgument='<%# Eval("id") %>' CommandName="remove" 
                                              ImageUrl="~/images/deleterow.png" />
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
                 SelectCommand="SELECT * FROM [ManageGuards]"></asp:SqlDataSource>
         </td>  
     </tr>
     </table>                   
</asp:Content>

