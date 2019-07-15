<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="WebApplication3.WebForm1" %>

<%@ Import Namespace="System.IO" %>
<html>
  <head>
  <title>Creating a Text File</title>
      <style type="text/StyleSheet1.css"></style>
<script runat="server">
    Sub WriteToFile(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Dim fp As StreamWriter
        Try
            fp = File.CreateText("C:\Users\dm086_000\Desktop\TestFile\" & TextBox1.Text & ".txt")
            fp.WriteLine(txtMyFile.Text)
            lblStatus.Text = "File Succesfully created!"
            fp.Close()
        Catch err As Exception
            lblStatus.Text = "File Creation failed. Reason is as follows <br><br>" & err.ToString()
        Finally
        End Try
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub
</script>
      <style type="StyleSheet1.css">
          .auto-style1 {
              height: 258px;
          }
      </style>
</head>
<body>
   
    <link rel="stylesheet" href="StyleSheet1.css">
            <h3>Creating a Text File</h3>
            <form id="Form1" method="post" runat="server" class="auto-style1">
                        <br />
                        Type your text:
                        <br />
                        <asp:TextBox
                                    ID="txtMyFile"
                                    TextMode="MultiLine"
                                    Rows="10"
                                    Columns="60"
                                    Runat="server" Height="176px" BackColor="#99CCFF" /><br/>
                        <br />
                        Input File Name:
                        <asp:TextBox ID="TextBox1" runat="server" Width="290px" BackColor="#99FF99"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Required Field">Required Field</asp:RequiredFieldValidator>
                        <br />
                        <asp:button
                                    ID="btnSubmit"
                                    Text="Create File"
                                    OnClick="WriteToFile"
                                    Runat="server" />
                        <asp:Label
                                    ID="lblStatus"
                                    Font-Bold="True"
                                    ForeColor="#ff0000"
                                    Runat="server" />
                        <br />
</form>
</body>
</html>

