<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.vb" Inherits="_Default" Title="Grann Konsult: Hjemme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
    <!--

POSTER PHOTO

-->
    <div id="poster-photo-container">
        <img src="images/photo-poster.jpg" alt="" class="poster-photo-image" />
          <div id="feature-area-home"><li>SBS</li>
                                      <li>EDM</li>
                                      <li>Visual Basic</li>
                                      <li>.NET</li>
                                      <li>Jscript</li>
                                      <li>MS SQL</li>
 
          </div>
    </div>
    <!--

CONTENT CONTAINER

-->
    <div id="content-container-two-column">
        <!--

CONTENT MAIN COLUMN

-->
        <div id="content-main-two-column">
            <h1>
                Freelance IT konsulent med bred erfaring</h1>
            <p>
                Grann Konsult er et enkeltmannsforetak som leier ut konsulenttjenester innen 
                EDM, Programmering, Databaser og nettverk. </p>
            <p>
                I tillegg leverer Grann Konsult komplette IT infrastruktur, maskinvare og 
                tjenester for små og mellomstore bedrifter</p>
            <div id="three-column-container">
                <div id="three-column-side1">
                    <a href="Default.aspx">
                        <img src="images/home-photo-1.jpg" class="photo-border" alt="Enter Alt Text Here" /></a>
                    <h2>
                        Systemløsninger</h2>
                    <p>
                        Grann Konsult har flere års erfaring med design, programmering og implementering 
                        av komplekse EDM løsninger hos store selskaper.</p>
                    <a href="Default.aspx"></a><img class="arrow" src="images/arrow.gif" alt="" /></div>
                <div id="three-column-side2">
                    <a href="Default.aspx">
                        <img src="images/home-photo-3.jpg" class="photo-border" alt="Enter Alt Text Here" /></a>
                    <h2>
                        Infrastruktur</h2>
                    <p>
                        Grann Konsult kan levere alt som skal til for at en bedrift skal kunne jobbe med 
                        datamaskiner i nettverk.<br />
                    </p>
                    <a href="Default.aspx"></a><img class="arrow" src="images/arrow.gif" alt="" /></div>
                <div id="three-column-middle">
                    <a href="Default.aspx">
                        <img src="images/home-photo-2.jpg" class="photo-border" alt="Enter Alt Text Here" /></a>
                    <h2>
                        Programmering</h2>
                    <p>
                        Grann Konsult har lang erfaring med programmering mot API grensesnitt, databaser 
                        og Web løsninger.<br />
                    </p>
                    <a href="Default.aspx"></a><img class="arrow" src="images/arrow.gif" alt="" /></div>
            </div>
        </div>
        <!--

CONTENT SIDE COLUMN

-->
        <div id="content-side-two-column">
            <img src="images/MCP(rgb).png" width="120" alt="MCP logo" />
            <p /><p />
            <img src="images/SBS.png" width="120" alt="SBS logo" />
            <br />
            <br />
            <br />
            <img src="images/CDIACert_S.jpg" height="26" width="140" alt="CDIA+ logo"/>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
