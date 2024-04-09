<%
/******************************************************************************
EMPRESA: I-SOLUTIONS
AUTOR: SERGIO BAUZ O. 
VERSION: 1.0 
FECHA: ENERO DE 2010
PROYECTO: SISLAB 
Descripcion:
Para las consultas de base de datos usando AJAX
********************************************************************************/
%>
<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" Debug="true"  %>
<%@ OutputCache Duration="60" VaryByParam="None" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="DataAccessLayer" %>
<%@ Import Namespace="Etiquetas" %>

<%
Response.CacheControl = "no-cache";
 //Response.AddHeader "Pragma", "no-cache" ;
 //Response.Expires = -1;

string idP0;
string idP1;
string idP2;
string idP3;
string idP4;
string idP5; string idP6; string idP7; string idP8; string idP9; string idP10;
string idP11; string idP12; string idP13; string idP14; string idP15; string idP16;
string idP17; string idP18; string idP19; string idP20;string idP21;
string cuerpo;
string valAnalisis;
string strSQL = "";
string anio="" ; string mes="" ; string dia=""; string strFecha; string bgColor; string i;
string[] fecha;
string[] fecha1;
DateTime f; DateTime f1;
string[] matIDs;string[] matVals;string[] matRes;
int sec; int sec1;double secuencial=0; int estado; string strReportes;

//Instancia de Objetos para base de datos
IDBManager dbManager = new DBManager(DataProvider.OleDb);
ComboLista dbReportes;
dbReportes = new ComboLista("cmbReportes", "0", "spReportes 4,"+Session["sysEdicion"].ToString()+",null,'A'", "", "", "", "cajaFormulario", "0", "");

dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();

