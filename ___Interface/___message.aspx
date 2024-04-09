<%
/******************************************************************************
EMPRESA: I-SOLUTIONS
AUTOR: SERGIO BAUZ O. 
VERSION: 1.0 
FECHA: NOVIEMBRE DE 2009
PROYECTO: SISLAB 
Descripcion:
Para el mantenimiento de la tabla de Analisis
********************************************************************************/
%>
<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<%@ Register TagPrefix="MnL" TagName="Bloqueo" Src="../___Interface/___vlock.ascx" %>
<%@ Register TagPrefix="MnA" TagName="MenuArriba" Src="../___Interface/___vsecure.ascx" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.style5 {
	font-size: 18px;
	font-weight: bold;
}
.style6 {font-size: 9px}
-->
</style>
<MnL:Bloqueo id="MLock" runat="server"/>
<MnA:MenuArriba id="MTop" runat="server"/>
<%
string nombreImagen = Request.QueryString["nI"];
string cuerpoMensaje = Request.QueryString["txt"];
string cerrar = Request.QueryString["c"];
//string rutaImagen = Request.QueryString["img"];


%>

<link href="../___css/virtualcss.css" rel="stylesheet" type="text/css">
<br>
<br>
<br>
<table width="450" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="28" valign="top" nowrap="nowrap" bgcolor="#008484" style="border-bottom:solid 1 #CCCCCC"><font color="#F1F1F1" size="4" face="Verdana, Arial, Helvetica, sans-serif"><strong><img src="../___Images/___login/as_esquinaAzul.gif" width="24" height="18" /></strong></font></td>
    <td width="312" height="30" valign="middle" bgcolor="#008484" style="border-bottom:solid 1 #CCCCCC"><span class="style5"> <font color="#F1F1F1" face="Verdana, Arial, Helvetica, sans-serif">.: ALMACENERA&reg; - Mensajes</font></span></td>
    <td width="110" valign="bottom" style="border-bottom:solid 1 #CCCCCC"><div align="right"> <font color="#333333" face="Arial, Helvetica, sans-serif"><strong><span class="letra">Ecuador,
      <%
		  Response.Write(String.Format("{0:yyyy/MM/dd}", DateTime.Now)); %></span>
                
    </strong></font></div></td>
  </tr>
</table>
<table width="450" border="0" align="center" cellpadding="0" cellspacing="0" class="gris" >
<tr> 
      <td>&nbsp;</td>
  </tr>
    <tr> 
      <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="16%" valign="middle"><div align="center"><img src="../___Images/<%=nombreImagen%>" ></div></td>
                  <td width="84%"> <table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
<tr> 
                        <td width="84%" class="letra"><br> <span class="nodecls"><%
						string[] matMensajes = cuerpoMensaje.Split('|');
						foreach (string mensaje in matMensajes){
						  Response.Write(mensaje + "<br>");
						}
						%></span></td>
                      </tr>
                      <tr> 
                        <td><div align="left"> </div></td>
                      </tr>
                    </table></td>
                </tr>
              </table>
              <br> <br>
              <table width="75%" border="0" align="center" cellpadding="1" cellspacing="0">
                <tr> 
                  <td valign="bottom"><div align="center"><strong><%=cerrar%></strong> 
                  </div></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
</table>
