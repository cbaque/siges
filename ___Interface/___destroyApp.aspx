<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<%
Session.Abandon();
Session.Contents.RemoveAll();
%>
<%@ OutputCache Duration="60" VaryByParam="None"  %>
<link href="../___css/virtualcss.css" rel="stylesheet" type="text/css" />
<br>
<br>
<table width="57%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td><div align="right">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
            <tr>
              <td width="59%" height="30" valign="top" background="../../images/topL.gif" class="titblanco"><div align="left"><font size="3">SWA 
                - Sistema Web Acad&eacute;mico</font></div></td>
            </tr>
            <tr>
              <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="13%" valign="top"><div align="center"><img src="../___Images/___login/candado.jpg" width="49" height="59"></div></td>
                  <td width="87%"><font style="font-size: 14pt; font-family: Verdana, Arial, sans-serif; color: #4E4E4E;  line-height: 14pt" >La 
                    Sesi&oacute;n del usuario a Finalizado<br>
                    </font> <br>
                    <table width="97%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="6%">&nbsp;</td>
                        <td width="94%"><div align="justify">
                          <p><font color="#33FF00"><font size="2" face="Arial, Helvetica, sans-serif"><font color="#000000"> <br>
                            El tiempo en sesi&oacute;n de su cuenta ha 
                            finalizado, por favor vuelva a ingresar al 
                            sistema.</font></font></font></p>
                          <p><font color="#33FF00"><font size="2" face="Arial, Helvetica, sans-serif"><font color="#000000">Para 
                            ingresar hacer click en inicar sesi&oacute;n.<br>
                                                                        <br>
                            </font><font color="#333333" size="3" face="Arial, Helvetica, sans-serif"><strong><em><a href="../63f295684975d3598c0c19e1a3709f25.aspx" target="_parent">Volver a Iniciar 
                              Sesi&oacute;n &gt;&gt;</a></em></strong></font><font color="#000000"><br>
                                                                      </font></font></font></p>
                        </div></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
          </table>
          <font color="#333333" size="3" face="Arial, Helvetica, sans-serif"><font color="#000000" size="2"> </font></font></div></td>
      </tr>
    </table></td>
  </tr>
</table>
<%
Response.Redirect("../63f295684975d3598c0c19e1a3709f25.aspx");
%>