int tipo = Request.QueryString["typ"]!=null ? int.Parse(Request.QueryString["typ"]): -1;
//Response.Write(tipo);
//Response.End();
switch (tipo){
case 0:    
			//dbTipoDisposicion.Events=("onChange='generalJS(\"0\",\"frmMeta|___sqlAjax.aspx|cmbEstanteria;cmbEstanteria|idArchivos|GET|&typ=2&tab=2\");'");
%>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="78%" class="detalleDisposicion" height="30"><div style="float:left; width:15%;">Elegir Reportes: </div><div id="idGeneraReporte" style="float:left; width:35%;" >
      <% 
	        dbReportes.Nombre=("cmbListadoReportes");
			dbReportes.CssCmb="cajaFormulario";
			//dbReportes.ItemSelect = "2";
			dbReportes.Events=("onChange='javascript: if (validateForm(\"frmMeta|cmbListadoReportes;R\")){generalJS(\"0\",\"frmMeta|___sqlAjax2.aspx|cmbListadoReportes;cmbListadoReportes|idReportResult|GET|&typ=1\");}'");
			
				  
	  Response.Write(dbReportes.cargarComboLista()); %>
  </div></td>
    <td width="22%"  align="center"  style="border-radius: 15px 15px 0px 0px; height:25px; color: #ffffff; font-size: 12px;font-family: Verdana, Arial, Helvetica, sans-serif;text-decoration: none;" class="colorGrid">&nbsp;&nbsp;Gesti&oacute;n de Reportes</td>
  </tr>
</table>
<div style='position:relative ; left:25px; width:95%; height: 550px; overflow:auto;border-left: solid 1px #CCCCCC; border-bottom: solid 1px #CCCCCC;border-radius: 10px 0px 10px 10px; border-top:solid 1px #CCCCCC;' align="center">
   
   <div id="idReportResult" ></div> 
</div>
  <%

break;
case 1:
idP0=""; idP1=""; idP2="";idP3="";
		idP0=Request.QueryString["p0"];
		//idP3=Request.QueryString["p1"];
		    switch (idP0){ case "1": idP1="2"; idP2="8"; break;  //Pre-Contractuales
					       case "2": idP1="2"; idP2="4"; break;  //General
					       case "3": idP1="2"; idP2="6"; break;  //Por Disposicion
					       case "4": idP1="2"; idP2="5"; break;  //Por Estado
					       case "5": idP1="2"; idP2="3"; break;	 //Alcalde	
						   }					
//Response.Write(idP1+":"+idP2+":"+idP3); %>
    <table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%">
      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#home" data-toggle="tab" class="badge" onclick="javascript:  var objR=eval('document.forms[0].cmbListadoReportes'); objExcel=document.getElementById('printExcel'); objPdf=document.getElementById('printPDF'); generalJS('0','frmMeta|___sqlAjax2.aspx|cmbListadoReportes;cmbListadoReportes|idExec|GET|&typ=<%=idP1%>&id='+objR.value); objPdf.style.visibility='hidden'; objExcel.style.visibility='hidden';var objIdRespon=eval('document.forms[0].idResponsableR'); objIdRespon.value=''; var objIdRespon1=eval('document.forms[0].idResponsablePRE'); objIdRespon1.value=''; var objIdPara=eval('document.forms[0].idParametros'); objIdPara.value=''; " >Configuraci&oacute;n</a></li>
        <li role="presentation">
        <% if (idP0=="5"){  // Caso Alcalde %>
        <a href="#profile" data-toggle="tab" class="badge" onclick="javascript: var objR=eval('document.forms[0].cmbListadoReportes'); objExcel=document.getElementById('printExcel'); objPdf=document.getElementById('printPDF');leerReportes('frmMeta|___sqlAjax2.aspx|cmbListadoReportes;cmbListadoReportes|GET|&typ=<%=idP2%>&id='+objR.value+'|idExec');    
        objPdf.style.visibility='visible'; //objExcel.style.visibility='visible';">Presentaci&oacute;n&nbsp;&nbsp;</a>
        <% } %>
        
         <% if (idP0=="2"){  //Caso General %>
        <a href="#profile" data-toggle="tab" class="badge" onclick="javascript: var objR=eval('document.forms[0].cmbListadoReportes'); objExcel=document.getElementById('printExcel'); objPdf=document.getElementById('printPDF');
 leerReportes('frmMeta|___sqlAjax2.aspx|cmbListadoReportes;idResponsableR|GET|&typ=<%=idP2%>&id='+objR.value+'|idExec');         objPdf.style.visibility='visible'; //objExcel.style.visibility='visible';">Presentaci&oacute;n&nbsp;&nbsp;</a>
        <% } %>
        
        <% if (idP0=="4"){  //Por Estado %>
        <a href="#profile" data-toggle="tab" class="badge" onclick="javascript: var objR=eval('document.forms[0].idResponsableR'); objExcel=document.getElementById('printExcel'); objPdf=document.getElementById('printPDF'); leerReportes('frmMeta|___sqlAjax2.aspx|idResponsablePRE;idResponsableR|GET|&typ=<%=idP2%>&id='+objR.value+'|idExec');
        objPdf.style.visibility='visible'; objExcel.style.visibility='visible';">Presentaci&oacute;n&nbsp;&nbsp;</a>
        <% } %>
        
        <% if (idP0=="3"){  //Por Disposicion %>
     
        <a href="#" data-toggle="tab" class="badge" onclick="javascript: if (validateForm('frmMeta|idResponsableR;R')){ var objR=eval('document.forms[0].cmbListadoReportes'); objExcel=document.getElementById('printExcel'); objPdf=document.getElementById('printPDF'); leerReportes('frmMeta|___sqlAjax2.aspx|idResponsableR;idResponsableR|GET|&typ=<%=idP2%>&id='+objR.value+'|idExec'); objPdf.style.visibility='visible'; /*objExcel.style.visibility='visible';*/}">Presentaci&oacute;n&nbsp;&nbsp;</a>
        <% } %>
        
         <% if (idP0=="1"){  //Por Pre-Contractuales %>
        <a href="#profile" data-toggle="tab" class="badge" onclick="javascript: var objR=eval('document.forms[0].cmbListadoReportes'); objExcel=document.getElementById('printExcel'); objPdf=document.getElementById('printPDF');leerReportes('frmMeta|___sqlAjax2.aspx|idResponsablePRE;cmbCabPlantilla|GET|&typ=<%=idP2%>&id='+objR.value+'|idExec'); objPdf.style.visibility='visible'; objExcel.style.visibility='visible'; ">Presentaci&oacute;n&nbsp;&nbsp;</a>
        <% } %>
        
        </li>
      </ul></td>
    <td width="50%" ><div id="printPDF" style="float:right; width:10%; visibility:hidden; margin-left: 13px;"> <a href="#" onclick="javascript: var objR=eval('document.forms[0].idParametros'); var objR1=eval('document.forms[0].idResponsableR');  objR2=eval('document.forms[0].idResponsablePRE'); abrirVentanaPrint('___sqlExport.aspx?typ=<%=idP2%>&mC='+objR.value+'&idR='+objR1.value+'&idR1='+objR2.value+'&pr=pdf','hijo654321','status=yes,width=960,height='+ (screen.height-100) +'');"  class="btn btn-primary btn-xs"> PDF </a> </div><div id="printExcel" style="float:right; width:10%; visibility:hidden;margin-left: 25px;"> <a href="#"  onclick="javascript: var objR=eval('document.forms[0].idParametros'); var objR1=eval('document.forms[0].idResponsableR');  objR2=eval('document.forms[0].idResponsablePRE'); window.parent.location='___sqlExport.aspx?typ=<%=idP2%>&mC='+objR.value+'&idR='+objR1.value+'&idR1='+objR2.value+'&pr=xls';"  class='btn btn-info btn-xs' target="_parent" > EXCEL </a> </div></td>
  </tr>
</table>
<div id="idExec" style=" width: 100%;" > </div>	
<input name="idResponsableR" type="hidden" id="idResponsableR" value="" />
<input name="idResponsablePRE" type="hidden" id="idResponsablePRE" value="" />
<input name="idParametros" type="hidden" id="idParametros" value="" />
<%

break;
case 2:  
 idP0 = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";

   if (Session["sysEdicion"].ToString()=="1"){ //Para el caso de Administradores
  %>
<div style='width: 95%; height:470px; overflow:auto;'><br  />

<% if (idP0=="5"){  //Caso Alcalde 
	 try  {  sec=0; idP1="";  
	   
	   dbManager.Open(); strSQL = "spReportes 5,"+ idP0 +",null,'A'";  //Response.Write(strSQL + "p0: " + idP0);
	   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {		
		 if (sec < 1){
%>  
  <span class="tituloGrid"   style=" float:left; width:50%; height: 22; font-size:13px; border-radius: 10px 10px 0px 0px;"    > Seleccione la Informaci&oacute;n que desea visualizar:  </span><br><br>
  <table width="70%" border="0" cellpadding="0" cellspacing="0" align="left"  >
 
	       <%} sec++;	%> 
  <tr class="detalleDisposicion"  >
    <td style="border-bottom:solid 1px #f1f1f1; "   height="30" width="10%"><div align="center"><%=sec%></div></td>
    <td style="border-bottom:solid 1px #f1f1f1; "  ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>"  value="<%=sec%>"  /></td>   
      <div align="left"></div><td width="32%"></td>
    </tr>
          <%} }catch (Exception ex){ Response.Write(ex.Message.ToString());  
              }finally{ dbManager.Dispose(); } %>
</table>
  
<% } %>

<% if (idP0=="2"){  //Caso General %>
<label style="float:left; width:10%;" class="detalleDisposicion" >&nbsp;Responsable: </label> 
 <div style="float: left; width:10%;"><input name="txtResponsableR" type="text" class="cajaFormulario" id="txtResponsableR" size="10"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax2.aspx?typ=7&op=1|idAutoDisposicionReportPRE|GET|txtResponsableR|txtResponsableSelR|idResponsableR');}" onclick="this.value=''; var objSelE=document.getElementById('txtResponsableSelR'); objSelE.value=''; var objIdE=document.getElementById('idResponsableR'); objIdE.value=''; " placeholder="Buscar"/><div id='idAutoDisposicionReportPRE' style="width: 30%" ></div></div><div style="float:left; width:20%; "><input name="txtResponsableSelR" type="text" class="cajaFormulario" id="txtResponsableSelR" size="10"  value=""  readonly="readonly"/></div>
<br /><br />
 <% try  {  sec=0; idP1="";   
   
   dbManager.Open(); strSQL = "spReportes 13,"+ idP0 +","+ Session["sysEdicion"].ToString() +",'A'";   // Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {
	
	 if (sec < 1){
%>
<span class="tituloGrid"   style=" float:left; width:50%;height: 22; font-size:13px; border-radius: 10px 10px 0px 0px;"    > Seleccione la Informaci&oacute;n que desea visualizar:  </span><br><br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="left"  >
  
	       <%}sec++;	%> 
  <tr class="detalleDisposicion" >
    <td style="border-bottom:solid 1px #f1f1f1; "  height="30"><div align="center"><%=sec%></div></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>"  value="<%=sec%>"  /></td>   
      <div align="left"></div><td width="32%"></td>
    </tr>
          <%} }catch (Exception ex){ Response.Write(ex.Message.ToString());  
              }finally{ dbManager.Dispose(); } %>
</table>

<% } %>

<% if (idP0=="4"){  //Caso Estados 
%>

<label style="float:left; width:10%;" class="detalleDisposicion" >&nbsp;Responsable: </label> 
 <div style="float: left; width:10%;"><input name="txtResponsableR" type="text" class="cajaFormulario" id="txtResponsableR" size="10"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax2.aspx?typ=7&op=1|idAutoDisposicionReportPRE|GET|txtResponsableR|txtResponsableSelR|idResponsableR');}" onclick="this.value=''; var objSelE=document.getElementById('txtResponsableSelR'); objSelE.value=''; var objIdE=document.getElementById('idResponsableR'); objIdE.value=''; " placeholder="Buscar"/><div id='idAutoDisposicionReportPRE' style="width: 30%" ></div></div><div style="float:left; width:20%; "><input name="txtResponsableSelR" type="text" class="cajaFormulario" id="txtResponsableSelR" size="10"  value=""  readonly="readonly"/></div>
<br /><br />
 <% try  {  sec=0; idP1="";   
   
   dbManager.Open(); strSQL = "spReportes 5,"+ idP0 +",null,'A'";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {
	
	 if (sec < 1){
%>
<span class="tituloGrid"   style=" float:left; width:50%; height: 22; font-size:13px; border-radius: 10px 10px 0px 0px;"    > Seleccione la Informaci&oacute;n que desea visualizar:  </span><br><br>
<span class="detalleDisposicion" style="float:left;" ><strong>Nivel de Responsabilidad:</strong></span> <br><br>
<table width="50%" border="0" cellpadding="0" cellspacing="0" align="left"  >
	 <tr class="detalleDisposicion" >      
		   <%}sec++;   %> 
    <td  align="right" ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>"  value="<%=dbManager.DataReader["id_rrhh"].ToString()%>"  /></td>
   
          <%} %>
    </tr>
	

	 
</table>

<%  sec1=sec; idP1="";   
   
   dbManager.Open(); strSQL = "spReportes 11,"+ idP0 +",null,'A',2";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  %>
   <br /> <br />
   <table width="50%" border="0" cellpadding="0" cellspacing="0" align="left"  >
   
 <%   while(dbManager.DataReader.Read()) {
	
   sec1++;	%> 
  <tr class="detalleDisposicion" >
    <td style="border-bottom:solid 1px #f1f1f1; "  height="30" width="20%"><div align="center"><%=(sec1-sec )%></div></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " align="left" width="50%"><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " align="right" width="30%"><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>"  value="<%=dbManager.DataReader["id_rrhh"].ToString()%>"  /></td>   
  
    </tr>
 <%} %>

<tr class="detalleDisposicion" >
    <td style="border-bottom:solid 1px #f1f1f1; "  height="30" width="20%"><div align="center"></div></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " align="left" width="50%"><strong>Excluir:</strong> </td>
    <td  style="border-bottom:solid 1px #f1f1f1; " align="right" width="30%"><select name="cmbCatDisposicion" id="cmbCatDisposicion" class="cajaFormulario" height="30" onchange="javascript: idResponsablePRE.value = this.value;">
      <option value="-1" selected="selected">Ninguno</option>
      <option value="4">Cadenas</option>
    </select></td>   
  
    </tr>
 </table>
 

<% sec=0; idP1="";   
   
   dbManager.Open(); strSQL = "exec spReportes 11,"+ idP0 +",null,'A',3";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {
	
	 if (sec < 1){
%>
<div class="detalleDisposicion" style="float:left;margin-top: 20px; width: 90%;"  align="left" ><strong>Opcionales:</strong></div> <br>
<table width="50%" border="0" cellpadding="0" cellspacing="0"  style=" float:left; margin-left: 3px; margin-top: 5px;"  >
	 <tr class="detalleDisposicion" >      
		   <%}sec++;   %> 
    <td  align="right" ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td align="left" ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>"  value="<%=dbManager.DataReader["id_rrhh"].ToString()%>" /></td>
   
          <%} %>
    </tr>		 
</table>


<% }catch (Exception ex){ Response.Write(ex.Message.ToString());  
              }finally{ dbManager.Dispose(); } %>


</div>

<% } %>

<% if (idP0=="3"){  //Caso Disposiciones 
 try  {  sec=0; idP1="";  
   
   dbManager.Open(); strSQL = "spReportes 5,"+ idP0 +",null,'A'";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {
	
	 if (sec < 1){
%>
<span class="tituloGrid"   style=" float:left; width:60%;  height: 22; font-size:13px; border-radius: 10px 10px 0px 0px;"    > Seleccione la Informaci&oacute;n que desea visualizar:  </span><br><br>
<table width="60%" border="0" cellpadding="0" cellspacing="0" align="left"  >
 <!-- <tr class="tituloGrid"  >
    <td width="4%" bgcolor="#38A0FE"  height="25" ><div align="center">No.</div></td>
    <td width="51%" bgcolor="#38A0FE" ><div align="center">Detalle</div></td>
    <td width="13%" bgcolor="#38A0FE" ><div align="center">Opcion</div></td>   
    </tr>-->
	 <tr class="detalleDisposicion" >      
		   <%}sec++;   %> 
  
   
    <td  align="right" ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>"  value="<%=sec%>"  /></td>   
    
   
          <%} %>
  </tr>
		  <%}catch (Exception ex){ Response.Write(ex.Message.ToString());  
              }finally{ dbManager.Dispose(); } %>
</table>
<br /> <br />
<table width="100%" border="0"  cellpadding="0" cellspacing="1">
  <tr>
   
    <td width="159" class="detalleDisposicion" ><div align="right">Por Disposicion: </div></td>
    <td colspan="2"><div style="float:left; width: 35%;"><input name="txtBDisposicionRep" type="text"  class="cajaFormulario" id="txtBDisposicionRep" value="" size="10" onkeyup="javascript: var oId1=document.getElementById('txtFechIniRep');  var oId2=document.getElementById('txtFechFinRep'); var oId3=eval('document.forms[0].cmbEstDisposRep'); if (this.value.length>2){ iniTab('___sqlAjax2.aspx|txtBDisposicionRep;txtBDisposicionRep|idBusRep|GET|9&ti=0&id1='+oId1.value+'&id2='+oId2.value+'&id3='+oId3.value); }" placeholder="Nombre"  onclick="this.value=''; var o1=eval('document.forms[0].txtSelDispRep'); o1.value=''; var o2=eval('document.forms[0].idResponsableR'); o2.value=''; "/></div><div style="float:left; width: 65%;">
<input name="txtSelDispRep" type="text" class="cajaFormulario" id="txtSelDispRep"  style="background-color: #FFFFCC"  value="" readonly="readonly" /></div></td>
    <td><input name="txtNumDispBuscar" type="text" class="cajaFormulario" id="txtNumDispBuscar" size="7"  value="" placeholder="No."  style="float:left; width: 50px; margin-left: 10px;" maxlength="50" /> 
    <a href="#" class="btn btn-success btn-xs" onclick="javascript:  var oId1=document.getElementById('txtNumDispBuscar'); if(validateForm('frmMeta|txtNumDispBuscar;R')){    iniTab('___sqlAjax2.aspx|txtNumDispBuscar;txtNumDispBuscar|idBusRep|GET|9&ti=2&i1='+oId1.value);}" style="float: left; margin-left: 5px;" >Buscar</a></td>
  </tr>
  <tr>
 
    <td class="detalleDisposicion" ><div align="right">Por Fecha y Estado: </div></td>
    <td width="356"><div style="float:left; width: 50%;"><input name="txtFechIniRep" type="text" class="cajaFormulario" id="txtFechIniRep" size="7" maxlength="10"  value="" placeholder="Desde" onClick="calenJquery('txtFechIniRep');" style="float:left; width: 90px;" /></div>
      
    <div style="float:left; width:50%;"><input name="txtFechFinRep" type="text" class="cajaFormulario" id="txtFechFinRep" size="7" maxlength="10" value="" placeholder="Hasta" onClick="calenJquery('txtFechFinRep');" style="float:left; width: 90px;"/> </div></td>
    <td width="197" ><%		
		    ComboLista dbEstDisp;
dbEstDisp = new ComboLista("cmbEstDisposRep", "0", "exec SP_DISPOSICIONES 1,1,"+Session["sysIdPlanta"].ToString()+",'A'", "", "", "", "cajaFormulario", "0", "");
			dbEstDisp.Nombre=("cmbEstDisposRep");
			dbEstDisp.CssCmb="cajaFormulario";
			//dbEstadoDisposicion.ItemSelect = idP19;
			//dbTipoDisposicion.Events=("onChange='generalJS(\"0\",\"frmMeta|___sqlAjax.aspx|cmbEstanteria;cmbEstanteria|idArchivos|GET|&typ=2&tab=2\");'");
			Response.Write(dbEstDisp.cargarComboLista());
		%></td>
    <td width="508" ><a href="#" class="btn btn-primary btn-xs" onClick="javascript:  var oId1=document.getElementById('txtFechIniRep');  var oId2=document.getElementById('txtFechFinRep'); var oId3=eval('document.forms[0].cmbEstDisposRep'); if (validateForm('frmMeta|txtFechIniRep;R|txtFechFinRep;R')){ iniTab('___sqlAjax2.aspx|txtBDisposicionRep;txtBDisposicionRep|idBusRep|GET|9&ti=1&i1='+oId1.value+'&id2='+oId2.value+'&id3='+oId3.value); }" >Buscar</a></td>
  </tr>
</table>
<br /> 
<div id="idBusRep"></div>
<% } %>

<% if (idP0=="1"){  //Caso Pre-Contractuales 
 try  {  sec=0; idP1="";   
   %>

   <label style="float:left; width:10%;" class="detalleDisposicion" >&nbsp;Cadenas: </label>
 <div style="float:left; margin-left:2px; width: 20%;"><%
strSQL="exec spPlantillas 7,"+Session["sysIdPlanta"].ToString()+",4,"+Session["sysIdRrhh"].ToString()+",null,"+Session["sysEdicion"]+",'A'";		    
dbReportes.StrSQL=strSQL;
			dbReportes.Nombre=("cmbCabPlantilla");
			dbReportes.CssCmb="cajaFormulario";
			dbReportes.ItemSelect = "";
			dbReportes.Events=("onchange='javascript: var objSel=document.getElementById(\"idResponsableR\"); objSel.value=this.value;'");
			Response.Write(dbReportes.cargarComboLista()); 
		%></div><br /><br />
   <%
   dbManager.Open(); strSQL = "exec spReportes 5,"+ idP0 +","+Session["sysIdRrhh"].ToString()+",'A'";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {
	
	 if (sec < 1){
%>

<label style="float:left; width:10%;" class="detalleDisposicion" >&nbsp;Responsable: </label> 
 <div style="float: left; width:10%;"><input name="txtResponsablePRE" type="text" class="cajaFormulario" id="txtResponsablePRE" size="10"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax2.aspx?typ=7&op=2|idAutoDisposicionReportPRE|GET|txtResponsablePRE|txtResponsableSelPRE|idResponsablePRE');}" onclick="this.value=''; var objSelE=document.getElementById('txtResponsableSelPRE'); objSelE.value=''; var objIdE=document.getElementById('idResponsablePRE'); objIdE.value=''; " placeholder="Buscar"/><div id='idAutoDisposicionReportPRE' style="width: 30%" ></div></div><div style="float:left; width:20%; "><input name="txtResponsableSelPRE" type="text" class="cajaFormulario" id="txtResponsableSelPRE" size="10"  value=""  readonly="readonly"/></div><br><br>
<span class="tituloGrid"   style=" float:left; width:50%; height: 22; font-size:13px; border-radius: 10px 10px 0px 0px;"    > Seleccione la Informaci&oacute;n que desea visualizar:  </span><br><br>
<table width="70%" border="0" cellpadding="0" cellspacing="0" align="left"  >
  
	       <%}sec++;	%> 
  <tr class="detalleDisposicion" >
    <td style="border-bottom:solid 1px #f1f1f1; "  height="30" width="10%"><div align="center"><%=sec%></div></td>
    <td style="border-bottom:solid 1px #f1f1f1; " align="left" ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td style="border-bottom:solid 1px #f1f1f1; " align="center" ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=-sec%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=-sec%>"  value="<%=-sec%>"  /></td>   
      <div align="left"></div><td width="32%"></td>
  </tr>
          <%}  %>
</table>

<br />
<%  sec1=sec; idP1="";   
   
   dbManager.Open(); strSQL = "spReportes 11,4,null,'A',2";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  %>
   <br /> <span class="tituloGrid"   style=" float:left; width:60%; height: 22; font-size:13px; border-radius: 10px 10px 0px 0px;"    > Seleccione El estado de la Disposici&oacute;n:  </span> <br />
   <table width="60%" border="0" cellpadding="0" cellspacing="0" align="left" style=" float:left; margin-left: 13px; margin-top: 3px;" >
   
 <%   while(dbManager.DataReader.Read()) {
	
   sec1++;	%> 
  <tr class="detalleDisposicion" >
    <!--<td style="border-bottom:solid 1px #f1f1f1; "  height="30" width="20%"><div align="center"><%//=(sec1-sec )%></div></td>-->
    <td  style="border-bottom:solid 1px #f1f1f1; "  width="50%" height="25" align="left" ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  style="border-bottom:solid 1px #f1f1f1; "  width="30%" align="left"><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>"  value="<%=dbManager.DataReader["id_rrhh"].ToString()%>"  /></td>   
  
    </tr>
        
 <%} %>
 
 <!--<tr class="detalleDisposicion" >
    <td style="border-bottom:solid 1px #f1f1f1; "  height="30" width="20%"><div align="center"></div></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " align="left" width="50%"><strong>Excluir:</strong> </td>
    <td  style="border-bottom:solid 1px #f1f1f1; " align="right" width="30%"><select name="cmbCatDisposicion" id="cmbCatDisposicion" class="cajaFormulario" onchange="javascript: idResponsablePRE.value = this.value;" style="height: 28px;">
      <option value="-1" selected="selected">Ninguno</option>
      <option value="4">Cadenas</option>
    </select></td> -->  
  
    </tr>
 
 </table>


<%
}catch (Exception ex){ Response.Write(ex.Message.ToString());  
              }finally{ dbManager.Dispose(); }

 } %>
</div>

<%
}else{ //Caso Gestores
   //Response.Write("Gestores");
%>

<div style='width: 95%; height:470px; overflow:auto;'><br  />

<% if (idP0=="5"){  //Caso Alcalde 
	 try  {  sec=0; idP1="";  
	   
	   dbManager.Open(); strSQL = "spReportes 5,"+ idP0 +",null,'A'";  //Response.Write(strSQL + "p0: " + idP0);
	   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {		
		 if (sec < 1){
%>  
  <span class="tituloGrid"   style=" float:left; width:50%; height: 22; font-size:13px; border-radius: 10px 10px 0px 0px;"    > Seleccione la Informaci&oacute;n que desea visualizar:  </span><br><br>
  <table width="70%" border="0" cellpadding="0" cellspacing="0" align="left"  >
 
	       <%} sec++;	%> 
  <tr class="detalleDisposicion"  >
    <td style="border-bottom:solid 1px #f1f1f1; "   height="30" width="10%"><div align="center"><%=sec%></div></td>
    <td style="border-bottom:solid 1px #f1f1f1; "  ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>"  value="<%=sec%>"  /></td>   
      <div align="left"></div><td width="32%"></td>
    </tr>
          <%} }catch (Exception ex){ Response.Write(ex.Message.ToString());  
              }finally{ dbManager.Dispose(); } %>
</table>
  
<% } %>

<% if (idP0=="2"){  //Caso General 
 try  {  sec=0; idP1="";   
   
   dbManager.Open(); strSQL = "spReportes 13,"+ idP0 +","+ Session["sysEdicion"].ToString() +",'A'";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {
	
	 if (sec < 1){
%>
<span class="tituloGrid"   style=" float:left; width:50%; height: 22; font-size:13px; border-radius: 10px 10px 0px 0px;"    > Seleccione la Informaci&oacute;n que desea visualizar:  </span><br><br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="left"  >
  
	       <%}sec++;	%> 
  <tr class="detalleDisposicion" >
    <td style="border-bottom:solid 1px #f1f1f1; "  height="30"><div align="center"><%=sec%></div></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>"  value="<%=sec%>"  /></td>   
      <div align="left"></div><td width="32%"></td>
    </tr>
          <%} }catch (Exception ex){ Response.Write(ex.Message.ToString());  
              }finally{ dbManager.Dispose(); } %>
</table>

<% } %>

<% if (idP0=="4"){  //Caso Estados 
%>

<label style="float:left; width:10%;" class="detalleDisposicion" >&nbsp;Responsable: </label> 
 <div style="float: left; width:10%;"><input name="txtResponsableR" type="text" class="cajaFormulario" id="txtResponsableR" size="10"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax2.aspx?typ=7&op=1|idAutoDisposicionReportPRE|GET|txtResponsableR|txtResponsableSelR|idResponsableR');}" onclick="this.value=''; var objSelE=document.getElementById('txtResponsableSelR'); objSelE.value=''; var objIdE=document.getElementById('idResponsableR'); objIdE.value=''; " placeholder="Buscar"/><div id='idAutoDisposicionReportPRE' style="width: 30%" ></div></div><div style="float:left; width:20%; "><input name="txtResponsableSelR" type="text" class="cajaFormulario" id="txtResponsableSelR" size="10"  value=""  readonly="readonly"/></div>
<br /><br />
 <% try  {  sec=0; idP1="";   
   
   dbManager.Open(); strSQL = "spReportes 5,"+ idP0 +",null,'A'";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {
	
	 if (sec < 1){
%>
<span class="tituloGrid"   style=" float:left; width:50%; height: 22; font-size:13px; border-radius: 10px 10px 0px 0px;"    > Seleccione la Informaci&oacute;n que desea visualizar:  </span><br><br>
<span class="detalleDisposicion" style="float:left;" ><strong>Nivel de Responsabilidad:</strong></span> <br><br>
<table width="50%" border="0" cellpadding="0" cellspacing="0" align="left"  >
	 <tr class="detalleDisposicion" >      
		   <%}sec++;   %> 
    <td  align="right" ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>"  value="<%=dbManager.DataReader["id_rrhh"].ToString()%>"  /></td>
   
          <%} %>
    </tr>
		 
</table>

<%  sec1=sec; idP1="";   
   
   dbManager.Open(); strSQL = "spReportes 11,"+ idP0 +",null,'A',2";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  %>
   <br /> <br />
   <table width="50%" border="0" cellpadding="0" cellspacing="0" align="left" style=" float:left; margin-left: 3px; margin-top: 3px;" >
   
 <%   while(dbManager.DataReader.Read()) {
	
   sec1++;	%> 
  <tr class="detalleDisposicion" >
    <td style="border-bottom:solid 1px #f1f1f1; "  height="30" width="20%"><div align="center"><%=(sec1-sec )%></div></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " align="left" width="50%"><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " align="right" width="30%"><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>"  value="<%=dbManager.DataReader["id_rrhh"].ToString()%>"  /></td>   
  
    </tr>
        
 <%} %>
 
 <tr class="detalleDisposicion" >
    <td style="border-bottom:solid 1px #f1f1f1; "  height="30" width="20%"><div align="center"></div></td>
    <td  style="border-bottom:solid 1px #f1f1f1; " align="left" width="50%"><strong>Excluir:</strong> </td>
    <td  style="border-bottom:solid 1px #f1f1f1; " align="right" width="30%"><select name="cmbCatDisposicion" id="cmbCatDisposicion" class="cajaFormulario" height="30" onchange="javascript: idResponsablePRE.value = this.value;">
      <option value="-1" selected="selected">Ninguno</option>
      <option value="4">Cadenas</option>
    </select></td>   
  
    </tr>
 
 </table>


 <% sec=0; idP1="";   
   
   dbManager.Open(); strSQL = "exec spReportes 11,"+ idP0 +",null,'A',3";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {
	
	 if (sec < 1){
%>
<div class="detalleDisposicion" style="float:left;margin-top: 20px; width: 90%;"  align="left" ><strong>Opcionales:</strong></div> <br>
<table width="50%" border="0" cellpadding="0" cellspacing="0"  style=" float:left; margin-left: 3px; margin-top: 5px;"  >
	 <tr class="detalleDisposicion" >      
		   <%}sec++;   %> 
    <td  align="right" ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td align="left" ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=dbManager.DataReader["id_rrhh"].ToString()%>"  value="<%=dbManager.DataReader["id_rrhh"].ToString()%>" /></td>
   
          <%} %>
    </tr>		 
</table>

 
 
<% }catch (Exception ex){ Response.Write(ex.Message.ToString());  
              }finally{ dbManager.Dispose(); } %>


</div>

<% } %>


<% if (idP0=="3"){  //Caso Disposiciones 
 try  {  sec=0; idP1="";  
   
   dbManager.Open(); strSQL = "spReportes 5,"+ idP0 +",null,'A'";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {
	
	 if (sec < 1){
%>
<span class="tituloGrid"   style=" float:left; width:60%; height: 22; font-size:13px; border-radius: 10px 10px 0px 0px;"    > Seleccione la Informaci&oacute;n que desea visualizar:  </span><br><br>
<table width="60%" border="0" cellpadding="0" cellspacing="0" align="left"  >
 <!-- <tr class="tituloGrid"  >
    <td width="4%" bgcolor="#38A0FE"  height="25" ><div align="center">No.</div></td>
    <td width="51%" bgcolor="#38A0FE" ><div align="center">Detalle</div></td>
    <td width="13%" bgcolor="#38A0FE" ><div align="center">Opcion</div></td>   
    </tr>-->
	 <tr class="detalleDisposicion" >      
		   <%}sec++;   %> 
  
   
    <td  align="right" ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>"  value="<%=sec%>"  /></td>   
    
   
          <%} %>
  </tr>
		  <%}catch (Exception ex){ Response.Write(ex.Message.ToString());  
              }finally{ dbManager.Dispose(); } %>
</table>
<br /> <br />
<table width="100%" border="0"  cellpadding="0" cellspacing="1">
  <tr>
   
    <td width="159" class="detalleDisposicion" ><div align="right">Por Disposicion: </div></td>
    <td colspan="2"><div style="float:left; width: 35%;"><input name="txtBDisposicionRep" type="text"  class="cajaFormulario" id="txtBDisposicionRep" value="" size="10" onkeyup="javascript: var oId1=document.getElementById('txtFechIniRep');  var oId2=document.getElementById('txtFechFinRep'); var oId3=eval('document.forms[0].cmbEstDisposRep'); if (this.value.length>2){ iniTab('___sqlAjax2.aspx|txtBDisposicionRep;txtBDisposicionRep|idBusRep|GET|9&ti=0&id1='+oId1.value+'&id2='+oId2.value+'&id3='+oId3.value); }" placeholder="Nombre"  onclick="this.value=''; var o1=eval('document.forms[0].txtSelDispRep'); o1.value=''; var o2=eval('document.forms[0].idResponsableR'); o2.value=''; "/></div><div style="float:left; width: 65%;">
      <input name="txtSelDispRep" type="text" class="cajaFormulario" id="txtSelDispRep"  style="background-color: #FFFFCC"  value="" readonly="readonly" /></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
 
    <td class="detalleDisposicion" ><div align="right">Por Fecha y Estado: </div></td>
    <td width="356"><div style="float:left; width: 50%;"><input name="txtFechIniRep" type="text" class="cajaFormulario" id="txtFechIniRep" size="7" maxlength="10"  value="" placeholder="Del: dd/mm/aaaa" onkeyup="javscript: mascara(this,'/',patron,true);" onclick="javascript: this.value='';" /></div>
      
    <div style="float:left; width:50%;"><input name="txtFechFinRep" type="text" class="cajaFormulario" id="txtFechFinRep" size="7" maxlength="10" value="" placeholder="Al: dd/mm/aaaa" onkeyup="javscript: mascara(this,'/',patron,true);" onclick="javascript: this.value='';" /> </div></td>
    <td width="197" class="tituloGrid"><%		
		    ComboLista dbEstDisp;
dbEstDisp = new ComboLista("cmbEstDisposRep", "0", "exec SP_DISPOSICIONES 1,1,"+Session["sysIdPlanta"].ToString()+",'A'", "", "", "", "cajaFormulario", "0", "");
			dbEstDisp.Nombre=("cmbEstDisposRep");
			dbEstDisp.CssCmb="cajaFormulario";
			//dbEstadoDisposicion.ItemSelect = idP19;
			//dbTipoDisposicion.Events=("onChange='generalJS(\"0\",\"frmMeta|___sqlAjax.aspx|cmbEstanteria;cmbEstanteria|idArchivos|GET|&typ=2&tab=2\");'");
			Response.Write(dbEstDisp.cargarComboLista());
		%></td>
    <td width="508" class="tituloGrid"><a href="#" class="btn btn-primary btn-xs" onClick="javascript:  var oId1=document.getElementById('txtFechIniRep');  var oId2=document.getElementById('txtFechFinRep'); var oId3=eval('document.forms[0].cmbEstDisposRep'); if (validateForm('frmMeta|txtFechIniRep;R|txtFechFinRep;R')){ iniTab('___sqlAjax2.aspx|txtBDisposicionRep;txtBDisposicionRep|idBusRep|GET|9&ti=1&id1='+oId1.value+'&id2='+oId2.value+'&id3='+oId3.value); }" >Buscar</a></td>
  </tr>
</table>
<br /> 
<div id="idBusRep"></div>
<% } %>

<% if (idP0=="1"){  //Caso Pre-Contractuales 
 try  {  sec=0; idP1="";   
   
   dbManager.Open(); strSQL = "exec spReportes 5,"+ idP0 +","+Session["sysIdRrhh"].ToString()+",'A'";  //Response.Write(strSQL + "p0: " + idP0);
   dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {
	
	 if (sec < 1){
%>
<label style="float:left; width:10%;" class="detalleDisposicion" >&nbsp;Tipo Cadena: </label>
<%
 strSQL="exec spPlantillas 7,"+Session["sysIdPlanta"].ToString()+",4,"+Session["sysIdRrhh"].ToString()+",null,"+Session["sysEdicion"]+",'A'";
 ComboLista dbTipoCadena;
dbTipoCadena = new ComboLista("cmbTipoCadena", "0", strSQL, "", "", "", "cajaFormulario", "0", "");
			dbTipoCadena.Nombre=("cmbTipoCadena");
			dbTipoCadena.CssCmb="cajaFormulario";
			dbTipoCadena.Events="style='float:left; width: 150px;'";
 Response.Write(dbTipoCadena.cargarComboLista());
 %> <br /><br />
<label style="float:left; width:10%;" class="detalleDisposicion" >&nbsp;Responsable: </label> 
 <div style="float: left; width:10%;"><input name="txtResponsablePRE" type="text" class="cajaFormulario" id="txtResponsablePRE" size="10"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax2.aspx?typ=7&op=2|idAutoDisposicionReportPRE|GET|txtResponsablePRE|txtResponsableSelPRE|idResponsablePRE');}" onclick="this.value=''; var objSelE=document.getElementById('txtResponsableSelPRE'); objSelE.value=''; var objIdE=document.getElementById('idResponsablePRE'); objIdE.value=''; " placeholder="Buscar"/><div id='idAutoDisposicionReportPRE' style="width: 30%" ></div></div><div style="float:left; width:20%; "><input name="txtResponsableSelPRE" type="text" class="cajaFormulario" id="txtResponsableSelPRE" size="10"  value=""  readonly="readonly"/></div><br><br>
<span class="tituloGrid"   style=" float:left; width:50%; height: 22; font-size:13px; border-radius: 10px 10px 0px 0px;"    > Seleccione la Informaci&oacute;n que desea visualizar:  </span><br><br>
<table width="70%" border="0" cellpadding="0" cellspacing="0" align="left"  >
  
	       <%}sec++;	%> 
  <tr class="detalleDisposicion" >
    <td style="border-bottom:solid 1px #f1f1f1; "  height="30" width="10%"><div align="center"><%=sec%></div></td>
    <td style="border-bottom:solid 1px #f1f1f1; " align="left" ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td style="border-bottom:solid 1px #f1f1f1; " align="center" ><input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>"  value="<%=sec%>"  /></td>   
      <div align="left"></div><td width="32%"></td>
  </tr>
          <%}  %>
</table>



<%
}catch (Exception ex){ Response.Write(ex.Message.ToString());  
              }finally{ dbManager.Dispose(); } 

} %>
</div>

<%}


