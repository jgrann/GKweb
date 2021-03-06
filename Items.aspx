<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Items.aspx.vb" Inherits="ItemsPage" Title="Grann Konsult: Kunder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        Kunder</div>
    <div id="content-container-three-column">
        <!--

  CONTENT SIDE 1 COLUMN

  -->
        <div id="content-side1-three-column">
            <h2>
                <a href="Items.aspx">Alle kunder</a></h2>
            <asp:TreeView ID="TreeViewCategories" runat="server" ShowLines="True" ExpandDepth="0"
                LineImagesFolder="~/TreeLineImages" NodeIndent="0" LeafNodeStyle-CssClass="LeafNodesStyle"
                CssClass="TreeView" NodeStyle-CssClass="NodeStyle" ParentNodeStyle-CssClass="ParentNodeStyle"
                RootNodeStyle-CssClass="RootNodeStyle" SelectedNodeStyle-CssClass="SelectedNodeStyle"
                LeafNodeStyle-Width="100%" NodeStyle-Width="100%" ParentNodeStyle-Width="100%"
                RootNodeStyle-Width="100%" SelectedNodeStyle-Width="100%">
                <Nodes>
                    <asp:TreeNode Text="All Items" SelectAction="Expand" PopulateOnDemand="True" Value="All Items" />
                </Nodes>
                <SelectedNodeStyle BackColor="Transparent" />
                <RootNodeStyle Font-Bold="True" Font-Size="Larger" HorizontalPadding="5px" />
            </asp:TreeView>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <asp:Label ID="TopCatId" runat="server" Visible="false" Text=""></asp:Label>
            <h2>
                <asp:Label ID="LabelCurrentCategory" runat="server" Visible="true" Text=""></asp:Label></h2>
            <asp:Panel ID="PanelCategories" runat="server" Visible="true">
                &nbsp;<asp:ObjectDataSource ID="ObjectDataSourceCategories" runat="server" SelectMethod="GetChildCategories"
                    TypeName="Catalog">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="parentCategoryId" QueryStringField="catId" Type="string"
                            DefaultValue="" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="GridViewCategories" runat="server" AutoGenerateColumns="False"
                    AllowPaging="true" PageSize="10" DataSourceID="ObjectDataSourceCategories" BorderWidth="0"
                    BorderColor="white">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" CssClass="photo-float-left" runat="server" Width="90px"
                                    Height="60px" ImageUrl='<%# "images/" + Eval("ImageUrl") %>' AlternateText='<%#Eval("ImageAltText")%>' />
                                <b>
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "Items.aspx?catId=" + Eval("id") %>'> 
                                                                            <%# Eval("Title")%>
                                    </asp:HyperLink>
                                </b>
                                <br />
                                <div style="width: 240px">
                                <%#Eval("Description")%>
                                </div>
                                <br />
                                <br />
                                <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="images/arrow.gif" NavigateUrl='<%# "Items.aspx?catId=" + Eval("id") %>' />
                                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# "Items.aspx?catId=" + Eval("id") %>'> 
                                    Les mer
                                </asp:HyperLink>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                </asp:GridView>
            </asp:Panel>
            <!-- child items -->
            <asp:Panel ID="PanelItems" runat="server" Visible="false">
                <hr />
                <asp:ObjectDataSource ID="ObjectDataSourceItems" runat="server" SelectMethod="GetChildItems"
                    TypeName="Catalog">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="categoryId" QueryStringField="catId" Type="string"
                            DefaultValue="" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="GridViewItems" runat="server" AutoGenerateColumns="False" AllowPaging="true"
                    PageSize="10" DataSourceID="ObjectDataSourceItems" OnRowCreated="GridViewItems_RowCreated"
                    BorderWidth="0" BorderColor="white">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <h2>
                                    <%# Eval("Title")%>
                                </h2>
                                <%# Eval("Description")%>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                </asp:GridView>
            </asp:Panel>
        </div>
        <!-- END MAIN COLUMN -->
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
            <h3 class="small">
                Relatert programvare</h3>
            
                <p>
                <asp:HyperLink runat="server" NavigateUrl="http://www.kibi.no" Target="_blank">
                    <asp:Image ID="Image01" CssClass="photo-float-left" runat="server" Width="140px"
                          ImageUrl="images/ApproveIT.png" AlternateText="ApproveIT" />
                </asp:HyperLink>
                </p>
                <p>
                    ApproveIT er et web-basert system for fakturakontering. Papirfakturaer blir skannet inn og OCR lest for deretter � bli tilgjengeliggjort p� intranettet som bilde.
                </p>

                <p>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.readsoft.no" Target="_blank">
                    <asp:Image ID="Image2" CssClass="photo-float-left" runat="server" Width="140px"
                          ImageUrl="images/readsoft.png" AlternateText="Readsoft" />
                </asp:HyperLink>
                </p>
                <p>
                    Readsoft Documents er programvare for datafangst fra forskjellige kilder. Tradisjonelt brukt som OCR tolking av fakturaer og skjemaer.
                </p>
                
                <p>
                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="http://www.anydocsoftware.com/" Target="_blank">
                    <asp:Image ID="Image5" CssClass="photo-float-left" runat="server" Width="140px"
                          ImageUrl="images/anydoc.png" AlternateText="AnyDoc" />
                </asp:HyperLink>
                </p>
                <p>
                    AnyDoc Software er programvare for datafangst fra forskjellige kilder. Tradisjonelt brukt som OCR tolking av fakturaer og skjemaer.
                </p>

                <p>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="http://www.onbase.com" Target="_blank">
                    <asp:Image ID="Image3" CssClass="photo-float-left" runat="server" Width="140px"
                          ImageUrl="images/onbase.png" AlternateText="OnBase" />
                </asp:HyperLink>
                </p>
                <p>
                    Onbase leverer l�sning for elektronisk arkiv. I de senere �r har OnBase fra Hyland Software vokst til en sv�rt komplett EDM l�sning.
                </p>
                
                <p>
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="http://graphics.kodak.com/docimaging/US/en/index.htm" Target="_blank">
                    <asp:Image ID="Image4" CssClass="photo-float-left" runat="server" Width="140px"
                          ImageUrl="images/kodak.png" AlternateText="Kodak Imaging" />
                </asp:HyperLink>
                </p>
                <p>
                    Kodak leverer utstyr for skanning av papir, mikrofilm og mikrofiche til bildefiler. I tillegg leveres utstyr for produksjon av mikrofilm og mikrofiche.
                </p>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
