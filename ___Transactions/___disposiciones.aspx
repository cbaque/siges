<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>

<script src="../___Objects/___Client/jquery-ui.min.js"> </script>
<%@ Import Namespace="Etiquetas" %>
<%
ComboLista dbTipoDisposicion;
dbTipoDisposicion = new ComboLista("cmbTipoDisposicion", "0", "exec SP_DISPOSICIONES 0,null,null,'A'", "", "", "", "cajaFormulario", "0", "");

ComboLista dbEstadoDisposicion;
dbEstadoDisposicion = new ComboLista("cmbEstadoDisposicion", "0", "exec SP_DISPOSICIONES 1,1,"+Session["sysIdPlanta"].ToString()+",'A',null", "", "", "", "cajaFormulario", "0", "");

ComboLista dbNaturalezaDisposicion;
dbNaturalezaDisposicion = new ComboLista("cmbNaturalezaDisposicion", "0", "exec SP_DISPOSICIONES 2,null,null,'A'", "", "", "", "cajaFormulario", "0", "");
%>

<div class="container">
    <div class="mb-3 row ms-3 me-3">
        <label for="txtNombreI" class="form-label">Disposici&oacute;n</label>
        <textarea class="form-control" name="txtNombreI" id="txtNombreI" rows="2"></textarea>
    </div>

    <div class="mb-3 row ms-3 me-3">
        <label for="cmbEstadoDisposicionI" class="form-label">Estado</label>
          <%		
		    dbEstadoDisposicion.Nombre=("cmbEstadoDisposicionI");
			dbEstadoDisposicion.CssCmb="form-select form-select-sm";
			Response.Write(dbEstadoDisposicion.cargarComboLista());
		%>
    </div>

    <div class="mb-3 row ms-3 me-3">
        <label for="cmbTipoDisposicionI" class="form-label">Tipo</label>
          <%		
		    dbTipoDisposicion.Nombre=("cmbTipoDisposicionI");
			dbTipoDisposicion.CssCmb="form-select form-select-sm";
			dbTipoDisposicion.Events=("onchange=' javascrit: var element1 = document.createElement(\"input\"); element1.type = \"hidden\"; element1.value = \"null\"; element1.name = \"cmbCabPlanti\"; document.getElementById(\"idPlanti\").innerHTML=null; this.value ==\"4\"? generalJS(\"0\",\"frmMeta|___sqlAjax3.aspx|cmbTipoDisposicionI;cmbTipoDisposicionI|idPlanti|GET|&typ=50\") : document.getElementById(\"idPlanti\").appendChild(element1);' ");
			Response.Write(dbTipoDisposicion.cargarComboLista());
		%>

        <div id="idPlanti" style='float:left;width: 178px;'></div>
    </div>

    <div class="mb-3 row ms-3 me-3">
        <label for="txtDetalleI" class="form-label">Detalle</label>
        <textarea class="form-control" name="txtDetalleI" id="txtDetalleI" rows="2"></textarea>
    </div>
</div>