break;

case 3:  /**************  REPORTE ALCALDE  ********************/
// Para los valores del grafico
idP0 = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";
strReportes = Request.QueryString["mC"];

idP5=""; idP6=""; idP7=""; cuerpo=""; estado=0; idP2="";
try { dbManager.Open(); strSQL="exec spReportes null, null, null ,'A'";
    //Response.Write(strSQL);
	
	// Para la Grafica Circular
	dbManager.ExecuteReader(CommandType.Text,strSQL); sec=0;
	while(dbManager.DataReader.Read()){	sec++;		  
		   estado = int.Parse(dbManager.DataReader["id"].ToString());
				 switch (estado){
					case 2: idP2="style='width:18px;height:18px;border-radius:15px;background:#0033CC;margin-bottom:1px;'"; break; //Nuevos
					case 4:	idP2="style='width:18px;height:18px;border-radius:15px;background:#CC0000;margin-bottom:1px;'";	break;  //Detenidos
					case 11: idP2="style='width:18px;height:18px;border-radius:15px;background:#FF6600;margin-bottom:1px;'"; break; //Incumpplidos
					case 7:  idP2="style='width:18px;height:18px;border-radius:15px;background:#FFCC00;margin-bottom:1px;'"; break; //atrasados
					case 15: idP2="style='width:18px;height:18px;border-radius:15px;background:#FF6E8B;margin-bottom:1px;'"; break; //Sin reporte
					case 5:  idP2="style='width:18px;height:18px;border-radius:15px;background:#009900;margin-bottom:1px;'"; break; //En ejecucion
					case 8: idP2="style='width:18px;height:18px;border-radius:15px;background:#59FFFF;margin-bottom:1px;'"; break; //En Revision
					case 9:  idP2="style='width:18px;height:18px;border-radius:15px;background:#9C9CFF;margin-bottom:1px;'"; break; //En espera					
					}
		  
		  cuerpo +="<tr ><td align='left' height='25' class='detalleDisposicion' >&nbsp;"+ dbManager.DataReader["nombre"].ToString() +"</td><td align='center' valign='middle' ><div "+ idP2 +" ><span style='margin-top:30%; color: #ffffff; font-size: 12px;font-family: Verdana, Arial, Helvetica, sans-serif;text-decoration: none;'>"+ dbManager.DataReader["N"].ToString() +"</span> </div></td><td align='center' class='detalleDisposicion' ><strong>"+ dbManager.DataReader["porcentaje"].ToString() +"%</strong></td></tr>";
		  
		 idP5 += dbManager.DataReader["porcentaje"].ToString() + ";";
		 idP6 = dbManager.DataReader["suma"].ToString();
		}
		 idP5 = idP5.Substring(0,idP5.Length-1);
		//Response.Write(strCuentaEstados+"|"+strTotalDisposiciones);
  }catch (Exception ex){ Response.Write(ex.Message.ToString());  
  }finally{ dbManager.Dispose(); }


