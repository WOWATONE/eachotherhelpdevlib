﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HeaderBroker.aspx.cs" Inherits="BrokerWebApp.HeaderBroker" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ OutputCache Location="None" NoStore="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Broker header</title>
    <link href="css\font.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        
            function homePage_Click() {
                //do nothing;
            }

            function logout_Click() {
                dxeLogoutCallback.PerformCallback('');
            }

            function shutDown_Click() {
                parent.window.close();
            }

            function logoutCallbackComplete(s, e) {
                //do nothing;
                parent.location = "Login.aspx";
            }
                    
            function isEmpty(testVar) {
                if ((testVar == null) || (testVar.length == 0)) {
                    return true;
                } else {
                    return false;
                }
            }
            
            function isDecimal(str) {
                if (isEmpty(str)) {
                    return false;
                }
                else {
                    if (/[^d.]/i.test(str)) {
                        return true;
                    }
                    return false;
                }
            }   
        
        </script>
</head>
<body style="margin:0 0 0 0; padding:0 0 0 0;">
    <form id="form1" runat="server">
    
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxcb:ASPxCallback ID="dxeLogoutCallback" ClientInstanceName="dxeLogoutCallback" runat="server"
        OnCallback="dxeLogoutCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {logoutCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
        
    <div>
        <table width="101%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td style="background-image:url(images/bg.gif); background-repeat:repeat-x; height:71px; vertical-align:bottom; width:100%;"><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="38">&nbsp;</td>
                <td width="145"><img  alt="" src="images\logo.gif" width="140" height="41" /></td>
                <td width="274"><img alt="" src="images\name.gif" width="317" height="39" /></td>
                <td width="40" valign="bottom">&nbsp;</td>
                <td width="554">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="206" height="30">&nbsp;</td>
                        <td width="348" align="center"></td>
                      </tr>
                      <tr>
                        <td height="15" align="center">&nbsp;</td>
                        <td align="center">
                            <img src="images\menu.gif" alt=""  width="303" height="33" border="0" usemap="#btnMap" />
                        </td>
                      </tr>
                    </table>
                </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="4" bgcolor="#0276B0"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="17%"><img src="images\button_1.gif" alt="" width="211" height="9" /></td>
                <td width="83%" ></td>
              </tr>
            </table></td>
          </tr>
        </table>
        <map id="btnMap" name="btnMap">
          <area shape="rect" alt="" coords="45,9,82,26" href="#" onclick="homePage_Click();" />
          <area shape="rect" alt="" coords="137,8,195,30" href="#" onclick="logout_Click();" />
          <area shape="rect" alt="" coords="241,9,298,28" href="#" onclick="shutDown_Click();" />
        </map>
    </div>
    </form>
</body>
</html>
