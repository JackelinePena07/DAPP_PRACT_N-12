<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Facultad.aspx.cs" Inherits="AJAX.Facultad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 53%;
        }
        .style2
        {
            width: 346px;
        }
    </style>
</head>
<body style="font-family: Arial, Helvetica, sans-serif;font-size: small">
    <form id="form1" runat="server">
    <div>
    

        <br />
    
    </div>
    <table class="style1">
        <tr>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td>
            <br />
                <asp:Label ID="Label1" runat="server" Text="Facultad:"></asp:Label>
                <asp:TextBox ID="doctorTextBox" runat="server" Width="117px"></asp:TextBox>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="facultades.aspx">Selecciona una facultad: </asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
            <br />
                <asp:Button ID="saveButton" runat="server" Text="Save" 
                    onclick="saveButton_Click" />
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
    </table>
    </form>
</body></html>