%>
 <% if (strReportes.IndexOf('1')>=0){ %> 
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center" class="detalleDisposicionTitulo">    M.I. Municipalidad de Guayaquil <br>Reporte Alcalde </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="detalleDisposicion"><strong>Usuario: 
    </strong> <%=(Session["sysNombreUsuario"]+" "+Session["sysLABORATORIO"])%></td>
        <td class="detalleDisposicion" align="right"><strong>Fecha:</strong><% Response.Write(DateTime.Now.ToString());%></td>
      </tr>
    </table></td>
  </tr>
</table>


<table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr>  
    <td width="40%"><iframe id="idDatos" scrolling="no" width="100%" height="230px" src="graficoAlcalde.aspx?val=<%=idP5%>&c=<%=idP6%>" style="border: 0px solid #cccccc;"  >
</iframe></td>
   <td width="60%" align="center" valign="middle">
    <span class="detalleDisposicionTitulo" > Distribuci&oacute;n por Estados </span>
<table width="70%" border="0" cellpadding="1" cellspacing="1" align="center" style='border-bottom:solid 1px #CCCCCC;'  >
<tr class="tituloGrid"  >
    <td width="40%"  height="25" align="center" >Estados</td>
    <td width="15%"  align="center">Frecuencia</td>
    <td width="15%"  align="center">Porcentaje</td>
    </tr>
    <%=cuerpo%>
   
    </table>
    </td>
  </tr>
</table>
<%}%>
<%  if (strReportes.IndexOf('2')>=0){  %>
<span class="detalleDisposicionTitulo"  style=" float:left; width:100%;"  >Disposiciones por Responsables y Estados </span>
<div style='width: 100%; height:250px; overflow:auto;'>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" ><iframe id="idDatos" scrolling="no" width="90%" height="250px" src="graficoGeneral2.aspx?val=<%=idP5%>&c=<%=idP6%>" style="border: 0px solid #cccccc;"  >
</iframe></td>
   
  </tr>
</table>
</div>
<%}%>

<% 
 if (strReportes.IndexOf('3')>=0){ 
// Para las Disposiciones Detenidas
  try {	dbManager.Open(); strSQL = "exec spReportes 1,4";   //Response.Write(strSQL);
		dbManager.ExecuteReader(CommandType.Text,strSQL);  sec=0;	idP1="";	 
 while(dbManager.DataReader.Read()) {  if (sec < 1){ %>
<span class="detalleDisposicionTitulo"  style=" float:left; width:100%;"  >Disposiciones Detenidas </span>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
<div style='width: 95%; height:120px; overflow:auto;'>
<table width="100%" border="0" cellpadding="1" cellspacing="1" align="right"  style='border-bottom:solid 1px #CCCCCC;' >
  <tr class="tituloGrid"  >
    <td width="4%"   height="25" align="center" >No.</td>
    <td width="30%" align="center">Disposicion</td>
    <td width="30%"  align="center">Responsable</td>
    <td width="10%"  align="center">F. Inicio</td>
    <td width="10%"  align="center">F. Final</td>   
    </tr>
	 <% } sec++; %> 
  <tr class="detalleDisposicion" >
    <td   height="30" align="center"><%=sec%></td>
    <td  ><%=dbManager.DataReader["disposicion"].ToString()%></td>
    <td  ><%=dbManager.DataReader["responsable"].ToString()%></td>
    <td  align="center" ><%=dbManager.DataReader["fechaInicio"].ToString()%></td>
     <td align="center"  ><%=dbManager.DataReader["fechaFin"].ToString()%></td>

    
  </tr>
  <%}}catch (Exception ex){ Response.Write(ex.Message.ToString());  
             }finally{ dbManager.Dispose(); } %>
</table>
</div>
</td>
 
</table>
 <%}%>
 
<br />
<% 
 if (strReportes.IndexOf('4')>=0){ 
// Para las Disposiciones Atrasadas
  try {	dbManager.Open();	strSQL = "exec spReportes 1,7";    //Response.Write(strSQL);
		dbManager.ExecuteReader(CommandType.Text,strSQL);  sec=0;	idP1="";	  
 
       while(dbManager.DataReader.Read()) {
	    if (sec < 1){ %>

<span class="detalleDisposicionTitulo"  style=" float:left; width:100%;"  >Disposiciones Atrasadas</span><br />
<div style='width: 95%; height:120px; overflow:auto; '>
<table width="100%" border="0" cellpadding="1" cellspacing="1" align="right"  style='border-bottom:solid 1px #CCCCCC;' >
  <tr class="tituloGrid"  >
    <td width="4%"  height="25" align="center" >No.</td>
    <td width="30%" align="center">Disposicion</td>
    <td width="30%"  align="center">Responsable</td>
    <td width="10%"  align="center">F. Inicio</td>
    <td width="10%"  align="center">F. Final</td>
    <td width="5%"  align="center">Dias</td>
    </tr>
	 <%	} sec++; %> 
  <tr class="detalleDisposicion" >
    <td   height="30" align="center"><%=sec%></td>
    <td  ><%=dbManager.DataReader["disposicion"].ToString()%></td>
    <td  ><%=dbManager.DataReader["responsable"].ToString()%></td>
    <td  align="center" ><%=dbManager.DataReader["fechaInicio"].ToString()%></td>
     <td align="center"  ><%=dbManager.DataReader["fechaFin"].ToString()%></td>
     <td  align="center" ><%=dbManager.DataReader["diasAtraso"].ToString()%></td>
    
  </tr>
  <%} }catch (Exception ex){ Response.Write(ex.Message.ToString());  
      }finally{ dbManager.Dispose(); }
  %>
</table>
</div>
<%}%>
<br />
<%
 if (strReportes.IndexOf('5')>=0){ 
// Para Distribucion de Disposiciones x Estado
  try  { 
    int sumaN=0; int sumaE=0; int sumaA=0; int sumaD=0; int sumaEs=0; int sumaRe=0;     
   			dbManager.Open();		
			strSQL = "exec spReportes 2, null,null,'A'";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1="";	  
 
  while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	 
	 %>
<div style='width: 95%; height:170px; overflow:auto; '> <span class="detalleDisposicionTitulo" > Distribuci&oacute;n de las Disposiciones </span>
<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center"   >
  <tr class="tituloGrid"  >
    <td width="4%"  height="25" align="center" >No.</td>
    <td width="30%" align="center">Responsables</td>
    <td width="5%"  align="center">Nuevos</td>
    <td width="8%"  align="center">En Ejecuci&oacute;n</td>
    <td width="7%" align="center">Atrasados</td>
    <td width="7%"  align="center">Detenidos</td>
    <td width="7%"  align="center">En Espera</td>
    <td width="7%"  align="center">Revisi&oacute;n</td>
    <td width="5%"  align="center">Total</td>
    </tr>
	 <%	}
			sumaN += int.Parse(dbManager.DataReader["Nuevos"].ToString());
			sumaE += int.Parse(dbManager.DataReader["En Ejecucion"].ToString());
			sumaA += int.Parse(dbManager.DataReader["atrasados"].ToString());
			sumaD += int.Parse(dbManager.DataReader["detenidos"].ToString());
			sumaEs += int.Parse(dbManager.DataReader["En Espera"].ToString());
			sumaRe += int.Parse(dbManager.DataReader["Revision"].ToString());
			sec++;	%>
  <tr class="detalleDisposicion" >
    <td  align="center"><%=sec%></td>
    <td  ><%=dbManager.DataReader["Responsable"].ToString()%></td>
    <td align="center" ><%=dbManager.DataReader["Nuevos"].ToString()%></td>
    <td  align="center" ><%=dbManager.DataReader["En Ejecucion"].ToString()%></td>
     <td align="center"  ><%=dbManager.DataReader["atrasados"].ToString()%></td>
     <td  align="center" ><%=dbManager.DataReader["detenidos"].ToString()%></td>
     <td  align="center" ><%=dbManager.DataReader["En Espera"].ToString()%></td>
     <td  align="center" ><%=dbManager.DataReader["Revision"].ToString()%></td>
     <td  align="center" ><strong><%=dbManager.DataReader["suma"].ToString()%></strong></td>    
  </tr>  
  <%} %>
  <tr  class="detalleDisposicion" >
    <td    align="center"></td>
    <td   align="right">Total</td>
    <td  style='border-top:solid 1px #666666;' align="center"><strong><%=sumaN%></td>
    <td style='border-top:solid 1px #666666;' align="center" ><strong><%=sumaE%></strong></td>
     <td style='border-top:solid 1px #666666;'align="center"  ><strong><%=sumaA%></strong></td>
     <td  style='border-top:solid 1px #666666;'align="center" ><strong><%=sumaD%></strong></td>
     <td  style='border-top:solid 1px #666666;'align="center" ><strong><%=sumaEs%></strong></td>
     <td  style='border-top:solid 1px #666666;'align="center" ><strong><%=sumaRe%></strong></td>
     <td  style='border-top:solid 1px #666666;'align="center" ><strong><%=(sumaN+sumaE+sumaA+sumaD+sumaEs+sumaRe)%></strong></td>    
  </tr>  
  <% }catch (Exception ex){ Response.Write(ex.Message.ToString());  
             }finally{  dbManager.Dispose(); } %>
