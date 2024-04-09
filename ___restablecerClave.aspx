<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>

<br />
<table width="70%" border="0" align="center" cellpadding="2" cellspacing="2"  >
  <tr>
    <td width="37%"><div align="right" class="detalleDisposicion">Cedula:</div></td>
    <td width="63%"><span class="Estilo7">
      <input name="txtCedula" type="password" class="form-control" id="txtCedula" size="30"  />
    </span></td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><span class="detalleDisposicion">Email:</span></div></td>
    <td valign="top"><span class="Estilo7">
      <input name="txtEmail" type="text" class="form-control" id="txtEmail" size="30"  />
    </span></td>
  </tr>
  <tr>
    <td valign="top" align="right">&nbsp;</td>
    <td><button type='button' class="btn btn-primary" onclick="javascript: if (validateForm('frm_signIn|txtCedula;R|txtEmail;R')){ enviarClave.innerHTML=' Debe Ingresar una Cedula Valida, para Autenticacion de Usuario ... ';}" >Enviar</button>
    <div align="center" id="enviarClave"></div></td>
  </tr>
</table>

