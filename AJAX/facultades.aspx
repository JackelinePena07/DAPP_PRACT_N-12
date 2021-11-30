<%@ Page Language="C#" AutoEventWireup="true" CodeFile="doctors.aspx.cs" Inherits="doctors" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>   
    
    </div>
    <p>
        <asp:Label ID="specialtiesLabel" runat="server" Text="Carreras"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="submitButton" runat="server" Text="Submit" 
            onclick="submitButton_Click" />
    </p>
    <p>
        <asp:ListBox ID="specialtiesListBox" runat="server"></asp:ListBox>
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" style="font-weight: 700;font-size: large" 
            Text="Facultades"></asp:Label>
    </p>
    <asp:GridView ID="doctorsGridView" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="dr_id" 
        EmptyDataText="There are no data records to display." 
        onpageindexchanged="doctorsGridView_PageIndexChanged" 
        onpageindexchanging="doctorsGridView_PageIndexChanging" PageSize="5" 
        onselectedindexchanged="doctorsGridView_SelectedIndexChanged">
        <Columns>
            <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
            <asp:BoundField DataField="Codigo_facultad" HeaderText="Codigo_facultad" ReadOnly="True" 
                SortExpression="Codigo_facultad" />
            <asp:BoundField DataField="Nombre_carrera" HeaderText="Nombre_carrera" 
                SortExpression="Nombre_carrera" />
            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Data Source=DIOSALINA\SQLEXPRESS;Initial Catalog=facultad;Integrated Security=True" 
        DeleteCommand="DELETE FROM [facultad] WHERE [Codigo_facultad] = @Codigo_facultad" 
        InsertCommand="INSERT INTO [facultad] ([Codigo_facultad], [Codigo_facultad], [Nombre_carrera]) VALUES (@Codigo_facultad, @Nombre_carrera)" 
        ProviderName="<%$ ConnectionStrings:facultadConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [Codigo_facultad], [Nombre_carrera] FROM [facultad]" 
        
        UpdateCommand="UPDATE [facultad] SET [Nombre_carrera] = @Nombre_carrera WHERE [Codigo_facultad] = @Codigo_facultad">
        <DeleteParameters>
            <asp:Parameter Name="Codigo_facultad" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Codigo_facultad" Type="String" />
            <asp:Parameter Name="Nombre_carrera" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre_carrera" Type="String" />  
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