</table>
</div>
<br />
<%}%>
<br />
<%
break;

case 4:  /*********** REPORTE GENERAL  ******************/
// Para los valores del grafico
idP0 = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "" ;
strReportes = Request.QueryString["mC"];
idP1 = Request.QueryString["p1"]!="" ? Request.QueryString["p1"]: "";

idP5=""; idP6=""; idP7=""; cuerpo=""; estado=0; idP2="";
try { dbManager.Open();  if (Session["sysEdicion"].ToString()=="1"){ strSQL="exec spReportes null, 1, "+ idP1 +" ,'A'";} else { strSQL="exec spReportes null, 1, "+ Session["sysIdRrhh"].ToString() +" ,'A'"; }
   // Response.Write(strSQL);
	
	// Para la Grafica Circular
	dbManager.ExecuteReader(CommandType.Text,strSQL); sec=0;
	while(dbManager.DataReader.Read()){	sec++;		  
		   estado = int.Parse(dbManager.DataReader["id"].ToString());
				 switch (estado){
					case 2: idP2="style='width:20px;height:20px;border-radius:15px;background:#0033CC;margin-bottom:1px;'"; break; //Nuevos
					case 4:	idP2="style='width:20px;height:20px;border-radius:15px;background:#CC0000;margin-bottom:1px;'";	break;  //Detenidos
					case 11: idP2="style='width:20px;height:20px;border-radius:15px;background:#FF6600;margin-bottom:1px;'"; break; //Incumpplidos
					case 7:  idP2="style='width:20px;height:20px;border-radius:15px;background:#FFCC00;margin-bottom:1px;'"; break; //atrasados
					case 15: idP2="style='width:20px;height:20px;border-radius:15px;background:#FF6E8B;margin-bottom:1px;'"; break; //Sin reporte
					case 5:  idP2="style='width:20px;height:20px;border-radius:15px;background:#009900;margin-bottom:1px;'"; break; //En ejecucion
					case 8: idP2="style='width:20px;height:20px;border-radius:15px;background:#59FFFF;margin-bottom:1px;'"; break; //En validacion
					case 9:  idP2="style='width:20px;height:20px;border-radius:15px;background:#9C9CFF;margin-bottom:1px;'"; break; //En espera				
					}
		  
		  cuerpo +="<tr ><td align='left' height='25' class='detalleDisposicion' >&nbsp;"+ dbManager.DataReader["nombre"].ToString() +"</td><td align='center' valign='middle' ><div "+ idP2 +" ><span style='margin-top:30%; color: #ffffff; font-size: 12px;font-family: Verdana, Arial, Helvetica, sans-serif;text-decoration: none;'>"+ dbManager.DataReader["N"].ToString() +"</span> </div></td><td align='center' class='detalleDisposicion' ><strong>"+ dbManager.DataReader["porcentaje"].ToString() +"%</strong></td></tr>";
		  
		 idP5 += dbManager.DataReader["porcentaje"].ToString() + ";";
		 idP6 = dbManager.DataReader["suma"].ToString();
		}
		 idP5 = idP5.Substring(0,idP5.Length-1);
		//Response.Write(idP5+"|"+idP6);
  }catch (Exception ex){ Response.Write(ex.Message.ToString());  
  }finally{ dbManager.Dispose(); }
%>
<%  if (strReportes.IndexOf('1')>=0){  %>
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center" class="detalleDisposicionTitulo">    M.I. Municipalidad de Guayaquil <br>Reporte General </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="detalleDisposicion"><strong>Usuario: </strong> <%=(Session["sysNombreUsuario"]+" "+Session["sysLABORATORIO"])%></td>
        <td class="detalleDisposicion" align="right"><strong>Fecha:</strong>
          <% Response.Write(DateTime.Now.ToString());%></td>
      </tr>
    </table></td>
  </tr>
</table>

<table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="40%"><iframe id="idDatos" scrolling="no" width="100%" height="230px" src="graficoGeneral1.aspx?val=<%=idP5%>&c=<%=idP6%>" style="border: 0px solid #cccccc;"  >
</iframe></td>
    <td width="60%" align="center">
<table width="70%" border="0" cellpadding="1" cellspacing="1" align="center" style='border-bottom:solid 1px #CCCCCC;'  >
<tr class="tituloGrid"  >
    <td width="40%"  height="25" align="center" >Estados</td>
    <td width="15%"  align="center">Frecuencia</td>
    <td width="15%"  align="center">Porcentaje</td>
    </tr>
    <%=cuerpo%>
    </table>
    </td>
  </tr>
</table>
<%}%>

<%  if (strReportes.IndexOf('2')>=0){  %>
<br>
<div style='width: 100%; height:260px; overflow:auto;'>
<span class="detalleDisposicionTitulo"  style=" float:left; width:100%;"  >Disposiciones por Responsables y Estados </span>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" ><iframe id="idDatos" scrolling="no" width="90%" height="250px" src="graficoGeneral2.aspx?val=<%=idP5%>&c=<%=idP6%>&id=<%=idP1%>" style="border: 0px solid #cccccc;"  >
</iframe></td>
   
  </tr>
</table>
</div>
<%}%>
<br />
<% 
 if (strReportes.IndexOf('3')>=0){ 
// Para las Disposiciones Vencidas o por Vencer
  try {	dbManager.Open(); strSQL = "exec spReportes 3,null,"+ idP1 +",'A'"; //Response.Write(strSQL);
		dbManager.ExecuteReader(CommandType.Text,strSQL); sec=0; 	 
 while(dbManager.DataReader.Read()) { if (sec < 1){ %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><span class="detalleDisposicionTitulo"  style=" float:left; width:100%;"  >Disposiciones Riesgo </span>
<br />
<div style='width: 95%; height:120px; overflow:auto;'>
<table width="100%" border="0" cellpadding="1" cellspacing="1" align="right"  style='border-bottom:solid 1px #CCCCCC;' >
  <tr class="tituloGrid"  >
    <td width="4%"   height="25" align="center" >No.</td>
    <td width="30%" align="center">Disposicion</td>
    <td width="30%"  align="center">Responsable</td>
    <td width="10%"  align="center">F. Final</td>
    <td width="10%"  align="center">Observaci&oacute;n</td>   
    </tr>
	 <% } sec++; %> 
  <tr class="detalleDisposicion" >
    <td    align="center">(<%=dbManager.DataReader["id_disposicion"].ToString()%>)</td>
    <td  ><%=dbManager.DataReader["disposicion"].ToString()%></td>
    <td  ><%=dbManager.DataReader["responsable"].ToString()%></td>
    <td  align="left" ><%=dbManager.DataReader["fechaFinal"].ToString()%></td>
     <td align="left"  ><% if (int.Parse(dbManager.DataReader["transcurrido"].ToString())<10) {
	     Response.Write( "<span style='color: #CC0000;'> Vence: "+Math.Abs(int.Parse(dbManager.DataReader["transcurrido"].ToString()))+" d&iacute;a(s) </span>");
	}else{
	  Response.Write( " <span style='color: #FFCC00;'>Por Vencer</span>");
	} %></td>
 
    
  </tr>
  <%}}catch (Exception ex){ Response.Write(ex.Message.ToString());  
             }finally{ dbManager.Dispose(); } %>
</table>
</div>
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<%}%>
<br />
<%

 if (strReportes.IndexOf('4')>=0){ 
// Para Distribucion de Disposiciones x Estado
  try  { 
    int sumaN=0; int sumaE=0; int sumaA=0; int sumaD=0; int sumaEs=0;  int sumaRe=0;    
   			dbManager.Open();		
			strSQL = "exec spReportes 2,null,"+ idP1 +",'A'";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1="";	  
 
  while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	 
	 %>

<span class="detalleDisposicionTitulo"  style=" float:left; width:100%;"  > Distribuci&oacute;n de las Diposiciones</span><br />
<div style='width: 95%; height:130px; overflow:auto; '>
<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center"   >
  <tr class="tituloGrid"  >
    <td width="4%"  height="25" align="center" >No.</td>
    <td width="30%" align="center">Responsables</td>
    <td width="5%"  align="center">Nuevos</td>
    <td width="8%"  align="center">En Ejecuci&oacute;n</td>
    <td width="7%"  align="center">Atrasados</td>
    <td width="7%"  align="center">Detenidos</td>
    <td width="7%"  align="center">En Espera</td>
    <td width="7%"  align="center">Revisi&oacute;n</td>
    <td width="5%"  align="center">Total</td>
    </tr>
	 <%	}
			sumaN += int.Parse(dbManager.DataReader["Nuevos"].ToString());
			sumaE += int.Parse(dbManager.DataReader["En Ejecucion"].ToString());
			sumaA += int.Parse(dbManager.DataReader["atrasados"].ToString());
			sumaD += int.Parse(dbManager.DataReader["detenidos"].ToString());
			sumaEs += int.Parse(dbManager.DataReader["En Espera"].ToString());
			sumaRe += int.Parse(dbManager.DataReader["Revision"].ToString());
			sec++;	%>
  <tr class="detalleDisposicion" >
    <td  align="center"><%=sec%></td>
    <td  ><%=dbManager.DataReader["Responsable"].ToString()%></td>
    <td align="center" ><%=dbManager.DataReader["Nuevos"].ToString()%></td>
    <td  align="center" ><%=dbManager.DataReader["En Ejecucion"].ToString()%></td>
     <td align="center"  ><%=dbManager.DataReader["atrasados"].ToString()%></td>
     <td  align="center" ><%=dbManager.DataReader["detenidos"].ToString()%></td>
     <td  align="center" ><%=dbManager.DataReader["En Espera"].ToString()%></td>
     <td  align="center" ><%=dbManager.DataReader["Revision"].ToString()%></td>
     <td  align="center" ><strong><%=dbManager.DataReader["suma"].ToString()%></strong></td>
         
  </tr>  
  <%} %>
  <tr  class="detalleDisposicion" >
    <td    align="center"></td>
    <td   align="right">Total</td>
    <td  style='border-top:solid 1px #666666;' align="center"><strong><%=sumaN%></td>
    <td style='border-top:solid 1px #666666;' align="center" ><strong><%=sumaE%></strong></td>
     <td style='border-top:solid 1px #666666;'align="center"  ><strong><%=sumaA%></strong></td>
     <td  style='border-top:solid 1px #666666;'align="center" ><strong><%=sumaD%></strong></td>
     <td  style='border-top:solid 1px #666666;'align="center" ><strong><%=sumaEs%></strong></td>
     <td  style='border-top:solid 1px #666666;'align="center" ><strong><%=sumaRe%></strong></td>
     <td  style='border-top:solid 1px #666666;'align="center" ><strong><%=(sumaN+sumaE+sumaA+sumaD+sumaEs+sumaRe)%></strong></td>    
  </tr>  
  <% }catch (Exception ex){ Response.Write(ex.Message.ToString());  
             }finally{  dbManager.Dispose(); } %>
</table>
</div>
<br />
<% } %>
<br />

<%
break;

case 5: /*************  REPORTE POR ESTADOS  *****************************/
idP0 = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "null";
strReportes = Request.QueryString["mC"]!="" ? "'"+Request.QueryString["mC"]+"'": "null"; 
idP1 = Request.QueryString["p1"]!="" ? Request.QueryString["p1"]: "";
idP7 = Request.QueryString["p0"]!="null" ? Request.QueryString["p0"]: "-1";

idP5=""; idP6="";  cuerpo=""; estado=0; idP2="";
try { dbManager.Open();  if (Session["sysEdicion"].ToString()=="1"){ strSQL="exec spReportes null, 1, "+ idP1 +" ,'A'";} else { strSQL="exec spReportes null, 1, "+ Session["sysIdRrhh"].ToString() +" ,'A'"; }
    //Response.Write(strSQL);
	
	// Para la Grafica Circular
	dbManager.ExecuteReader(CommandType.Text,strSQL); sec=0;
	while(dbManager.DataReader.Read()){	sec++;		  
		   estado = int.Parse(dbManager.DataReader["id"].ToString());
				 switch (estado){
					case 2: idP2="style='width:20px;height:20px;border-radius:15px;background:#0033CC;margin-bottom:1px;'"; break; //Nuevos
					case 4:	idP2="style='width:20px;height:20px;border-radius:15px;background:#CC0000;margin-bottom:1px;'";	break;  //Detenidos
					case 11: idP2="style='width:20px;height:20px;border-radius:15px;background:#FF6600;margin-bottom:1px;'"; break; //Incumpplidos
					case 7:  idP2="style='width:20px;height:20px;border-radius:15px;background:#FFCC00;margin-bottom:1px;'"; break; //atrasados
					case 15: idP2="style='width:20px;height:20px;border-radius:15px;background:#FF6E8B;margin-bottom:1px;'"; break; //Sin reporte
					case 5:  idP2="style='width:20px;height:20px;border-radius:15px;background:#009900;margin-bottom:1px;'"; break; //En ejecucion
					case 8: idP2="style='width:20px;height:20px;border-radius:15px;background:#59FFFF;margin-bottom:1px;'"; break; //En validacion
					case 9:  idP2="style='width:20px;height:20px;border-radius:15px;background:#9C9CFF;margin-bottom:1px;'"; break; //En espera				
					}
		  
		  cuerpo +="<tr ><td align='left' height='25' class='detalleDisposicion' >&nbsp;"+ dbManager.DataReader["nombre"].ToString() +"</td><td align='center' valign='middle' ><div "+ idP2 +" ><span  style='margin-top:30%; color: #ffffff; font-size: 12px;font-family: Verdana, Arial, Helvetica, sans-serif;text-decoration: none;'>"+ dbManager.DataReader["N"].ToString() +"</span> </div></td><td align='center' class='detalleDisposicion' ><strong>"+ dbManager.DataReader["porcentaje"].ToString() +"%</strong></td></tr>";
		  
		 idP5 += dbManager.DataReader["porcentaje"].ToString() + ";";
		 idP6 = dbManager.DataReader["suma"].ToString();
		}
		 idP5 = idP5.Substring(0,idP5.Length-1);
		//Response.Write(idP5+"|"+idP6);
  }catch (Exception ex){ Response.Write(ex.Message.ToString());  
  }finally{ dbManager.Dispose(); }