<%--<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  >
  <tr>
    <td><div align="right" class="detalleDisposicion">Disposici&oacute;n:</div></td>
    <td width="56%"><span class="Estilo7">
      <textarea name="txtNombreI" cols="10" rows="2" class="cajaFormulario" id="txtNombreI" ></textarea>
    </span></td>
    <td width="27%"></td>
  </tr>
  <tr>
    <td width="17%"><div align="right"><span class="detalleDisposicion">Estado:</span></div></td>
    <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="110px" align="center" >
          <%		
		    dbEstadoDisposicion.Nombre=("cmbEstadoDisposicionI");
			dbEstadoDisposicion.CssCmb="cajaFormulario";
			//dbTipoDisposicion.ItemSelect = idP0;
			//dbEstadoDisposicion.Events=("style='float:left;width: 100px;'");
			Response.Write(dbEstadoDisposicion.cargarComboLista());
		%>
       </td>
        <td width="50px" align="center" ><span class="detalleDisposicion">Tipo:</span></td>
        <td width="120px" align="center" ><%
		    dbTipoDisposicion.Nombre=("cmbTipoDisposicionI");
			dbTipoDisposicion.CssCmb="cajaFormulario";
			//dbTipoDisposicion.ItemSelect = idP0;
			dbTipoDisposicion.Events=("onchange=' javascrit: var element1 = document.createElement(\"input\"); element1.type = \"hidden\"; element1.value = \"null\"; element1.name = \"cmbCabPlanti\"; document.getElementById(\"idPlanti\").innerHTML=null; this.value ==\"4\"? generalJS(\"0\",\"frmMeta|___sqlAjax3.aspx|cmbTipoDisposicionI;cmbTipoDisposicionI|idPlanti|GET|&typ=50\") : document.getElementById(\"idPlanti\").appendChild(element1);' ");
			Response.Write(dbTipoDisposicion.cargarComboLista());
		%></td>
        <td ><div id="idPlanti" style='float:left;width: 178px;'></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><span class="detalleDisposicion">Detalle:</span></div></td>
    <td valign="top"><span class="Estilo7">
      <textarea name="txtDetalleI" cols="10" rows="2" class="cajaFormulario" id="txtDetalleI"></textarea>
    </span></td>
    <td valign="top">    </td>
  </tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Fecha Inicial: </span></div></td>
    <td>
    
    
    <div style="float:left; width:35%;"><input name="txtFInicialI" type="text" class="cajaFormulario" id="txtFInicialI" size="7" maxlength="10" onClick="calenJquery('txtFInicialI');" style="width: 120px; float:left;"  /></div><div style="float:left; width:35%;"><input name="txtFFinalI" type="text" class="cajaFormulario" id="txtFFinalI" size="7" maxlength="10" onClick="calenJquery('txtFFinalI');"  style="float:left; width: 120px;" /></div>
    
    
        
    
        </td>
    <td></td>
  </tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Responsable:</span></div></td>
    <td><div style="float:left; width: 20%"><input name="txtResponsableI" type="text" class="cajaFormulario" id="txtResponsableI" size="20"  onkeyup="javascript: if (this.value.length>2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&op=1&tE=0|idAutoI|GET|txtResponsableI|txtResponsableSelI|idResponsableI');}" onclick="this.value='';" placeholder="Buscar" /><div id='idAutoI'></div></div><div style="float:left;width: 80%"><input name="txtResponsableSelI" type="text" class="cajaFormulario" id="txtResponsableSelI" size="20" placeholder="Responsable" readonly="readonly" /></div><div style="float:left;"><input name="idResponsableI" type="hidden" id="idResponsableI" value="" /></div>    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Corresponsable(s):</span></div></td>
    <td><span class="Estilo7">
      <div style="float:left; width: 20%"><input name="txtCoResponsableI" type="text" class="cajaFormulario" id="txtCoResponsableI" size="20"  onkeyup="javascript: if (this.value.length>2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&op=3&tE=0|idCoAutoI|GET|txtCoResponsableI|cmdCoResp|idCoResponsableI');}" onclick="this.value='';" placeholder="Buscar"  /><div id='idCoAutoI'></div></div><div style="float:left;width: 75%;">
        <select name="cmdCoResp" size="2" id="cmdCoResp"   class="cajaFormulario" style="height: 50px;"   >          
        </select>
       
      </div>
      <div style="float:left; width: 5%;">
       <a href="#" class="btn btn-warning btn-xs" onclick="javascript: objSel=document.getElementById('cmdCoResp');var idSel=document.getElementById('idCoResponsable'); if (objSel.options.selectedIndex != -1 ){; var str=''; for (i=0; i<objSel.options.length; i++){ if(objSel.options[i].selected){ objSel.options[i] = null; }} for (i=0; i<objSel.options.length; i++){ str += objSel.options[i].value + '|'; } idSel.value = str.substr(0,(str.length-1)); } else { alert('Por favor, seleccione un responsable antes de Remover.'); }">X</a>
      <input name="idCoResponsableI" type="hidden" id="idCoResponsableI" value="" /></div>
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>

    <td><div align="right"><span class="detalleDisposicion">Asociado(s):</span></div></td>
    <td><span class="Estilo7">
      <div style="float:left; width: 20%">
        <input name="txtAsociadoI" type="text" class="cajaFormulario" id="txtAsociadoI" size="20"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&amp;op=3&amp;tE=0|idAsoAutoI|GET|txtAsociadoI|txtAsociadoSelI|idAsociadoI');}" onclick="this.value='';" placeholder="Buscar"  />
        <div id='idAsoAutoI'></div>
      </div>
      <div style="float:left;width: 75%;">
        <select name="txtAsociadoSelI" size="2" id="txtAsociadoSelI"   class="cajaFormulario" style="height: 50px;"   >
        </select>
      </div>
      <div style="float:left; width: 5%;"> <a href="#" class="btn btn-warning btn-xs" onclick="javascript: objSel=document.getElementById('txtAsociadoSelI');var idSel=document.getElementById('idAsociadoI'); if (objSel.options.selectedIndex != -1 ){; var str=''; for (i=0; i&lt;objSel.options.length; i++){ if(objSel.options[i].selected){ objSel.options[i] = null; }} for (i=0; i&lt;objSel.options.length; i++){ str += objSel.options[i].value + '|'; } idSel.value = str.substr(0,(str.length-1)); } else { alert('Por favor, seleccione un Asociado antes de Remover.'); }">X</a>
          <input name="idAsociadoI" type="hidden" id="idAsociadoI" value="" />
      </div>
    </span></td>
    <td>&nbsp;</td>
  
</tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Naturaleza:</span></div></td>
    <td><%
		    dbNaturalezaDisposicion.Nombre=("cmbNaturalezaDisposicionI");
			dbNaturalezaDisposicion.CssCmb="cajaFormulario";
			//dbTipoDisposicion.ItemSelect = idP0;
			//dbTipoDisposicion.Events=("onChange='generalJS(\"0\",\"frmMeta|___sqlAjax.aspx|cmbEstanteria;cmbEstanteria|idArchivos|GET|&typ=2&tab=2\");'");
			Response.Write(dbNaturalezaDisposicion.cargarComboLista());
		%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Administrador:</span></div></td>
    <td><div style="float:left; width: 20%"><input name="txtAnalistaI" type="text" class="cajaFormulario" id="txtAnalistaI" size="20" onkeyup="javascript: if (this.value.length>2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&op=1&tE=1|idAnaAutoI|GET|txtAnalistaI|txtAnalistaSelI|idAnalistaI');}" onclick="this.value='';" placeholder="Buscar" /><div id='idAnaAutoI'></div></div><div style="float:left;width: 80%"><input name="txtAnalistaSelI" type="text" class="cajaFormulario" id="txtAnalistaSelI" size="20" placeholder="Analista" readonly="readonly"  /></div><div style="float:left;"><input name="idAnalistaI" type="hidden" id="idAnalistaI" value="" /></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><span class="detalleDisposicion">Antecedentes:</span></div></td>
    <td><span class="Estilo7">
      <textarea name="txtAntecedentesI" cols="40" rows="2" class="cajaFormulario" id="txtAntecedentesI"></textarea>
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><span class="detalleDisposicion">Observaciones:</span></div></td>
    <td><span class="Estilo7"> </span> <span class="Estilo7">
      <textarea name="txtObservacionI" rows="2"  class="cajaFormulario" id="txtObservacionI"></textarea>
    </span></td>
    <td><div id="idRegistroDisposicion"></div></td>
  </tr>
  <tr>
    <td valign="top" align="right"><span class="detalleDisposicion">Progreso:</span></td>
    <td> <div style="width: 75px; float:left;"> <input type="text" id="progresoI" class="cajaFormulario" onkeyup="javascript: barraProgreso(this.value, 'contendorProgresoI', 'idProgresoI');" value="" size="5" maxlength="2" placeholder="0-100"  onclick="this.value='';" />
    </div> 
	
        <div class="progress" id="contendorProgresoI">
          <div id="idProgresoI" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="8" aria-valuemin="0" aria-valuemax="100" style="width:0">0</div>
        </div></td>
    <td align="center"><button type='button' class="btn btn-primary" onclick="javascript: if (validateForm('frmMeta|txtNombreI;R|cmbEstadoDisposicionI;R|cmbTipoDisposicionI;R|txtDetalleI;R|txtFInicialI;R|txtFFinalI;B|txtResponsableI;B|cmbNaturalezaDisposicionI;R|txtAnalistaI;R|txtAntecedentesI;B|txtObservacionI;B')){generalJS('0','frmMeta|___sqlAjax.aspx|cmbEstadoDisposicionI;cmbTipoDisposicionI;cmbNaturalezaDisposicionI;idResponsableI;idCoResponsableI;idAsociadoI;txtNombreI;txtDetalleI;txtFInicialI;txtFFinalI;idAnalistaI;txtAntecedentesI;txtObservacionI;progresoI;cmbCabPlanti|idRegistroDisposicion|GET|&typ=7');}" >Guardar</button>
    <div align="center"></div></td>
  </tr>
</table>--%>

   
 