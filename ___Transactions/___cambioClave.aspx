<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>

<%@ Import Namespace="Etiquetas" %>

<br />
<table width="100%" border="0" align="center" cellpadding="5" cellspacing="5"  >
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="37%"><div align="right"  class="detalleDisposicion">Clave Actual:</div></td>
    <td width="63%"><div align="center" style="float: left; width: 40%;"><span class="Estilo7">
      <input name="txtClaveActual" type="password" class="cajaFormulario" id="txtClaveActual" size="10"  onBlur="javascript: encriptpassA.value= hex_md5(txtClaveActual.value); " />
    </span>
        <input name="encriptpassA" type="hidden" id="encriptpassA" />
    </div></td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><span class="detalleDisposicion">Clave Nueva:</span></div></td>
    <td valign="top"><div align="center" style="float: left; width: 40%;"><span class="Estilo7">
      <input name="txtClaveNueva" type="password" class="cajaFormulario" id="txtClaveNueva" size="10" onBlur="javascript: encriptpassC.value= hex_md5(txtClaveNueva.value); "  />
    </span>
        <input name="idSesion" type="hidden" id="idSesion" value="<%=Session["sysIdRrhh"].ToString()%>" />
    </div></td>
  </tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Confirmacion: </span></div></td>
    <td><div align="center" style="float: left; width: 40%;">
      <input name="txtClaveNuevaC" type="password" class="cajaFormulario" id="txtClaveNuevaC" size="10" maxlength="10"  />
       <input name="encriptpassC" type="hidden" id="encriptpassC" value="">
       
      
      
      
    </div></td>
  </tr>
  <tr>
    <td valign="top" align="right">&nbsp;</td>
    <td><br />
      <button type='button' class="btn btn-primary" onclick="javascript: if (validateForm('frmMeta|txtClaveActual;R|txtClaveNueva;R|txtClaveNuevaC;R')){generalJS('0','frmMeta|___sqlAjax1.aspx|encriptpassA;encriptpassC;idSesion|idCambioClave|GET|&typ=21');}" >Guardar</button>
    <div id="idCambioClave" style="float: right; width: 60%;"></div></td>
  </tr>
  <tr>
    <td valign="top" align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