%>
<%  if (strReportes.IndexOf('1')>=0){  %>
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center" class="detalleDisposicionTitulo">    M.I. Municipalidad de Guayaquil <br>Reporte por Estado </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="detalleDisposicion"><strong>Usuario: </strong> <%=(Session["sysNombreUsuario"]+" "+Session["sysLABORATORIO"])%></td>
        <td class="detalleDisposicion" align="right"><strong>Fecha:</strong>
          <% Response.Write(DateTime.Now.ToString());%></td>
      </tr>
    </table></td>
  </tr>
</table>

<table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="40%"><iframe id="idDatos" scrolling="no" width="100%" height="230px" src="graficoGeneral1.aspx?val=<%=idP5%>&c=<%=idP6%>" style="border: 0px solid #cccccc;"  >
</iframe></td>
    <td width="60%" align="center">
<table width="70%" border="0" cellpadding="1" cellspacing="1" align="center" style='border-bottom:solid 1px #CCCCCC;'  >
<tr class="tituloGrid" >
    <td width="40%"  height="25" align="center" >Estados</td>
    <td width="15%"  align="center">Frecuencia</td>
    <td width="15%"  align="center">Porcentaje</td>
    </tr>
    <%=cuerpo%>
    </table>
    </td>
  </tr>
</table>
<%}%>



<%
// Para Distribucion de Disposiciones x Estado
  try  { 
    //int sumaN=0; int sumaE=0; int sumaA=0; int sumaD=0; int sumaEs=0;      
   			dbManager.Open();		
			if (Session["sysEdicion"].ToString()=="1"){ strSQL = "exec spReportes 6, "+ idP0 +",null,'A',"+ strReportes +","+ idP7 +"";} else { strSQL = "exec spReportes 6, "+ Session["sysIdRrhh"].ToString() +",null,'A',"+ strReportes +","+ idP7 +"";}
			
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1=""; idP2=""; idP3="";	   
 
  while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	
	 %>

<br />

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
<div style='width: 100%; height:350px; overflow:auto;'>

<table width="100%" border="0" cellpadding="1" cellspacing="1" align="right"  style='border-bottom:solid 1px #CCCCCC;' id="tableone" >
  <tr class="tituloGrid"  >
    <td width="1%"   height="25" align="center" ></td>
   <td width="8%"  align="center">Estado</td>    
   <td width="5%"  align="center">Numero</td>   
    <td width="24%"  align="center">Disposicion</td>
   <% if (strReportes.IndexOf("-1")>=0){  %>
    <td width="12%"  align="center">Responsable</td>
    <%}%>
     <% if (strReportes.IndexOf("-2")>=0){  %>
    <td width="11%"  align="center" >Corresponsable</td>
    <%}%>
     <% if (strReportes.IndexOf("-3")>=0){  %>
    <td width="12%"  align="center">Asociado</td>
    
    <%}%>
    <td width="9%"  align="center">F. Inicio</td>
    <td width="9%"  align="center">F. Final</td>
    <% if (strReportes.IndexOf("-4")>=0){  %>
    <td width="12%"  align="center">Avance</td> 
    <%}%>
    <% if (strReportes.IndexOf("-5")>=0){  %>
    <td width="12%"  align="center">Mensaje</td>
    <%}%>  
    <% if (strReportes.IndexOf("-6")>=0){  %> 
    <td width="11%"  align="center">Usuario</td>
    <%}%>  
    </tr>
	 <% } 
	 
	            estado = int.Parse(dbManager.DataReader["id_estadoDisposicion"].ToString());
				 switch (estado){
					case 2: idP2="style='background:#0033CC;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //Nuevos
					case 4:	idP2="style='background:#CC0000; color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break;  //Detenidos
					case 11: idP2="style='background:#FF6600;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //Incumpplidos
					case 7:  idP2="style='background:#FFCC00;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //atrasados
					case 6: idP2="style='background: #AE8B00;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //Cumplido
					case 5:  idP2="style='background:#009900;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //En ejecucion
					case 8: idP2="style='background:#59FFFF;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //En Revision
					case 9:  idP2="style='background:#9C9CFF;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //En espera				
					}
	 
	 sec++; %> 
  
    
 
  <tr class="detalleDisposicion" >
    <td  <%=idP2%>  align="center" height="25" >&nbsp;</td>
   <td valign="top" <%=idP2%> ><%=dbManager.DataReader["estado"].ToString()%></td>     
   <td valign="top" <%=idP3%> ><%=dbManager.DataReader["id_disposicion"].ToString()%></td>      
    <td valign="top" <%=idP3%> ><%=dbManager.DataReader["disposicion"].ToString()%></td>
     <% if (strReportes.IndexOf("-1")>=0){  %>
    <td valign="top" <%=idP3%> ><%=dbManager.DataReader["responsable"].ToString()%></td>
    <%}%>
    <% if (strReportes.IndexOf("-2")>=0){ %>
    <td valign="top" <%=idP3%> ><%=dbManager.DataReader["corresponsable"].ToString().Replace("|",",<br>")%></td>
    <%}%>
    <% if (strReportes.IndexOf("-3")>=0){  %>
    <td valign="top" <%=idP3%> ><%=dbManager.DataReader["asociado"].ToString()%></td>   
    <%}%>
    <td align="left" valign="top" <%//=idP3%> ><%=dbManager.DataReader["fechaInicio"].ToString()%></td>
    <td align="left" valign="top" <%=idP3%> ><%=dbManager.DataReader["fechaFinal"].ToString()%></td>
    <% if (strReportes.IndexOf("-4")>=0){  %>
   <td align="left" valign="top" <%=idP3%> >
   <% if (dbManager.DataReader["padreUsuario"].ToString()!=""){
      Response.Write("<strong>"+dbManager.DataReader["padreUsuario"].ToString()+" DICE:</strong><br />");
      }else{ if (dbManager.DataReader["usuarioReporta"].ToString()!=""){
	  Response.Write("<strong>"+dbManager.DataReader["usuarioReporta"].ToString()+" DICE:</strong><br />");
	  }
	  }
 %> 
   
   <%=dbManager.DataReader["ultimoAvance"].ToString()%></td>
      <%}%>
       <% if (strReportes.IndexOf("-5")>=0){  %>
      <td align="left" valign="top" <%=idP3%> >
	  <% if (dbManager.DataReader["padreMensaje"].ToString()!=""){
      Response.Write("<strong>"+dbManager.DataReader["padreMensaje"].ToString()+" DICE:</strong><br />");
      }else{ if (dbManager.DataReader["usuarioMensaje"].ToString()!=""){
	  Response.Write("<strong>"+dbManager.DataReader["usuarioMensaje"].ToString()+" DICE:</strong><br />");
	  }
	  }
 %> 
	  <%=dbManager.DataReader["Mensaje"].ToString()%></td>
      <%}%>

   <% if (strReportes.IndexOf("-6")>=0){  %>
   <td align="left" valign="top" <%=idP3%> ><%
   if (dbManager.DataReader["padreUsuario"].ToString()!=""){
      Response.Write(dbManager.DataReader["fechaAvance"].ToString()+"<br> "+ dbManager.DataReader["padreUsuario"].ToString() + " <br>"+dbManager.DataReader["usuarioReporta"].ToString());
   }else{
   Response.Write(dbManager.DataReader["fechaAvance"].ToString()+"<br> "+ dbManager.DataReader["usuarioReporta"].ToString());
   }
 %></td> 
 <%}%>
 
  </tr>

  
  <%}}catch (Exception ex){ Response.Write(ex.Message.ToString());  
             }finally{ dbManager.Dispose(); } %>
</table>
</div>
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>



<%
break;
case 6:  //POR DISPOSICION
idP0 = Request.QueryString["p0"]!="" ? Request.QueryString["p0"]: "";
strReportes = Request.QueryString["mC"];

idP1 =""; idP2 ="";idP3 =""; idP4 ="";idP5 =""; idP6 ="";idP7 =""; idP8 ="";idP9 =""; idP10 ="";
idP11 =""; idP12 ="";idP13 =""; idP14 ="";idP15 =""; idP16 =""; idP17 =""; idP18 =""; idP19 =""; idP20 =""; idP21 ="";
dbManager.Open();
               strSQL = "SP_DISPOSICIONES 6,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"] +",'A',null,"+idP0+",null,null,null,"+Session["sysIdRrhh"].ToString()+",null,null,null";
			   //Response.Write(strSQL);
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
			   cuerpo=""; 	   
			   while(dbManager.DataReader.Read())
			    {
			       idP1 = dbManager.DataReader["estado"].ToString(); // estado
  			       idP2 = dbManager.DataReader["tipo"].ToString(); // tipo
   			       idP3 = dbManager.DataReader["nombre"].ToString(); //  nombre de disposicion
			       idP4 = dbManager.DataReader["detalle"].ToString(); // detalle de disposicion
  			        if (dbManager.DataReader["fechaInicio"].ToString()!=""){  
				        fecha =  dbManager.DataReader["fechaInicio"].ToString().Split('/');
  			             idP5 = fecha[2]+"/"+fecha[1]+"/"+fecha[0];
				   }
				   
				   if (dbManager.DataReader["fechaFinal"].ToString()!=""){
				       fecha1 = dbManager.DataReader["fechaFinal"].ToString().Split('/'); //  fecha fin
				       idP6 = fecha1[2]+"/"+fecha1[1]+"/"+fecha1[0];
				   }
				   
			       				   
				   idP7 = dbManager.DataReader["id_responsable"].ToString(); // id responsable
  			       idP8 = dbManager.DataReader["id_corresponsable"].ToString(); // id corresponsable
   			       idP9 = dbManager.DataReader["id_asociado"].ToString(); // id asociado
			       idP10 = dbManager.DataReader["naturaleza"].ToString(); // naturaleza
  			       idP11 = dbManager.DataReader["id_analista"].ToString(); // id analista
   			       idP12 = dbManager.DataReader["antecedentes"].ToString()!="" ?  dbManager.DataReader["antecedentes"].ToString() : "Ninguno" ; // antecedentes
   			       idP13 = dbManager.DataReader["observaciones"].ToString() !="" ?  dbManager.DataReader["observaciones"].ToString() : "Ninguna" ; // observaciones
   			       idP14 = dbManager.DataReader["progreso"].ToString(); //  progreso
   			       idP15 = dbManager.DataReader["responsable"].ToString(); //  responsable
			       idP16 = dbManager.DataReader["corresponsable"].ToString()!="" ?  dbManager.DataReader["corresponsable"].ToString() : "Ninguno" ; //  corresponsable
		           idP17 = dbManager.DataReader["asociado"].ToString()!="" ?  dbManager.DataReader["asociado"].ToString() : "Ninguno" ; //  asociado
		           idP18 = dbManager.DataReader["analista"].ToString(); //  analista
				   idP19 = dbManager.DataReader["id_estado"].ToString(); //  analista
				   idP20 = dbManager.DataReader["id_tipo"].ToString(); //  analista
				   idP21 = dbManager.DataReader["id_naturaleza"].ToString(); //  analista
		           
				   
				}
