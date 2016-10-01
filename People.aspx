<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="People.aspx.vb" Inherits="PeoplePage" Title="Grann Konsult: Ansatte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        Ansatte</div>
    <!--

CONTENT CONTAINER

-->
    <div id="content-container-three-column">
<!--

  CONTENT SIDE 1 COLUMN

  -->
  <div id="content-side1-three-column">
    <ul class="list-of-links">
      <li class="current"><a href="People.aspx">Ansatte</a></li>
    </ul>
  </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <h1>
                Grann Konsult ansatte</h1>
            <hr />
            <%--Data Source Controls--%>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllPersons"
                TypeName="People"></asp:ObjectDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                AllowPaging="True" PageSize="5" OnRowCreated="GridView1_RowCreated" BorderWidth="0"
                BorderColor="white">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "images/" + Eval("ImageUrl") %>'
                                AlternateText='<%# Eval("ImageAltText")%>' CssClass="photo-float-left photo-border" />
                            <h2>
                                <%#Eval("FirstName") + " " + Eval("MiddleName") + " " + Eval("LastName")%>
                            </h2>
                            <h3>
                                <i>
                                    <%# Eval("Title")%>
                                </i>
                            </h3>
                            <p>
                                <%# Eval("Description")%>
                            </p>
                            <ul>
                                <li>Phone:
                                    <%#Eval("Phone")%>
                                </li>
                                <li>Fax:
                                    <%#Eval("Fax")%>
                                </li>
                                <li>Email:
                                    <%# Eval("Email")%>
                                </li>
                                <li>Les mer: 
                                    <asp:hyperlink runat="server" Target="_blank" NavigateUrl='<%# "Docs/" + Eval("curiumVitae")%>'>C.V</asp:hyperlink>
                                </li>
                            </ul>
                            <p />
                            <hr />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
            </asp:GridView>
        </div>
        <!-- END MAIN COLUMN -->
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
            <h3 class="small">
                &nbsp;</h3>
            <p>
                &nbsp;</p>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