//Response.Write(strReportes + ":" + strReportes.IndexOf('1'));
if (strReportes.IndexOf('1')>=0){
%>
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center" class="detalleDisposicionTitulo">    M.I. Municipalidad de Guayaquil <br>Reporte por Disposici&oacute;n</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="detalleDisposicion"><strong>Usuario: </strong> <%=(Session["sysNombreUsuario"]+" "+Session["sysLABORATORIO"])%></td>
        <td class="detalleDisposicion" align="right"><strong>Fecha:</strong>
              <% Response.Write(DateTime.Now.ToString());%></td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
<span class="detalleDisposicionTitulo"  > General </span> 
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" style="border:solid 1px #CCCCCC; border-radius: 5px 5px 5px 5px;"  >
                       <tr >
                         <td width="17%" class="detalleDisposicion"><div align="right">Estado:</div></td>
                       <td width="77%"><table width="100%" border="0" cellspacing="2" cellpadding="2">
                             <tr>
                               <td width="186" class="detalleDisposicion"><div align="left"><%=idP1%></div></td>
                               <td width="39" class="detalleDisposicion"><div align="right">Tipo:</div></td>
                               <td width="570" class="detalleDisposicion"><%=idP2%></td>
                         </tr>
                         </table></td>
  </tr>
                       <tr>
                         <td class="detalleDisposicion"><div align="right" >Disposici&oacute;n:</div></td>
                         <td class="detalleDisposicion"><%=idP3%></td>
                       </tr>
                       <tr>
                         <td valign="top" class="detalleDisposicion"><div align="right">Detalle:</div></td>
                         <td valign="top" class="detalleDisposicion"><%=idP4%></td>
                       </tr>
                       <tr>
                         <td class="detalleDisposicion"><div align="right">Fecha Inicial: </div></td>
                         <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                             <tr>
                               <td width="188" class="detalleDisposicion"><div align="left"><strong><%=idP5%></strong></div></td>
                               <td width="90" class="detalleDisposicion"><div align="right">Fecha Final:</div></td>
                               <td width="537" class="detalleDisposicion"><strong><%=idP6%></strong></td>
                           </tr>
                           </table></td>
                       </tr>
                       <tr>
                         <td class="detalleDisposicion"><div align="right">Responsable:</div></td>
                         <td class="detalleDisposicion"><strong><%=idP15%></strong></td>
                       </tr>
                       <tr>
                         <td valign="top" class="detalleDisposicion"><div align="right">Corresponsable:</div></td>
                         <td valign="top" class="detalleDisposicion"><%=idP16.Replace("|",",<br>")%></td>
                       </tr>
                       <tr>
                         <td class="detalleDisposicion"><div align="right">Asociado:</div></td>
                         <td class="detalleDisposicion"><%=idP17%></td>
                       </tr>
                       <tr>
                         <td class="detalleDisposicion"><div align="right">Naturaleza:</div></td>
                         <td class="detalleDisposicion"><%=idP10%></td>
                       </tr>
                       <tr>
                         <td class="detalleDisposicion"><div align="right">Analista:</div></td>
                         <td class="detalleDisposicion"><%=idP18%></td>
                       </tr>
                       <tr>
                         <td valign="top" class="detalleDisposicion"><div align="right">Antecedentes:</div></td>
                         <td class="detalleDisposicion"><%=idP12%></td>
                       </tr>
                       <tr>
                         <td valign="top" class="detalleDisposicion"><div align="right">Observaciones:</div></td>
                        <td class="detalleDisposicion"><%=idP13%></td>
                       </tr>
                       <tr>
                       <td valign="top" align="right"><span class="detalleDisposicion">Progreso:</span></td>
                       <td><div style="width: 75px; float:left;"> 
    </div>
        <% string clase="";
		double total=100;
	   double resultado=0;
	
	
	resultado = idP14!="" ? (double.Parse(idP14)/total) : 0;
	
	if (resultado <= 0.5)
	{ clase = "progress-bar progress-bar-info"; }
	if (resultado > 0.5 && resultado <= 0.8) 
	{ clase = "progress-bar progress-bar-info";}
	if (resultado > 0.8) 
	{ clase = "progress-bar progress-bar-info";}
	
	%>
        <div class="progress" id="contendorProgreso">
          <div id="idProgreso" class="<%=clase%>" role="progressbar" aria-valuenow="8" aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.Round(resultado *  100)%>%"> <%=Math.Round(resultado * 100)%>% </div>
        </div></td>
                       </tr>
</table>
<%
}
//Para el bloque de Reportes
if (strReportes.IndexOf('2')>=0){

try{ //
       
			  
			 dbManager.Open();		
			 strSQL = "exec spNotificaciones 1, null,"+Session["sysEdicion"].ToString()+",'A',"+idP0+","+Session["sysIdPlanta"].ToString()+",2";			 
			
			 //Response.Write(strSQL);	   
			//Response.End();
			 dbManager.ExecuteReader(CommandType.Text,strSQL);
			
			sec=0;	idP1="";
  
	 while(dbManager.DataReader.Read()) {
						
			 if (sec < 1){
			%>
<br />
 <div style='width: 95%; height:120px; overflow:auto; '> <span class="detalleDisposicionTitulo" > Reportes </span>                      
<table width="100%" border="0" cellpadding="0" cellspacing="1"  >
<tr class="tituloGrid" >
      <td width="18%" height="25"   ><div align="center">Fecha</div></td>
      <td width="54%"  ><div align="center">Avance</div></td>
      <td width="28%"  ><div align="left">Usuario</div></td>
      <!--<td width="9%" bgcolor="#38A0FE" ><div align="center">Tipo</div></td>
                <td width="22%" bgcolor="#38A0FE" ><div style="float:left; width: 50%;">
                  <div align="center">Observaci&oacute;n</div>
                </div><div style="float:right; width: 50%;" ></td>-->
    </tr>
              <%
    	}
				       
				sec++;
				
				if ((sec % 2)==0){
				  bgColor="#F0F0FF";
				}else{
				   bgColor="#ffffff";
				  
			    } 
		%>
              <tr class="detalleDisposicion" >
                <td height="25" valign="top"  bgcolor="<%=bgColor%>">&nbsp;<%=dbManager.DataReader["fecha"].ToString()%></td>
                <td valign="top" bgcolor="<%=bgColor%>" ><%=dbManager.DataReader["accion"].ToString()%></td>
                <td valign="top"  bgcolor="<%=bgColor%>"><%=dbManager.DataReader["usuario"].ToString()%></td>
                <!-- <td valign="top"  bgcolor="<%//=bgColor%>"><div align="center"><%//=dbManager.DataReader["tipo_rrhh"].ToString()%></div></td>
                <td valign="top"  bgcolor="<%//=bgColor%>">
				<a href="#" class="tooltip"  style="font-family:Arial, Helvetica, sans-serif; color:#666666; text-decoration: none;" >
				<%
	 //Response.Write(dbManager.DataReader["observacion"].ToString().Length > 50 ? dbManager.DataReader["observacion"].ToString().Substring(0,50)+"..." : dbManager.DataReader["observacion"].ToString());
	 %>   <span ><%//=dbManager.DataReader["observacion"].ToString()%></span></a>				</td>-->
    </tr>
              <%} %>
              <tr>
               <td  style="border-radius: 0px 0px 0px 10px;">&nbsp;</td>
               <td  >&nbsp;</td>
               <td  >&nbsp;</td>
               
              </tr>
   </table>
</div>
<% 			
         }catch (Exception ex){ Response.Write(ex.Message.ToString());}
          finally{dbManager.Dispose();}	             
}

if (strReportes.IndexOf('3')>=0){
try{ // Para el modulo de Mensajes

 			  
			 dbManager.Open();		
			 strSQL = "exec spNotificaciones 3,"+Session["sysIdRrhh"].ToString() +","+Session["sysIdTipoRrhh"].ToString()+",'A',"+idP0+","+Session["sysIdPlanta"].ToString()+",'R' ";			 
			 //Response.Write(strSQL);	   
			//Response.End();
			 dbManager.ExecuteReader(CommandType.Text,strSQL);
			
			sec=0;	
	 while(dbManager.DataReader.Read()) {
						
			 if (sec < 1){
			%>
            <br />
              <div style='width: 95%; height:120px; overflow:auto; '> <span class="detalleDisposicionTitulo" > Observaciones </span>   
              <table width="100%" border="0" cellpadding="0" cellspacing="1"  >
              <tr class="tituloGrid" >
                <td width="18%" height="25"  ><div align="center">Fecha</div></td>
                <td width="54%"  ><div align="center">Mensaje</div></td>
                <td width="28%"  ><div align="left">Usuario</div></td>
                
               
             
  </tr>
              <%
    	}
				       
				sec++;
				
				if ((sec % 2)==0){
				  bgColor="#F0F0FF";
				}else{
				   bgColor="#ffffff";
				  
			    } 
		%>
              <tr class="detalleDisposicion" >
                <td height="30" valign="top"  bgcolor="<%=bgColor%>">&nbsp;<%=dbManager.DataReader["fecha"].ToString()%></td>
                 <td valign="top"  bgcolor="<%=bgColor%>"> <span ><%=dbManager.DataReader["mensaje"].ToString()%></span>
				</td>
                
                <td valign="top"  bgcolor="<%=bgColor%>"><%=dbManager.DataReader["usuario"].ToString()%></td>
               
              </tr>
              <%} %>
</table>
</div>
<% 			
         }catch (Exception ex){ Response.Write(ex.Message.ToString());}
          finally{dbManager.Dispose();}	 
}
if (strReportes.IndexOf('4')>=0){
// Para el modulo de Archivos
strReportes=""; sec=0;
try {
        dbManager.Open();
		strSQL ="exec spNotificaciones 5, "+Session["sysIdRrhh"].ToString()+", null,'A',"+idP0+" ";
		dbManager.ExecuteReader(CommandType.Text,strSQL);
		
		strReportes +="<div style='width: 95%; height:120px; overflow:auto; '> <span class='detalleDisposicionTitulo' > Documentos </span><table width='99%' border='0' align='center' cellpadding='0' cellspacing='0' >";
			   strReportes +="<tr class='tituloGrid'><td valign='top'  width='15%' height='25'><div align='center' ><strong>Fecha</strong></div></td>";
    
    strReportes +="<td  valign='top' width='40%'><div align='center' > <strong>Archivo</strong></div></td>";
	strReportes +="<td  valign='top'  width='27%'><div align='center' > <strong>Usuario</strong></div></td>";
 	strReportes +="</tr>";
	// strTablaErrores +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Max. Batches</strong></div></td>";
	 
		
			   
			   while(dbManager.DataReader.Read())
			   {
			   sec++;
			   
			   if ((sec % 2)==0){
				  bgColor="#F0F0FF";
				}else{
				   bgColor="#ffffff";
				  
			    } 
			   			  			   	
			   strReportes +="<tr class='detalleDisposicion'><td bgcolor="+bgColor+" height='20'>&nbsp;"+dbManager.DataReader["fecha"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["archivo"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["usuario"].ToString()+"</td></tr>";
			   
			   }	       
			   strReportes +="</table></div>";
				
				Response.Write(strReportes);
				    
              }
             catch (Exception ex)
             {
                 Response.Write(ex.Message.ToString());  
             }
              
             finally
             {
               dbManager.Dispose();
             }
}//end de mostrar bloque
%>
<br />
<br />
<% 
break;

case 7: 
idP0=""; idP1=""; idP2="";
 
 idP0=Request.QueryString["p0"];
 idP1=Request.QueryString["p1"];
 idP2=Request.QueryString["p2"];   
 idP3 = Request.QueryString["op"];    		
		try
         { 		  
		     //Response.Write(idP0+"|"+idP1+"|"+idP2);
			 //Para la consulta de anlisis
		  dbManager.Open();
          
		  if (idP3=="1") strSQL=" exec spReportes 10, null,null,'A','"+idP0+"' "; 
		  if (idP3=="2") strSQL=" exec spReportes 8, null,null,'A','"+idP0+"' "; 
		  
		  
		 //Response.Write(strSQL);	  
						  
		 dbManager.ExecuteReader(CommandType.Text,strSQL);
       
		 	   
			   cuerpo="<table width='100%' border='0' cellpadding='0' cellspacing='0' >";//<div id='idRegistros' style='width: 150px; height:170px; overflow:auto;' onClick='javascript: idRegistros.parentNode.removeChild(idRegistros);'>";		   
			   while(dbManager.DataReader.Read())
			   {				
				 cuerpo += "<tr ><td width='50%' class='columnasAutocompletado'><a href='#' onclick='javascript: objSel=document.getElementById(\""+idP1+"\"); objSel.value=\""+dbManager.DataReader[1].ToString()+"\"; objSel.style=\"background-color:#F0F0FF\"; var idSel=document.getElementById(\""+idP2+"\"); idSel.value=\""+dbManager.DataReader[0].ToString()+"\";'>" + dbManager.DataReader[1].ToString()+"</a></td></tr>";	
				
				}
				  				 
				cuerpo +="</table>";
				 Response.Write(cuerpo);	//"</div>"+		  
             }catch (Exception ex){
                 Response.Write(ex.Message.ToString());  
             }finally{
               dbManager.Dispose();
             }
break;


case 8: /*************  REPORTE PRE-CONTRACTUALES  *****************************/
// Para Distribucion de Disposiciones x Estado
 idP0=Request.QueryString["p0"]; //id_responsable 
 idP1=Request.QueryString["p1"]; //tipo de cadena
 strReportes = Request.QueryString["mC"];
idP4 = Request.QueryString["mF"]!=""? "'"+Request.QueryString["mF"]+"'": "null";
  try  { 
    //int sumaN=0; int sumaE=0; int sumaA=0; int sumaD=0; int sumaEs=0;      
   			dbManager.Open();		
			strSQL = "exec spReportes 9, "+ idP0 +","+ idP1 +",'A',"+ idP4 +" ";
		       //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1=""; idP2=""; idP3="";	   
 
  while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	
	 %>

<br />
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center" class="detalleDisposicionTitulo">    M.I. Municipalidad de Guayaquil <br>Reporte <%=dbManager.DataReader["nomPlantilla"].ToString()%> </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="detalleDisposicion"><strong>Usuario: </strong> <%=(Session["sysNombreUsuario"]+" "+Session["sysLABORATORIO"])%></td>
        <td class="detalleDisposicion" align="right"><strong>Fecha:</strong>
          <% Response.Write(DateTime.Now.ToString());%></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
<div style='width: 100%; height:400px; overflow:auto;'>
<table width="100%" border="0" cellpadding="1" cellspacing="1" align="right"  style='border-bottom:solid 1px #CCCCCC;' >
  <tr class="tituloGrid"  >
    <td width="1%"   height="25" align="center" ></td>
    <td width="10%"  align="center">Estado Actual</td>
    <td width="20%"  align="center">Disposicion</td>
    <td width="30%"  align="center">Responsable</td>
    <td width="10%"  align="center">F. Inicio</td>
    <td width="10%"  align="center">F. Final</td>
   <%if (strReportes.IndexOf("-1")>=0){ %> 
   <td width="10%"  align="center"> Avance</td> 
   <% } %>
   <%if (strReportes.IndexOf("-2")>=0){ %>
    <td width="10%"  align="center">Mensaje</td>
   <% } %>
    <%if (strReportes.IndexOf("-3")>=0){ %>
    <td width="10%"  align="center">Report&oacute;</td> 
    <% } %> 
    </tr>
	 <% } 
	 
	            estado = int.Parse(dbManager.DataReader["id_estadoDisposicion"].ToString());
				 switch (estado){
					case 2: idP2="style='background:#0033CC;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //Nuevos
					case 4:	idP2="style='background:#CC0000; color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break;  //Detenidos
					case 11: idP2="style='background:#FF6600;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //Incumpplidos
					case 7:  idP2="style='background:#FFCC00;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //atrasados
					case 15: idP2="style='background:#FF6E8B;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //Sin reporte
					case 5:  idP2="style='background:#009900;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //En ejecucion
					case 8: idP2="style='background:#59FFFF;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //Revision
					case 9:  idP2="style='background:#9C9CFF;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //En espera				
					}
	 
	 sec++; %> 
  <tr class="detalleDisposicion" >
    <td  <%=idP2%>  align="center" height="25" >&nbsp;</td>
    <td valign="top" <%=idP3%> ><%=dbManager.DataReader["estado"].ToString()%></td>
    <td valign="top" <%=idP3%> ><%=dbManager.DataReader["disposicion"].ToString()%></td>
    <td valign="top" <%=idP3%> ><%=dbManager.DataReader["responsable"].ToString()%></td>
    <td align="left" valign="top" <%=idP3%> ><%=dbManager.DataReader["fechaInicio"].ToString()%></td>
    <td align="left" valign="top" <%=idP3%> ><%=dbManager.DataReader["fechaFinal"].ToString()%></td>
<%if (strReportes.IndexOf("-1")>=0){ %>    
<td align="left" valign="top" <%=idP3%> ><%
   
   if (dbManager.DataReader["padreUsuario"].ToString()!=""){
      Response.Write(dbManager.DataReader["fechaAvance"].ToString()+"<br> "+ dbManager.DataReader["padreUsuario"].ToString() + " <br> "+dbManager.DataReader["ultimoAvance"].ToString());
   }else{
   Response.Write(dbManager.DataReader["fechaAvance"].ToString()+"<br> "+ dbManager.DataReader["usuarioUltimoAvance"].ToString()+ " <br> "+dbManager.DataReader["ultimoAvance"].ToString());
   }
   
   %></td>
 <% }%>
<%if (strReportes.IndexOf("-2")>=0){ %>   
<td align="left" valign="top" <%=idP3%> ><%
   
   if (dbManager.DataReader["padreMensaje"].ToString()!=""){
      Response.Write(dbManager.DataReader["fechaMensaje"].ToString()+"<br> "+ dbManager.DataReader["padreMensaje"].ToString() + " <br> "+dbManager.DataReader["mensaje"].ToString());
   }else{
   Response.Write(dbManager.DataReader["fechaMensaje"].ToString()+"<br> "+ dbManager.DataReader["usuarioReporta"].ToString()+ " <br> "+dbManager.DataReader["mensaje"].ToString());
   }
   
   %></td>
   <% }%>
   <%if (strReportes.IndexOf("-3")>=0){ %>
   <td align="left" valign="top" <%=idP3%> ><%=dbManager.DataReader["fechaMax"].ToString() + " " + dbManager.DataReader["delegadoMax"].ToString()%></td> 
   <% }%>
  </tr>
  <%}}catch (Exception ex){ Response.Write(ex.Message.ToString());  
             }finally{ dbManager.Dispose(); } %>
</table>
</div>
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<% 
/*if (strReportes.IndexOf('2')>=0){;
//Para Mensajes
  idP0 = Request.QueryString["p0"]!="" ? Request.QueryString["p0"]: "null";
 try{ //
			  
			 dbManager.Open();		
			 strSQL = "exec spReportes 12, "+ idP0 +",null,'A'";			 
			 //Response.Write(strSQL);	   
			//Response.End();
			 dbManager.ExecuteReader(CommandType.Text,strSQL);
			
			sec=0;	
	 while(dbManager.DataReader.Read()) {
						
			 if (sec < 1){ */
			%>
            <!--<br />
            <div style='width: 95%; height:200px; overflow:auto;'><span class="detalleDisposicion" ><strong>Mensajes</strong></span>
<table width="100%" border="0" cellpadding="1" cellspacing="1"  >
              <tr class="tituloGrid" >
                <td width="16%" height="20" bgcolor="#38A0FE"  ><div align="center">Fecha</div></td>
                <td width="35%" bgcolor="#38A0FE" ><div align="center">Mensajes</div></td>
                <td width="20%" bgcolor="#38A0FE" ><div align="center">Usuario</div></td>
                <td width="9%" bgcolor="#38A0FE" ><div align="center">Tipo</div></td>
                <%// if (strReportes.IndexOf('3')>=0){; %>
                <td width="20%" bgcolor="#38A0FE" ><div align="center">Delegado</div></td>
               <%// } %>
             
  </tr>-->
              <%/*
    	}
				       
				sec++;
				
				if ((sec % 2)==0){
				  bgColor="#F0F0FF";
				}else{
				   bgColor="#ffffff";
				  
			    } */
		%>
              <!--<tr class="detalleDisposicion" >
                <td  bgcolor="<%//=bgColor%>" height="30">&nbsp;<%//=dbManager.DataReader["fecha"].ToString()%></td>
                 <td  bgcolor="<%//=bgColor%>">
				<a href="#"  style="font-family:Arial, Helvetica, sans-serif; color:#666666; text-decoration: none;" ><span ><%//=dbManager.DataReader["mensaje"].ToString()%></span></a>
				</td>
                
                <td  bgcolor="<%//=bgColor%>"><%//=dbManager.DataReader["nombre"].ToString()%></td>
                <td  bgcolor="<%//=bgColor%>"><div align="center"><%//=dbManager.DataReader["tipo"].ToString()%></div></td>
               <%// if (strReportes.IndexOf('3')>=0){; %>
                <td  bgcolor="<%//=bgColor%>"><div align="center"><%//=dbManager.DataReader["usuarioDelegado"].ToString()%></div></td>
                <%//}%>
              </tr>
              <%//} %>
</table>-->
</div>
<% /*			
         }catch (Exception ex){ Response.Write(ex.Message.ToString());}
          finally{dbManager.Dispose();}	             

}*/


break;

case 9: %> 
 
 
<div style='width: 98%; height:370px; overflow:auto;'>
<% 
  
  idP1=""; idP2=""; idP3=""; idP4=""; idP5="";
idP0=Request.QueryString["id"]!="null" ? "'" + Request.QueryString["id"]+"'" : "null" ;  //
idP2=Request.QueryString["i1"] ;  //Fecha Inicio
fecha = idP2!=null ? idP2.Split('/') : null;
idP3=Request.QueryString["id2"] ;  // fecha Fin
fecha1 = idP3!=null ? idP3.Split('/') : null;
idP4=Request.QueryString["id3"]!="" ? Request.QueryString["id3"] : "null" ;  // estado
idP5=Request.QueryString["ti"]!="" ? Request.QueryString["ti"] : "0" ;  // estado
  //Response.Write(idP2+":"+idP3+":"+idP4 +":"+ idP5);
  //Response.End();
 

  
  try  {       
   			dbManager.Open();
		
		
			if (idP5=="0") {strSQL = "exec SP_DISPOSICIONES 10,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',"+idP0+"";}
		    if (idP5=="1") {strSQL = "exec SP_DISPOSICIONES 17,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',null,null,"+ idP4 +",null,null,null,null,null,null,null,null,null,'"+fecha[2]+fecha[1]+fecha[0]+"','"+fecha1[2]+fecha1[1]+fecha1[0]+"'";}
			
if (idP5=="2") {strSQL = "exec SP_DISPOSICIONES 10,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',"+idP0+","+idP2+"";}
			
			//Response.Write(strSQL);
			//Response.End();
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	
	 //Response.Write(idP0);
	
	%>

  <% while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	 
	 %>

<table width="100%" border="0" cellpadding="1" cellspacing="1"  >
  <tr class="tituloGrid"  >
    <td width="3%"  height="25" style="border-top:solid 1px #999999;" align="center">No.</td>
    <td width="30%"  style="border-top:solid 1px #999999;" align="center">Disposicion</td>
     <td width="10%"  style="border-top:solid 1px #999999;" align="center">Estado</td>
    <td width="9%"  style="border-top:solid 1px #999999;" align="center">Fecha</td>
    <td width="11%"  style="border-top:solid 1px #999999;" align="center">Analista</td>   
    <td width="25%"  style="border-top:solid 1px #999999;" align="center">Responsable</td>
    </tr>
	 <%
    	}
				       
				sec++;
				
				if ((sec % 2)==0){
				  bgColor="#F0F0FF";
				}else{
				   bgColor="#ffffff";
				  
			    } 
		%>

 
  <tr style="font-family: Verdana, Arial, Helvetica, sans-serif; text-decoration: none; color: #666666;font-size: 12px;" >
    <td  bgcolor="<%=bgColor%>" height="30"><div align="center"><%=dbManager.DataReader["id"].ToString()%></div></td>
    <td bgcolor="<%=bgColor%>" ><a href="#"  class="link" onclick="javascript: var idSel=document.getElementById('idResponsableR'); idSel.value=<%=dbManager.DataReader["id"].ToString()%>;  var idSelDisp =document.getElementById('txtSelDispRep'); idSelDisp.value='<%=dbManager.DataReader["disposicion"].ToString()%>';" ><%=dbManager.DataReader["disposicion"].ToString()%></a></td>
    <td  bgcolor="<%=bgColor%>" ><%=dbManager.DataReader["estado"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>" ><%=dbManager.DataReader["fecha"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>" ><%=dbManager.DataReader["abreviado"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>" ><%=dbManager.DataReader["responsable"].ToString()%></td>
    <!--<td  bgcolor="<%//=bgColor%>">
      <div align="left"><a href="#" onclick="javascript: if (confirm('Esta Seguro de Eliminar la Disposicion?')){ generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;idTemp|idEliminar|GET|&typ=4&id=<%//=dbManager.DataReader["id"].ToString()%>&tab=E');}"><img src="../___Images/estado_Error.gif" width="18" height="19" vspace="1" border="0" title="Interactivo" /></a></div></td>-->
    </tr>
  <%}
   }catch (Exception ex){
                 Response.Write(ex.Message.ToString());  
             }finally{
               dbManager.Dispose();
             }
  %>
</table>
</div>
             
<% 
break;

case 10: //Para Eliminar un archivo
try{ 
 idP0=Request.QueryString["p0"];  //id archivo 
 idP1=Request.QueryString["id"];  //id_disposicion 
 idP2=Session["sysEdicion"].ToString()=="0" ? Session["sysIdRrhhAsociado"].ToString() : Session["sysIdRrhh"].ToString();  // para diferenciar quien ingresa el mensaje es el Delegado o Analista q tambien lo hace	

			

 		  			  
			 dbManager.Open();		
			 strSQL = "exec spNotificaciones 6,"+ idP0 +" , "+Session["sysIdRrhh"].ToString()+",'A',"+idP1+","+Session["sysIdPlanta"].ToString()+","+Session["sysEdicion"].ToString()+",'Eliminado',"+ idP2 +"";	
		
			 	//Response.Write(strSQL);	  
			    //Response.End();
				dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 
			
             }
             catch (Exception ex)
             {
                 Response.Write(ex.Message.ToString());  
             }
              
             finally
             {
               
			   dbManager.Dispose();
             }
	             
break;

case 11: //Para Eliminar un archivo
try{ 
 idP0=Request.QueryString["p0"];  //id_disposicion 
  idP1=Request.QueryString["dl"];  //id_disposicion 

			 dbManager.Open();		
			 strSQL = "exec spNotificaciones 8, "+ idP0 +",null,null,null,null,null,'"+ idP1 +"'";	
		
			 	//Response.Write(strSQL);	   
			    //Response.End();
				dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 
			
             }
             catch (Exception ex)
             {
                 Response.Write(ex.Message.ToString());  
             }
              
             finally
             {
               
			   dbManager.Dispose();
             }
	             
break;

case 12: //Para Eliminar un Reporte
try{ 
 idP0=Request.QueryString["p0"];  //id Reporte 
 idP1=Request.QueryString["p1"];  //id_disposicion 
 idP3=Request.QueryString["tip"];  //id_disposicion 
 idP2=Session["sysEdicion"].ToString()=="0" ? Session["sysIdRrhhAsociado"].ToString() : Session["sysIdRrhh"].ToString();  // para diferenciar quien ingresa el mensaje es el Delegado o Analista q tambien lo hace	

			

 		  			  
			 dbManager.Open();		
			 strSQL = "exec spNotificaciones 9,"+ idP0 +" , "+Session["sysIdRrhh"].ToString()+",'A',"+idP1+","+Session["sysIdPlanta"].ToString()+","+Session["sysEdicion"].ToString()+",'Eliminado',"+ idP2 +",'"+ idP3 +"'";		

			 	//Response.Write(strSQL);	   
			    //Response.End();
				dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 
			
             }
             catch (Exception ex)
             {
                 Response.Write(ex.Message.ToString());  
             }
              
             finally
             {
               
			   dbManager.Dispose();
             }
	             
break;


}  
%>
