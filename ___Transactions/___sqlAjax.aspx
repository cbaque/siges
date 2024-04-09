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

<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net.Mime" %>
<%@ Import Namespace="System.Threading" %>

<%
 Response.CacheControl = "no-cache";
 //Response.AddHeader "Pragma", "no-cache" ;
 //Response.Expires = -1;
string idP0;
string idP1;
string idP2;
string idP3;
string idP4;
string idP5;
string idP6;
string idP7;
string idP8;
string idP9;
string idP10;
string idP11;
string idP12;
string idP13;
string idP14;
string idP15;
string idP16;
string idP17;
string idP18;
string idP19;
string idP20;
string idP21;
string idP22;
string cuerpo;
string valAnalisis;
string strSQL = "";
string anio="" ; string mes="" ; string dia=""; string strFecha; string bgColor; string i;
string[] fecha;
string[] fecha1;
DateTime f; DateTime f1;
string[] matIDs;string[] matVals;string[] matRes;
int sec; double secuencial=0;


//Instancia de Objetos para base de datos
IDBManager dbManager = new DBManager(DataProvider.OleDb);

dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();



//Response.Write(Request.QueryString["p8"]);
//Response.End();

//tipo de opcion de operacion
int tipo = Request.QueryString["typ"]!=null ? int.Parse(Request.QueryString["typ"]): -1;
//Response.Write(tipo);
//Response.End();
switch (tipo){
case 0: //Para las especificaciones en los parametros de los analisis
//Declaracion de Variables
idP0=Session["sysIdTipoRrhh"]!=null? (string)Session["sysIdTipoRrhh"] : null;
idP1=Session["sysIdTipoRrhh"]!=null? (string)Session["sysIdPlanta"] : null;

//manejo de clase de datos y consulta mediante stored procedure
//Este script se encarga de generar las variables de sesion y autenticacion de usuario

         try
          { 						
			   dbManager.Open();
               strSQL = "SP_DISPOSICIONES null,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',null,"+Session["sysEdicion"].ToString()+",null,null,null,"+Request.QueryString["j0"]+","+Request.QueryString["j1"]+",null,'R' ";			   
			   //Response.Write(strSQL);
			   
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
                 
              cuerpo="</br><p></p><table width='55%' border='0' cellspacing='0' cellpadding='0' align='center' class='tablaResumen'><tr><td width='5%' align='center' ></td><td  class='numeroDisposicion' height='25' width='40%'>&nbsp;Estado de Disposiciones</td><td  class='numeroDisposicion' width='10%'>Total</td></tr>";
			   
			   idP2="";
			   while(dbManager.DataReader.Read())
			   {			       
				 secuencial += double.Parse(dbManager.DataReader["N"].ToString());
				 
				  tipo = int.Parse(dbManager.DataReader["id"].ToString());
				 switch (tipo){
					case 2: //Nuevos
					idP2="style='width:14px;height:14px;border-radius:7px;background:#0033CC;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 4: //Detenidos
					idP2="style='width:14px;height:14px;border-radius:7px;background:#CC0000;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 11: //Incumpplidos
					idP2="style='width:14px;height:14px;border-radius:7px;background:#FF6600;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 7: //atrasados
					idP2="style='width:14px;height:14px;border-radius:7px;background:#FFCC00;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 15: //Sin reporte
					idP2="style='width:14px;height:14px;border-radius:7px;background:#FF6E8B;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 5: //En ejecucion
					idP2="style='width:14px;height:14px;border-radius:7px;background:#009900;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 17: //En validacion
					idP2="style='width:14px;height:14px;border-radius:7px;background:#9595FF;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 8: //En espera
					idP2="style='width:14px;height:14px;border-radius:7px;background:#59FFFF;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 9: //En espera
					idP2="style='width:14px;height:14px;border-radius:7px;background:#9C9CFF;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					
					}

                  cuerpo +="<tr bgcolor='#ffffff'><td align='center' ><div "+ idP2 +"  ></div></td><td align='left' height='25' >&nbsp;"+ dbManager.DataReader["nombre"].ToString() +"</td><td align='center' >"+ dbManager.DataReader["N"].ToString() +"</td></tr>";
				  	
				}
				
				cuerpo +="<tr  ><td ></td><td height='25'  class='numeroDisposicion'>&nbsp;&nbsp;Total General</td><td align='center'  class='numeroDisposicion'>"+ secuencial.ToString() +"</td></tr></table><br>";
				
				/*    **********************Para leer las Alertas Segun Usuario **********************************/
				strSQL = "spNotificaciones null, "+Session["sysIdRrhh"].ToString()+","+Session["sysEdicion"].ToString()+",'A' ";
			   
			   //Response.Write(strSQL);
			   
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
				 cuerpo +="<div style='width: 90%; height:300px; overflow: auto;' >";
				 sec=0;
				 while(dbManager.DataReader.Read())
			   {	
				  sec++;
				   cuerpo +="<div class='alert alert-info' id='alert"+sec+"'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Atenci&oacute;n: </strong><a href='#'  class=\"link\" onclick='javascript: parent.generalJS(\"0\",\"frmMeta|___doMain.aspx|idTemp;idTemp|idHome|GET|&id="+dbManager.DataReader["id"].ToString()+"&pID="+dbManager.DataReader["id_estadoDisposicion"].ToString()+"&tab=1\");'  style='Color: #006600;'>"+dbManager.DataReader["disposicion"].ToString()+"</a><br /><strong>Accion: </strong>"+dbManager.DataReader["accion"].ToString()+", "+dbManager.DataReader["fecha"].ToString()+" <a href='#' onclick='javascript: generalJS(\"0\",\"idFormGrafico|___sqlAjax.aspx|idTemp;idTemp|idNotificacion|GET|&typ=15&id="+dbManager.DataReader["id"].ToString()+"&j0="+Request.QueryString["j0"]+"&j1="+Request.QueryString["j1"]+"&tab=0\"); '>Borrar</a></div>";
				  
								  
				  
				}
				cuerpo +="</div>";
				 Response.Write(cuerpo);
				 
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
case 1:
try
          { 
		  
idP0 = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";

idP1 ="";idP2 ="";idP3 ="";idP4 ="";idP5 ="";idP6 ="";idP7 ="";idP8 ="";idP9 ="";idP10 ="";idP11 ="";idP12 ="";idP13 ="";idP14 ="";idP15 ="";
idP16 ="";idP17 ="";idP18 ="";idP19 ="";idP20 ="";idP21 ="";idP22 ="";

ComboLista dbTipoDisposicion;
dbTipoDisposicion = new ComboLista("cmbTipoDisposicion", "0", "exec SP_DISPOSICIONES 0,null,null,'A'", "", "", "", "cajaFormulario", "0", "");

ComboLista dbEstadoDisposicion;
dbEstadoDisposicion = new ComboLista("cmbEstadoDisposicion", "0", "exec SP_DISPOSICIONES 1,1,"+Session["sysIdPlanta"].ToString()+",'A','F'", "", "", "", "cajaFormulario", "0", "");

ComboLista dbNaturalezaDisposicion;
dbNaturalezaDisposicion = new ComboLista("cmbNaturalezaDisposicion", "0", "exec SP_DISPOSICIONES 2,null,null,'A'", "", "", "", "cajaFormulario", "0", "");

ComboLista dbCabPlantilla; 
dbCabPlantilla = new ComboLista("cmbCabPlantiModi", "0", "", "", "", "", "cajaFormulario", "0", "");        

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
			       idP16 = dbManager.DataReader["corresponsable"].ToString()!="" ?  dbManager.DataReader["corresponsable"].ToString() : "" ; //  corresponsable
		           idP17 = dbManager.DataReader["asociado"].ToString()!="" ?  dbManager.DataReader["asociado"].ToString() : "" ; //  asociado
		           idP18 = dbManager.DataReader["analista"].ToString(); //  analista
				   idP19 = dbManager.DataReader["id_estado"].ToString(); //  analista
				   idP20 = dbManager.DataReader["id_tipo"].ToString(); //  analista
				   idP21 = dbManager.DataReader["id_naturaleza"].ToString(); //  analista
				   idP22 = dbManager.DataReader["id_plantilla"].ToString(); //  analista
				}
if (idP22!=""){
//crear combo plantilla
strSQL = "exec spPlantillas 7,1,"+idP20+",null,null,null,'A'";
dbCabPlantilla.Events = ("onchange='javascript: alert(\" Importante: Si cambia el tipo de cadena se elimina el cronograma actual y se crea el nuevo que haya seleccionado. \");'");
dbCabPlantilla.StrSQL = strSQL;
dbCabPlantilla.ItemSelect = idP22;	
}		   

%>
<style type="text/css">
<!--
.styleTexto {	color: #000000;
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
-->
</style>

<% 
//Para el caso de Analistas
if (Session["sysEdicion"].ToString()=="0"){
%>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="2"  >
                       <tr>
                         <td width="17%" class="detalleDisposicion"><div align="right">Estado:</div></td>
                       <td width="77%"><table width="100%" border="0" cellspacing="2" cellpadding="2">
                             <tr>
                               <td width="186" class="detalleDisposicion"><div align="left"><%=idP1%></div></td>
                               <td width="39" class="detalleDisposicion"><div align="right">Tipo:</div></td>
                               <td width="570" class="detalleDisposicion"><%=idP2%></td>
                         </tr>
                         </table></td>
                       <td width="6%">                         </td>
  </tr>
                       <tr>
                         <td class="detalleDisposicion"><div align="right" >Disposici&oacute;n:</div></td>
                         <td class="detalleDisposicion"><%=idP3%></td>
                         <td>&nbsp;</td>
                       </tr>
                       <tr>
                         <td valign="top" class="detalleDisposicion"><div align="right">Detalle:</div></td>
                         <td valign="top" class="detalleDisposicion"><%=idP4%></td>
                         <td valign="top">&nbsp;</td>
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
                         <td>&nbsp;</td>
                       </tr>
                       <tr>
                         <td class="detalleDisposicion"><div align="right">Responsable:</div></td>
                         <td class="detalleDisposicion"><strong><%=idP15%></strong></td>
                         <td>&nbsp;</td>
                       </tr>
                       <tr>
                         <td valign="top" class="detalleDisposicion"><div align="right">Corresponsable(s):</div></td>
                         <td class="detalleDisposicion"><%=idP16.Replace("|","<br>")%></td>
                         <td>&nbsp;</td>
                       </tr>
                       <tr>
                         <td class="detalleDisposicion"><div align="right">Asociado(s):</div></td>
                         <td class="detalleDisposicion"><%=idP17.Replace("|","<br>")%></td>
                         <td>&nbsp;</td>
                       </tr>
                       <tr>
                         <td class="detalleDisposicion"><div align="right">Naturaleza:</div></td>
                         <td class="detalleDisposicion"><%=idP10%></td>
                         <td>&nbsp;</td>
                       </tr>
                       <tr>
                         <td class="detalleDisposicion"><div align="right">Administrador:</div></td>
                         <td class="detalleDisposicion"><%=idP18%></td>
                         <td>&nbsp;</td>
                       </tr>
                       <tr>
                         <td valign="top" class="detalleDisposicion"><div align="right">Antecedentes:</div></td>
                         <td class="detalleDisposicion"><%=idP12%></td>
                         <td>&nbsp;</td>
                       </tr>
                       <tr>
                         <td valign="top" class="detalleDisposicion"><div align="right">Observaciones:</div></td>
                        <td class="detalleDisposicion"><%=idP13%></td>
                        <td>&nbsp;</td>
                       </tr>
                       <tr>
                         <td valign="top" align="right" class="detalleDisposicion">Progreso:</td>
                         <td><% string clase="";
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
    <div class="progress">
  <div class="<%=clase%>" role="progressbar" aria-valuenow="8" aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.Round(resultado *  100)%>%"> <%=Math.Round(resultado * 100)%>% </div>
</div></td>
                         <td>&nbsp;</td>
                       </tr>
                     </table>
<% 
}
%>
<% 


if (Session["sysEdicion"].ToString()=="1"){%> 
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1"  >
  <tr>
    <td><div align="right" class="detalleDisposicion">Disposici&oacute;n:</div></td>
    <td><span class="Estilo7">
      <textarea name="txtNombre" cols="10" rows="2" class="cajaFormulario" id="txtNombre"><%=idP3%></textarea>
    </span></td>
    <td></td>
  </tr>
  <tr>
    <td width="17%"><div align="right"><span class="detalleDisposicion">Estado:</span></div></td>
    <td width="56%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="234"><div align="left">
          <%		
		    dbEstadoDisposicion.Nombre=("cmbEstadoDisposicion");
			dbEstadoDisposicion.CssCmb="cajaFormulario";
			dbEstadoDisposicion.ItemSelect = idP19;
			//dbTipoDisposicion.Events=("onChange='generalJS(\"0\",\"frmMeta|___sqlAjax.aspx|cmbEstanteria;cmbEstanteria|idArchivos|GET|&typ=2&tab=2\");'");
			Response.Write(dbEstadoDisposicion.cargarComboLista());
		%>
        </div></td>
        <td width="51"><div align="right"><span class="detalleDisposicion">Tipo:</span></div></td>
        <td width="254"><%
		    dbTipoDisposicion.Nombre=("cmbTipoDisposicion");
			dbTipoDisposicion.CssCmb="cajaFormulario";
			dbTipoDisposicion.ItemSelect = idP20;
			//dbTipoDisposicion.Events=("onChange='generalJS(\"0\",\"frmMeta|___sqlAjax.aspx|cmbEstanteria;cmbEstanteria|idArchivos|GET|&typ=2&tab=2\");'");
			Response.Write(dbTipoDisposicion.cargarComboLista());
		%></td>
        <td width="254"><% 
			if (idP22!=""){ Response.Write(dbCabPlantilla.cargarComboLista());}
			else{ Response.Write("<input type='hidden' value='' id='cmbCabPlantiModi' />");}
		  %></td>
          
      </tr>
    </table></td>
    <td width="27%"></td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><span class="detalleDisposicion">Detalle:</span></div></td>
    <td valign="top"><span class="Estilo7">
      <textarea name="txtDetalle" cols="10" rows="2" class="cajaFormulario" id="txtDetalle"><%=idP4%></textarea>
    </span></td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Fecha Inicial: </span></div></td>
    <td>
    <div style="float:left; width:35%;"><input name="txtFInicial" type="text" class="cajaFormulario" id="txtFInicial" size="7" maxlength="10" onClick="calenJquery('txtFInicial');" value="<%=idP5%>" style="width: 120px; float:left;"  /></div><div style="float:left; width:35% "><input name="txtFFinal" type="text" class="cajaFormulario" id="txtFFinal" size="7" maxlength="10" onClick="calenJquery('txtFFinal');" value="<%=idP6%>" style="float:left; width: 120px;" /></div>
    
   
    
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Responsable:</span></div></td>
    <td><div style="float:left; width: 20%">
      <input name="txtResponsable" type="text" class="cajaFormulario" id="txtResponsable" size="20" onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&amp;op=1&tE=0|idAuto|GET|txtResponsable|txtResponsableSel|idResponsable');}" onclick="this.value='';"  placeholder="Buscar" />
      <div id='idAuto'></div>
    </div>
        <div style="float:left;width: 80%">
          <input name="txtResponsableSel" type="text" class="cajaFormulario" id="txtResponsableSel" size="20" value="<%=idP15%>"  placeholder="Responsable" readonly="readonly" />
        </div>
      <div style="float:left;">
        <input name="idResponsable" type="hidden" id="idResponsable" value="<%=idP7%>" />
      </div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Corresponsable:</span></div></td>
    <td valign="top"><span class="Estilo7">
      <div style="float:left; width: 20%">
        <input name="txtCoResponsable" type="text" class="cajaFormulario" id="txtCoResponsable" size="20" onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&amp;op=3&tE=0|idCoAuto|GET|txtCoResponsable|cmdCoResp|idCoResponsable');}" onclick="this.value='';" placeholder="Buscar"  />
        <div id='idCoAuto'></div>
      </div>
      <div style="float:left;width: 75%; ">         
        <select name="cmdCoResp" size="2" id="cmdCoResp"   class="cajaFormulario" style="height: 50px;" placeholder="Corresponsable"   >
        <%
		 if (idP16!=""){
		  if (idP16.IndexOf('|')>0){
		       matVals = idP16.Split('|');
			   matIDs = idP8.Split('|');		   
			   for (sec=0;sec < matVals.Length ; sec++ ){
			   Response.Write("<option value='"+ matIDs[sec] +"'>" + matVals[sec] + "</option>"); 		   
			   } 
		  }else{ 
		     Response.Write("<option value='"+ idP8 +"'>" + idP16 + "</option>"); 
		  }
		 } 
		%>
        </select>
       </div><div style="float:left; width: 5%;">
        <a href="#" class="btn btn-warning btn-xs" onclick="javascript: objSel=document.getElementById('cmdCoResp');var idSel=document.getElementById('idCoResponsable'); if (objSel.options.selectedIndex != -1 ){; var str=''; for (i=0; i<objSel.options.length; i++){ if(objSel.options[i].selected){ objSel.options[i] = null; }} for (i=0; i<objSel.options.length; i++){ str += objSel.options[i].value + '|'; } idSel.value = str.substr(0,(str.length-1)); } else { alert('Por favor, seleccione un responsable antes de Remover.'); }">X</a>   
      
      
        <input name="idCoResponsable" type="hidden" id="idCoResponsable" value="<%=idP8%>" />
      </div>
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    
<td><div align="right"><span class="detalleDisposicion">Asociado:</span></div></td>
    <td><div style="float:left; width: 20%">
      
      
      <input name="txtAsociado" type="text" class="cajaFormulario" id="txtAsociado" size="20"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&amp;op=3&amp;tE=0|idAsoAuto|GET|txtAsociado|txtAsociadoSel|idAsociado');}" onclick="this.value='';" placeholder="Buscar"  />
      
      
      <div id='idAsoAuto'></div>
    </div>
        <div style="float:left;width: 75%">
        
          <select name="txtAsociadoSel" size="2" id="txtAsociadoSel"   class="cajaFormulario" style="height: 50px;" placeholder="Asociado"   >
        <%
		 
		 if (idP17!=""){
		  if (idP17.IndexOf('|')>0){
		       matVals = idP17.Split('|');
			   matIDs = idP9.Split('|');		   
			   for (sec=0;sec < matVals.Length ; sec++ ){
			   Response.Write("<option value='"+ matIDs[sec] +"'>" + matVals[sec] + "</option>"); 		   
			   } 
		  }else{ 
		     Response.Write("<option value='"+ idP9 +"'>" + idP17 + "</option>"); 
		  }
		 } 
		%>
        </select>
        </div>
        <div style="float:left; width: 5%;"> <a href="#" class="btn btn-warning btn-xs" onclick="javascript: objSel=document.getElementById('txtAsociadoSel');var idSel=document.getElementById('idAsociado'); if (objSel.options.selectedIndex != -1 ){; var str=''; for (i=0; i&lt;objSel.options.length; i++){ if(objSel.options[i].selected){ objSel.options[i] = null; }} for (i=0; i&lt;objSel.options.length; i++){ str += objSel.options[i].value + '|'; } idSel.value = str.substr(0,(str.length-1)); } else { alert('Por favor, seleccione un Asociado antes de Remover.'); }">X</a>
          <input name="idAsociado" type="hidden" id="idAsociado" value="<%=idP9%>" />
      </div>      </td>
    <td>&nbsp;</td>
  
</tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Naturaleza:</span></div></td>
    <td><%
		    dbNaturalezaDisposicion.Nombre=("cmbNaturalezaDisposicion");
			dbNaturalezaDisposicion.CssCmb="cajaFormulario";
			dbNaturalezaDisposicion.ItemSelect = idP21;
			//dbTipoDisposicion.Events=("onChange='generalJS(\"0\",\"frmMeta|___sqlAjax.aspx|cmbEstanteria;cmbEstanteria|idArchivos|GET|&typ=2&tab=2\");'");
			Response.Write(dbNaturalezaDisposicion.cargarComboLista());
		%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Administrador:</span></div></td>
    <td><div style="float:left; width: 20%">
      <input name="txtAnalista" type="text" class="cajaFormulario" id="txtAnalista" size="20" onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&amp;op=1&tE=1|idAnaAuto|GET|txtAnalista|txtAnalistaSel|idAnalista');}" onclick="this.value='';" placeholder="Buscar"  />
      <div id='idAnaAuto'></div>
    </div>
        <div style="float:left;width: 80%">
          <input name="txtAnalistaSel" type="text" class="cajaFormulario" id="txtAnalistaSel" size="20" value="<%=idP18%>" placeholder="Analista" readonly="readonly" />
        </div>
      <div style="float:left;">
        <input name="idAnalista" type="hidden" id="idAnalista" value="<%=idP11%>" />
      </div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><span class="detalleDisposicion">Antecedentes:</span></div></td>
    <td><span class="Estilo7">
      <textarea name="txtAntecedentes" cols="40" rows="2" class="cajaFormulario" id="txtAntecedentes"><%=idP12%></textarea>
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><span class="detalleDisposicion">Observaciones:</span></div></td>
    <td><span class="Estilo7"> </span> <span class="Estilo7">
      <textarea name="txtObservacion" rows="2"  class="cajaFormulario" id="txtObservacion" ><%=idP13%></textarea>
    </span></td>
    <td><div id="idRegistroDisposicion"></div></td>
  </tr>
  <tr>
    <td valign="top" align="right"><span class="detalleDisposicion">Progreso:</span></td>
    <td><div style="width: 75px; float:left;"> <input type="text" id="progreso" class="cajaFormulario" onkeyup="javascript: barraProgreso(this.value, 'contendorProgreso', 'idProgreso');" value="<%=idP14%>" maxlength="2" size="5" placeholder="0-100"  onclick="this.value='';" />
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
    <td align="left"><button type='button' class="btn btn-primary" onclick="javascript: if (validateForm('frmMeta|txtNombre;R|cmbEstadoDisposicion;R|cmbTipoDisposicion;R|txtDetalle;R|txtFInicial;R|txtFFinal;B|idResponsable;R|txtResponsableSel;R|cmbNaturalezaDisposicion;R|idAnalista;R|txtAnalistaSel;R|txtAntecedentes;B|txtObservacion;B')){generalJS('0','frmMeta|___sqlAjax1.aspx|cmbEstadoDisposicion;cmbTipoDisposicion;cmbNaturalezaDisposicion;idResponsable;idCoResponsable;idAsociado;txtNombre;txtDetalle;txtFInicial;txtFFinal;idAnalista;txtAntecedentes;txtObservacion;progreso;cmbCabPlantiModi|idRegistroDisposicion|GET|&typ=5&id=<%=idP0%>&tab=E');}" >Guardar</button>
    <div align="center"></div></td>
  </tr>
</table>
<% 
}

 }
             catch (Exception ex)
             {
                 Response.Write(ex.Message.ToString());  
             }
              
             finally
             {
              dbManager.Dispose();
             }

%>

<%
break;
case 2:
%>
<%
break;
case 3:
idP0 = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";
%>


<table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tr>
    <td align="center"><div style="float:left; width:50%;"> <span class="detalleDisposicion" >Actividad:</span><br />
        <input name="txtActividad" type="text" class="cajaFormulario" id="txtActividad" size="10"  value=""  placeholder="Escriba cada actividad en el cronograma"/>
    </div>
    
    <div style="float:left; width:12%;" align="center"> <span class="detalleDisposicion" >Fecha Inicio:</span><br />
        <input name="txtInicioActividad" type="text" class="cajaFormulario" id="txtInicioActividad" size="10" maxlength="10" onClick="calenJquery('txtInicioActividad');" placeholder="Desde" style="width: 90px; float:left;margin-left: 8px;" />
    </div>
    
    <div style="float:left; width:12%;" align="center"> <span class="detalleDisposicion"  >Fecha Fin:</span><br />
        <input name="txtFinActividad" type="text" class="cajaFormulario" id="txtFinActividad" size="10" maxlength="10" onClick="calenJquery('txtFinActividad');" placeholder="Hasta" style="width: 90px; float:left; margin-left: 8px;" />
    </div>
    
    <div style="float:left; width:7%;"> <span class="detalleDisposicion" >&nbsp;</span><br />
      <a href="#" onclick="javascript: if (validateForm('frmMeta|idTrama|txtActividad;R|txtInicioActividad;R|txtFinActividad;R')){generalJS('0','frmMeta|___sqlAjax.aspx|idTrama;txtActividad;txtInicioActividad;txtFinActividad|idIngresoActividad|GET|&amp;typ=9&tab=3');}" class="btn btn-success btn-sm" >Registrar</a> </div> <!-- generalJS('0','frmMeta|___sqlAjax.aspx|idTrama;idTrama|idProgramacion|GET|&typ=10');  -->
    <div id="idIngresoActividad" style="float:left; width:20%;"></div></td>
  </tr>
  <!--<tr>
    <td><br /><div style="background-color: #0165BE; height:3px; " ></div></td>
  </tr>-->
  <tr>
    <td><div id="idProgramacion"></div></td>
  </tr>
</table>
   
<%
break;
case 4:
%>
<%
break;
case 5:
%>

<%
break;

case 6: //Para el ingreso de   Analisis
idP0=Request.QueryString["p0"];  //Para el idTipo de Muestra
idP1=Request.QueryString["p1"];  //Para el idTipo de Muestra
idP2=Request.QueryString["p2"];  //Para el idTipo de Muestra
idP3=Request.QueryString["p3"];  //Para el idTipo de Muestra
idP4=Request.QueryString["p4"];  //Para el idTipo de Muestra
idP5=Request.QueryString["p5"];  //Para el idTipo de Muestra
idP6=Request.QueryString["p6"];  //Para el idTipo de Muestra
idP7=Request.QueryString["p7"];  //Para el idTipo de Muestra

fecha = idP1.Split('/');
fecha1 = idP2.Split('/');
//manejo de clase de datos y consulta mediante stored procedure
//Este script se encarga de ingresar una nueva muestra de analisis

        try
          { 
			  //Para el ingreso de parametros de muestras
			 dbManager.Open();
				
			strSQL = "spProcesos  "+idP0+",'"+fecha[0]+fecha[1]+fecha[2]+"','"+fecha1[0]+fecha1[1]+fecha1[2]+"','"+idP3+"',"+idP4.Replace(',','.')+",'"+idP5+"','"+idP6+"','"+idP7+"','"+Session["sysNombreUsuario"].ToString()+"','A',1";
			 	//Response.Write(strSQL);	   
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
case 7: //Para el ingreso de   Analisis
idP0=Request.QueryString["p0"];  // Estado de la disposicion
idP1=Request.QueryString["p1"];  // Tipo de disposicion
idP2=Request.QueryString["p2"];  // Naturaleza de la disposicion
idP3=Request.QueryString["p3"];  // ID_Responsable
idP4=Request.QueryString["p4"]!="null" ?  "'" + Request.QueryString["p4"] + "'" : "null";  // ID_CoResponsable
idP5=Request.QueryString["p5"]!="null" ?  "'" + Request.QueryString["p5"] + "'" : "null";  // ID_Asociado
idP6=Request.QueryString["p6"];  // Nombre de la disposicion
idP7=Request.QueryString["p7"];  // Detalle de la disposicion
idP8=Request.QueryString["p8"];  // Fecha Inicio
idP9=Request.QueryString["p9"];  // Fecha Fin
idP10=Request.QueryString["p10"];  // ID_analista
idP11=Request.QueryString["p11"]!="null" ?  "'" + Request.QueryString["p11"] + "'" : "null";  // Antecedentes
idP12=Request.QueryString["p12"]!="null" ?  "'" + Request.QueryString["p12"] + "'" : "null";  // Observaciones
idP13=Request.QueryString["p13"];  // Progreso
idP15=Request.QueryString["p14"]; //id_plantilla

fecha = idP8.Split('/');

          if (idP9!="null"){ //Para controlar si ingresa o Nó la fecha final
			 fecha1 = idP9.Split('/'); //  fecha fin
			  idP14 = "'"+fecha1[2]+"/"+fecha1[1]+"/"+fecha1[0]+"'";
		   }else{
		     idP14 = idP9;
		   }
//manejo de clase de datos y consulta mediante stored procedure
//Este script se encarga de ingresar una nueva muestra de analisis
        try
          { 
			 //Para el ingreso de parametros de muestras
			 dbManager.Open();
				
			idP6=idP6.Replace("#","No."); //Reemplazar # por No. en nombre
			idP7=idP7.Replace("#","No."); //Reemplazar # por No. en detalle
			idP11=idP11.Replace("#","No."); //Reemplazar # por No. en antecedentes
			idP12=idP12.Replace("#","No."); //Reemplazar # por No. en observaciones

			strSQL = "SP_DISPOSICIONES  4,"+Session["sysIdTipoRrhh"]+","+Session["sysIdPlanta"].ToString()+",'A',null,null,"+idP0+","+idP1+","+idP2+","+idP3+","+idP4+","+idP5+",null,null,'"+idP6.Replace(',',';')+"','"+idP7.Replace(',',';')+"','"+fecha[2]+fecha[1]+fecha[0]+"',"+idP14+","+idP10+","+idP11.Replace(',',';')+","+idP12.Replace(',',';')+","+idP13+","+Session["sysIdRrhh"].ToString()+",null,null,"+ Session["sysIdRrhhAsociado"] +","+idP15+"";
			 //Response.Write(strSQL);	   
			 sec = (int)(dbManager.ExecuteScalar(CommandType.Text,strSQL));	
		         if (sec >0){ //Solo si hay ID_DISPOSICION INGRESADO
			 //CUERPO DEL CORREO
			 strSQL = "Exec spIterar 3, "+sec+"";
			 dbManager.ExecuteReader(CommandType.Text,strSQL);
			   idP16=""; idP17="";idP18="";	 idP19="";idP20="";idP21="";idP22="";	  
			   while(dbManager.DataReader.Read())
			    {
			      		idP16 +="<div style='font-family:Arial, Helvetica, sans-serif; font-size: 12px; width:90%; padding: 10px; border: solid 1px #999999;border-radius: 7px 7px 7px 7px;'>";
						idP16 += "<br /><span style='width:26px; height:26px;border-radius:13px; background:#0033CC; float:left;margin-bottom:2px; margin-right: 10px;' ></span><strong>Estimado/a</strong>: "+dbManager.DataReader["apellidos"].ToString()+", el sistema SIGES le informa que tiene una <strong>Nueva DISPOSICI&Oacute;N</strong> del Sr. Alcalde<br /><hr>";
						idP16 += "<br /><span style='color:#000099'><strong>Disposici&oacute;n ("+sec.ToString()+") </strong></span><br />"+dbManager.DataReader["disposicion"].ToString()+"<br /><br />";
						idP16 += "<span style='color:#000099'><strong>Detalle:</strong></span><br />"+dbManager.DataReader["detalle"].ToString()+"";
						idP16 += "<p><span style='color:#000099'><strong>Fecha Inicial:</strong></span> "+ dbManager.DataReader["fechaInicio"].ToString() +"</p>";
						idP16 += "<p>Por favor a la brevedad posible revise el sistema y contin&uacute;e con el proceso<br />Saludos cordiales,</p><p><strong>Administradores <br>SIGES</strong></p><p>Por favor no responda este correo, es solamente informativo.</p></div>";
						idP17=dbManager.DataReader["emailDelegados"].ToString();
						idP18=dbManager.DataReader["emailResponsable"].ToString();
                                                idP19=dbManager.DataReader["emailAnalista"].ToString(); //"siges.mimg@gmail.com,sbauz@hotmail.com"
                                                idP20=dbManager.DataReader["id_estadoDisposicion"].ToString();
						idP21=dbManager.DataReader["id_categoriaDisposicion"].ToString();
						idP22=dbManager.DataReader["id_plantilla"].ToString();
				 }
				 
			   //ENVIO DE CORREO 
			  if ( (idP22!="8")  ||  (idP21=="4" && idP22=="8" && idP20=="4") ){
                                MailMessage mail = new MailMessage();
				mail.From = new MailAddress("notificaciones@i-solutions.com.ec");
				mail.To.Add(idP18);
				
                                if (idP17!=""){ mail.CC.Add(idP17+","+idP19); }else{mail.CC.Add(idP19);}				
                                mail.Subject = "Tienes una Nueva DISPOSICION";
				mail.Body = idP16;
				SmtpClient smtp = new SmtpClient("mail.i-solutions.com.ec",26);
				smtp.Credentials = new System.Net.NetworkCredential("notificaciones@i-solutions.com.ec", "Doom5452@@"); 
				mail.IsBodyHtml = true;					
				smtp.Send(mail);				
			 }//end Sea cadena No es Nuevo ni cumplido y tampoco es cadena electrico
					
		   }//end existe una disposicion				 
			
             }catch (Exception ex){Response.Write(ex.Message.ToString());}              
              finally {dbManager.Dispose();}
	
break;

case 8: //Para el ingreso de   Analisis
idP0=Request.QueryString["p0"];  //Para el idTipo de Muestra

       /* try
          { 
			  //Para el ingreso de parametros de muestras
			 dbManager.Open(); */
				
				
				
			//strSQL = "spProcesos  "+idP0+",'"+fecha[0]+fecha[1]+fecha[2]+"','"+fecha1[0]+fecha1[1]+fecha1[2]+"','"+idP3+"',"+idP4.Replace(',','.')+",'"+idP5+"','"+idP6+"','"+idP7+"','"+Session["sysNombreUsuario"].ToString()+"','A',1";
			 	//Response.Write(strSQL);	   
			  //dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 
//			 
			
          /*   }
             catch (Exception ex)
             {
                 Response.Write(ex.Message.ToString());  
             }
              
             finally
             {
               
			   dbManager.Dispose();
             } */
	
                





break;


case 9: //Para el ingreso de   Analisis
idP0=Request.QueryString["p0"];  // id_disposicion
idP1=Request.QueryString["p1"];  // Actividad
idP2=Request.QueryString["p2"];  // fechaInicio
idP3=Request.QueryString["p3"];  // fechaFin



fecha = idP2.Split('/');
fecha1 = idP3.Split('/');
//manejo de clase de datos y consulta mediante stored procedure
//Este script se encarga de ingresar una nueva muestra de analisis

        try
          { 
			 //Para el ingreso de parametros de muestras
			 dbManager.Open();
				
			strSQL = "SP_DISPOSICIONES  7,null,null,'A',null,"+idP0+",null,null,null,"+Session["sysIdRrhh"]+",null,null,null,null,null,'"+idP1.Replace(',',';')+"','"+fecha[2]+fecha[1]+fecha[0]+"','"+fecha1[2]+fecha1[1]+fecha1[0]+"',null,null,null,null,"+Session["sysIdRrhh"].ToString()+",null,null";
			 //Response.Write(strSQL);	   
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


case 10:

idP0=Request.QueryString["id"];  //
idP1=""; secuencial=0; idP2="";
sec=0;	
/*if (idP0!="null"){
fecha = idP0.Split('/');
strFecha = "'"+fecha[0]+fecha[1]+fecha[2]+"'";
}else{
strFecha="null";
}

idP1 = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "null";
*/
%>
<br>
<div style='width: 100%; height:350px; overflow:auto;'>
<% 
       try  {  
   			dbManager.Open();
			strSQL = "SP_DISPOSICIONES 8,"+Session["sysEdicion"].ToString()+",null,'A',null,"+idP0+",null,null,null,"+Session["sysIdRrhh"].ToString()+"";
		    
			//Response.Write(strSQL);
			//Response.End();
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 
	 while(dbManager.DataReader.Read()) {
	 //Para controlar algun registro por confirmar
	 if (dbManager.DataReader["estadoProgramacion"].ToString()=="") secuencial ++; 
	 
	 if (sec < 1){
	 idP1 = dbManager.DataReader["estadoProgramacion"].ToString();
	 	 
	 %>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>

   
    <td width="47" valign="bottom"> <div style="float:left; width: 40px;" >
      <div align="center">
        <% 	//if ((idP1=="" && Session["sysEdicion"].ToString()=="0") || (Session["sysEdicion"].ToString()=="1")) { %>
          <a href="#" class="link"  onclick="javascript: abrirVentanaPrint('___sqlReport.aspx?typ=3&id=<%=idP0%>&t=Cronograma de Trabajo','hijo54321','status=yes,width='+ (screen.width-50) +',height='+ (screen.height-100) +'');">&nbsp; <img src="../___Images/imprimirReport.gif" width="31" height="21" /></a></div>
    </div>
    <% //}	%></td>
    <td width="745" valign="bottom"><div style="float:left; width: 50px;" >    
      <a href="___sqlReport.aspx?typ=3&id=<%=idP0%>&t=Cronograma de Trabajo&print=True;" class="btn btn-info btn-xs">Excel</a>
    </div></td>
    <% if (Session["sysEdicion"].ToString()=="1"){%>
    <td width="508">
    <div style="float:left; width:30%;"> <span class="detalleDisposicion" >Estado:</span><br />
      <select name="cmbAccion" id="cmbAccion" class="cajaFormulario">
        <option selected="selected" value="">Seleccione</option>
        <option value="Aproba.">Definir</option>
        <option value="Edita">Definir Editados</option>
        <option value="Rechaz.">Rechazar</option>
        
          </select>
    </div>
    
    
    <div style="float:left; width:50%;"> <span class="detalleDisposicion" >Observacion:</span><br />
        <input name="txtAccionObservacion" type="text" class="cajaFormulario" id="txtAccionObservacion" size="10"  value="" />
    </div>
    <div style="float:left; width:20%;"> <span class="detalleDisposicion" >&nbsp;</span><br />
      <a href="#" onclick="javascript: if (confirm('Esta Seguro de Aprobar/rechazar el Cronograma?')){ if (validateForm('frmMeta|idTrama;R|cmbAccion;R|txtAccionObservacion;B')){generalJS('0','frmMeta|___sqlAjax.aspx|idTrama;cmbAccion;txtAccionObservacion|idConfirmar|GET|&typ=13&tab=3');}}" class="btn btn-primary btn-sm">Ejecutar</a> </div>
    </td> <!--if (confirm('Esta Seguro de Aprobar/rechazar el Cronograma?')){ -->
    <%}%>
    
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0"  >
  <tr class="tituloGrid" >
    <td width="2%" class="colorGrid" ><div align="center">
      <input type="checkbox" id="chk_All" name="chk_All"  onclick="javascript: habilitar_Asistencia('frmMeta','chk_All');"  />
    </div></td>
    <td width="3%" height="25" class="colorGrid"  ><div align="center">No.</div></td>
    <td width="51%" class="colorGrid" ><div align="center">Actividad</div></td>
    <td width="11%" class="colorGrid" ><div align="left">Fecha Inicio</div></td>
    <td width="11%" class="colorGrid" ><div align="left">Fecha Fin</div></td>
    <!--<td width="8%" bgcolor="#38A0FE" ><div align="left">Responsables</div></td>-->
    <td width="7%" class="colorGrid" ><div align="left">Estado</div></td>
    <!--<td width="8%" bgcolor="#38A0FE" ><div align="center">Obs.</div></td>-->
    <td width="15%" class="colorGrid" >&nbsp;</td>
  </tr>
	 <%
    	}
			//Response.Write("|"+dbManager.DataReader["estadoProgramacion"].ToString()+"|");
			switch (dbManager.DataReader["estadoProgramacion"].ToString()){
	 case "":
	 idP1="style='color:#FFFF99'";
	 idP2="style='background-color:#FFFFFF'";
	 break;	 
	 case "Confir.":
	 idP1="style='color:#000000'";
     idP2="style='background-color:#FFFFEC;'";
	 break;
	 case "Aproba." :
	 idP1="style='color:#0033FF; '";
     idP2="style='background-color:#F4F4FF; '";
	 break;
	 case "Terminado" :
	 idP1="style='color:#0033FF'";
     idP2="style='background-color:#D0E64B'";
	 break;
	 case "Rechaz.":
	 idP1="style='color:#FB0032'";
     idP2="style='background-color:#FFE9E8'";
	 break;
	 case "Edita":
	 idP1="style='color:#FB0032'";
     idP2="style='background-color:#C1FF64'";
	 break;
	 
	 }
	 

			
				       
				sec++;
				
				/*if ((sec % 2)==0){
				  bgColor="#F0F0FF";
				}else{
				   bgColor="#ffffff";				  
			    } */
		%>

 
  <tr class='detalleDisposicion'  <%=idP2%>  >
    <td valign="middle" height="27"  ><div align="center"> <input type="checkbox" id="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>" name="chk_<%=dbManager.DataReader["id"].ToString()%>_<%=sec%>"  value="<%=dbManager.DataReader["id"].ToString()%>"  /></div></td>
    <td  valign="middle"  ><div align="center"><%=sec%></div></td>
    <td valign="middle" >
    <% if (dbManager.DataReader["categoriaDisposicion"].ToString()!="4") {%>
    <input name="txtDetAct<%=dbManager.DataReader["id"].ToString()%>" type="text" class="cajaFormulario"  id="txtDetAct<%=dbManager.DataReader["id"].ToString()%>"  value="<%=dbManager.DataReader["detalle"].ToString()%>" onclick="javascript: this.style.backgroundColor='#FFFF33';" title="Responsable: <%=dbManager.DataReader["responsables"].ToString()%>" <%=idP2%>  />
    <%}else{%>
    <span title="Responsable: <%=dbManager.DataReader["responsables"].ToString()%>"><%=dbManager.DataReader["detalle"].ToString()%></span>
	<%}%>
    </td>
    <td valign="middle"  ><input name="txtFecIni<%=dbManager.DataReader["id"].ToString()%>" type="text" class="cajaFormulario"  id="txtFecIni<%=dbManager.DataReader["id"].ToString()%>" onkeypress="return soloNumeros(event)" onkeyup="javascript: mascara(this,'/',patron,true);"  size="8"  value="<%=dbManager.DataReader["fechaInicio"].ToString()%>" onclick="javascript: calenJquery('txtFecIni<%=dbManager.DataReader["id"].ToString()%>'); this.style.backgroundColor='#FFFF33'; this.style.width='85px';this.style.float='left';" <%=idP2%>   /></td>
    <td valign="middle"  >
    <% if (dbManager.DataReader["categoriaDisposicion"].ToString()!="4") {%>
    <input name="txtFecFin<%=dbManager.DataReader["id"].ToString()%>" type="text" class="cajaFormulario"  id="txtFecFin<%=dbManager.DataReader["id"].ToString()%>" onkeypress="return soloNumeros(event)" onkeyup="javascript: mascara(this,'/',patron,true);"  size="8"  value="<%=dbManager.DataReader["fechaFinal"].ToString()%>" onclick="javascript: calenJquery('txtFecFin<%=dbManager.DataReader["id"].ToString()%>'); this.style.backgroundColor='#FFFF33'; this.style.width='85px';this.style.float='left';" <%=idP2%>  />
    <%}else{%>
    <%=dbManager.DataReader["fechaFinal"].ToString()%>
	<%}%>
    </td>
    <!--<td valign="top"  bgcolor="<%//=bgColor%>" align="left" ><a href="#"  style="font-family:Arial, Helvetica, sans-serif;color:#0033FF; text-decoration: none"  > <%
	 //Response.Write(dbManager.DataReader["responsables"].ToString().Length > 10 ? dbManager.DataReader["responsables"].ToString().Substring(0,10) : "");
	 %></a></td>-->
    <td valign="middle"    <%=(dbManager.DataReader["estadoEjecucion"].ToString()=="Terminado" ? idP1 : "")%> align="left" ><%=dbManager.DataReader["estadoEjecucion"].ToString()%></td>
    <!--<td valign="top"  >
     <a href="#" class="tooltip"  style="font-family:Arial, Helvetica, sans-serif; color:#666666; text-decoration: none;" >
     <%
	 //Response.Write(dbManager.DataReader["observaciones"].ToString().Length > 12 ? dbManager.DataReader["observaciones"].ToString().Substring(0,12) : "");
	 %><span ><%//=dbManager.DataReader["observaciones"].ToString()%></span></a>    </td>-->
    
     
    <td valign="middle"  >
	
   
    
    <!--<div class='modal fade' id='validador' tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel' aria-hidden='true'><div class='modal-dialog' id='modalValidador'><div class='modal-content' id='contenidoValidador'><div class='modal-header' id='headerValidador' ><button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
        <div id='idValidador' style="height:350px;" ></div></div></div></div></div>-->
    
    <div style="float: left; width: 36%">
    <a href="#"  
     <% if (dbManager.DataReader["categoriaDisposicion"].ToString()!="4") {%>
     onclick="javascript: if (validateForm('frmMeta|txtDetAct<%=dbManager.DataReader["id"].ToString()%>;R|txtFecIni<%=dbManager.DataReader["id"].ToString()%>;R|txtFecFin<%=dbManager.DataReader["id"].ToString()%>;R')){generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;txtFecIni<%=dbManager.DataReader["id"].ToString()%>;txtFecFin<%=dbManager.DataReader["id"].ToString()%>;txtDetAct<%=dbManager.DataReader["id"].ToString()%>|idProgramacion|GET|&id=<%=dbManager.DataReader["id"].ToString()%>&typ=11&idCat=<%=dbManager.DataReader["categoriaDisposicion"].ToString()%>&ord=<%=dbManager.DataReader["orden"].ToString()%>&tab=3');}" 
      <%}else{%>
    onclick="javascript: if (validateForm('frmMeta|txtFecIni<%=dbManager.DataReader["id"].ToString()%>;R')){generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;txtFecIni<%=dbManager.DataReader["id"].ToString()%>;idTemp;idTemp|idProgramacion|GET|&id=<%=dbManager.DataReader["id"].ToString()%>&typ=11&idCat=<%=dbManager.DataReader["categoriaDisposicion"].ToString()%>&ord=<%=dbManager.DataReader["orden"].ToString()%>&tab=3');}" 
	<%}%>    
     class="btn btn-primary btn-xs <%
	    
		Response.Write( (Session["sysEdicion"].ToString()=="0"  &&  (dbManager.DataReader["estadoProgramacion"].ToString()=="Aproba." || dbManager.DataReader["estadoProgramacion"].ToString()=="Confir." )) ? "disabled" : "" );
		
		 %>">
    
    Grabar
    
    </a>
    </div>
    
    
    <div style="float: left; width: 40%">    
        
          <%//}%>
          
<% 
	
	
	if ((dbManager.DataReader["categoriaDisposicion"].ToString()=="4" && dbManager.DataReader["estadoProgramacion"].ToString()=="Aproba." && dbManager.DataReader["id_direccion"].ToString()!="" && Session["sysEdicion"].ToString()=="0") || (dbManager.DataReader["categoriaDisposicion"].ToString()!="4" && dbManager.DataReader["estadoProgramacion"].ToString()=="Aproba." && Session["sysEdicion"].ToString()=="0") || ( Session["sysEdicion"].ToString()=="1" )) {
	
	if (dbManager.DataReader["estadoEjecucion"].ToString()!="Terminado"){
	
	%>
              <a href="#" class='btn btn-success btn-xs <%
	    
		Response.Write( (Session["sysEdicion"].ToString()=="0"  &&  dbManager.DataReader["estadoEjecucion"].ToString()=="") ? "disabled" : "" );
		
		 %>'  onclick="javascript: if (confirm('Esta Terminada la Actividad?')){ generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;idTemp|idConfirmar|GET|&id=<%=dbManager.DataReader["id"].ToString()%>&typ=14');}">Cumpllir</a>
          
          <%}else{ %>
            <img src="../___Images/estado_ok.gif" />
          <%
	  }
	}
	%>
     
    </div>
  
  <%  if ( Session["sysEdicion"].ToString()=="1" ) { %>
  <div style="float: left; width: 24%;">    
       
          <%//}%>
          
          
              <a href="#" class='btn btn-success btn-xs <%
	    
		Response.Write( (Session["sysEdicion"].ToString()=="0"  &&  dbManager.DataReader["estadoEjecucion"].ToString()=="") ? "disabled" : "" );
		
		 %>'  onclick="javascript: if (confirm('Esta Terminada la Actividad?')){ generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;idTemp|idConfirmar|GET|&typ=24&id=<%=dbManager.DataReader["id"].ToString()%>&tab=E');}">Rev.</a>
          
         
                    
       
    </div>   
    <% } %>
    
     </td>
    </tr>
  <%}
   }catch (Exception ex){
                 Response.Write(ex.Message.ToString()); // + "<a href='../___Interface/___destroyApp.aspx?p=true'> Por favor hacer click para volver al Menu </a>");  
          
             }finally{
               dbManager.Dispose();
             }
  %>
</table>
<br>
<%
try {

 if (sec>0){
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td >
  
  <div style="float:left; width: 50px;" >
    <div align="center">
      <% 	//if ((idP1=="" && Session["sysEdicion"].ToString()=="0") || (Session["sysEdicion"].ToString()=="1")) { %>
      <a href="#" onclick="javascript: leerEtiquetas('frmMeta|___sqlAjax.aspx|idTrama;idTrama|GET|&typ=16&tab=3|idConfirmar');" class="btn btn-warning btn-sm">X</a></div>
     <% //}	%> 
     </div>
     <div style="float:left; width: 50px;" >
      <% if (Session["sysEdicion"].ToString()=="1") { 	//if ((idP1=="" && Session["sysEdicion"].ToString()=="0") || (Session["sysEdicion"].ToString()=="1")) { %>
      <a href="#" onclick="javascript: leerEtiquetas('frmMeta|___sqlAjax.aspx|idTrama;idTrama|GET|&typ=27&tab=3|idConfirmar');" class="btn btn-info btn-sm">Activar</a>
      </div>
     <% }	%> 
     </div>
    
    
    <% 
	 
		//if ((idP1=="" && Session["sysEdicion"].ToString()=="0") || (Session["sysEdicion"].ToString()=="1")) { %>
    <div style="float:left; width: 70px;" >
      <% if (secuencial > 0){ %>
      <div align="center"><a href="#" onclick="javascript: if (confirm('Esta Seguro de Confirmar el Cronograma?')){generalJS('0','frmMeta|___sqlAjax.aspx|idTrama;idTrama|idConfirmar|GET|&typ=12&e=Confir.&tab=3');}" class="btn btn-success btn-sm">Confirmar</a></div>
      <% } %>
    </div> 
    
    <div style="float:left; width: 70%;" id="idConfirmar" ></div>
    <% //}	%>
    
   
  </td></tr>
</table>
<%
  } // fin Sec

}catch (Exception ex){
        Response.Write(ex.Message.ToString());  
		
       }   
%>
</div>


<%
break;

case 12: //Para el ingreso de   Analisis
idP0=Request.QueryString["p0"];  //ID disposicion
idP2=Request.QueryString["e"];  //C = Confirmado

        try
         { 
			  //Para el ingreso de parametros de muestras
			 dbManager.Open();
		
			strSQL = "SP_DISPOSICIONES 9,"+Session["sysEdicion"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A','"+idP2+"',"+idP0+",null,null,null,"+Session["sysIdRrhh"].ToString()+",null,null,'R','A','Cronograma Ingresado','"+Session["sysIdRrhh"].ToString()+"'";
			 
			 	//Response.Write(strSQL);	   
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

case 13: //Para Aprobar / Rechazar el cronograma
idP0=Request.QueryString["p0"];  //ID disposicion
idP1=Request.QueryString["p1"];  // Aproba. / Rechaz.
idP2= Request.QueryString["p2"]!="null" ? "'" + Request.QueryString["p2"]+"'" : "null"; //Observacion
idP3="";

switch(idP1){
case "Aproba.":
idP3="Cronograma Aprobado";
break;
case "Rechaz.":
idP3="Cronograma Rechazado";
break;
case "Edita":
idP3="Cronograma Editado";
break;

}

        try
         { 
			  //Para el ingreso de parametros de muestras
			 dbManager.Open();
		
			strSQL = "SP_DISPOSICIONES 9,"+Session["sysIdTipoRrhh"]+","+Session["sysIdPlanta"].ToString()+",'A','"+idP1+"',"+idP0+",null,null,null,null,null,null,'N','A','"+idP3+"','"+Session["sysIdRrhh"].ToString()+"',null,null,"+Session["sysIdRrhh"].ToString()+",null,"+idP2.Replace(',',';')+"";
			
			 
			 	//Response.Write(strSQL);	   
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



case 14: 

       idP0=Request.QueryString["p0"];
	   idP1=Request.QueryString["p1"];
  	   idP2=Request.QueryString["p2"];   		
       idP3 = Request.QueryString["op"];   
	   idP4 = Request.QueryString["tE"];		
		try
         { 		  
		   //Para la consulta de anlisis
		  dbManager.Open();
          strSQL=" exec SP_DISPOSICIONES 3,"+ idP4 +",null,null,'"+idP0+"'";  
		  //if (idP3=="1") strSQL=" exec SP_DISPOSICIONES 3,"+ idP4 +",null,null,'"+idP0+"'";  
          //if (idP3=="2") strSQL=" exec SP_DISPOSICIONES 3,"+ idP4 +",null,null,'"+idP0+"'";  
		  //if (idP3=="2") strSQL="spProcesos null,null,null,null,null,null,null,null,null,null,7,"+idP0+","+Session["sysIdPlanta"].ToString()+","+Session["sysIdTipoRrhh"]+"";  
		  
		  //Response.Write(strSQL);	  
						  
		 dbManager.ExecuteReader(CommandType.Text,strSQL);
         //Response.Write(idP0+"|"+idP1+"|"+idP2+"|"+idP3);
		 	   
			   cuerpo="<table width='100%' border='0' cellpadding='0' cellspacing='0' >";//<div id='idRegistros' style='width: 150px; height:170px; overflow:auto;' onClick='javascript: idRegistros.parentNode.removeChild(idRegistros);'>";		   
			   while(dbManager.DataReader.Read())
			   {	
		          if (idP3=="1"){
				  cuerpo += "<tr ><td width='50%' class='columnasAutocompletado'><a href='#' onclick='javascript: objSel=document.getElementById(\""+idP1+"\"); objSel.value=\""+dbManager.DataReader[1].ToString()+"\"; objSel.style=\"background-color:#F0F0FF\"; var idSel=document.getElementById(\""+idP2+"\"); idSel.value=\""+dbManager.DataReader[0].ToString()+"\";'>" + dbManager.DataReader[1].ToString()+"</a></td><td width='50%' class='columnasAutocompletado'>"+dbManager.DataReader[2].ToString()+"</td></tr>";		  	
				}
				
				 if (idP3=="2"){
				  cuerpo += "<tr ><td width='50%' class='columnasAutocompletado' ><a href='#' onclick='javascript: objSel=document.getElementById(\""+idP1+"\"); objSel.value=\""+dbManager.DataReader[1].ToString()+"\"; objSel.style=\"background-color:#FFFF99\"; var idSel=document.getElementById(\""+idP2+"\"); idSel.value=\""+dbManager.DataReader[0].ToString()+"\"; objTex=document.getElementById(\"txtRespID\");  window.location=\"../___Transactions/___erpHome.aspx?j1=1&j0=\"+objTex.value; '>" + dbManager.DataReader[1].ToString()+"</a></td></tr>";		  	
				}
				
				 if (idP3=="3"){ //agregar a una lista
				  cuerpo += "<tr ><td width='50%' class='columnasAutocompletado'><a href='#' onclick='javascript: objSel=document.getElementById(\""+idP1+"\"); objSel.options[objSel.options.length]=new Option (\""+dbManager.DataReader[1].ToString()+"\",\""+dbManager.DataReader[0].ToString()+"\");  var idSel=document.getElementById(\""+idP2+"\");  var str =\"\"; for (var i=0; i<objSel.options.length; i++) {	str += objSel.options[i].value + \"|\";} idSel.value = str.substr(0,(str.length-1));'>" + dbManager.DataReader[1].ToString()+"</a></td><td width='50%' class='columnasAutocompletado'>"+dbManager.DataReader[2].ToString()+"</td></tr>";		  	
				}
								
				if (idP3=="4"){				
				 idP5 = Request.QueryString["dl"]; //los ID de los delegados
				 cuerpo += "<tr ><td width='50%' class='columnasAutocompletado'><a href='#' onclick='javascript: objSel=document.getElementById(\""+idP1+"\"); objSel.value=\""+dbManager.DataReader[1].ToString()+"\"; objSel.style=\"background-color:#F0F0FF\"; var idSel=document.getElementById(\""+idP2+"\"); idSel.value=\""+dbManager.DataReader[0].ToString()+"\"; generalJS(\"0\",\"frmMeta|___sqlAjax2.aspx|"+idP2+";"+idP2+"|idRegistroUsuario|GET|&typ=11&dl="+ idP5 +"\");' >" + dbManager.DataReader[1].ToString()+"</a></td><td width='50%' class='columnasAutocompletado'>"+dbManager.DataReader[2].ToString()+"</td></tr>";				
				
				}				
			}
				  				 
				cuerpo +="</table>";
				 Response.Write(cuerpo);	//"</div>"+		  
             }catch (Exception ex){
                 Response.Write(ex.Message.ToString());  
             }finally{
               dbManager.Dispose();
             }
break;

case 15: //Para el ingreso de   Analisis
idP0=Request.QueryString["p0"];  //ID disposicion
idP1=Request.QueryString["id"];  //C = Confirmado

        try
         { 
			  //Para el ingreso de parametros de muestras
			 dbManager.Open();
		
			strSQL = "update sg_notificaciones set estado = 'E' where id = "+idP1+"";
			 
			 //	Response.Write(strSQL);	   
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

case 16: //Para el ingreso de   Analisis
idP0=Request.QueryString["p0"];  //ID disposicion
idP1=Request.QueryString["mF"]!="null" ? Request.QueryString["mF"] : "null"; //Observacion

        try
         { 
			  //Para el ingreso de parametros de muestras
			 dbManager.Open();
		
			     strSQL = "exec spNotificaciones 10,null,null,null,"+idP0+",null,null,'"+idP1+"'";
				//Response.Write(strSQL);	   
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

case 17:
string id = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";
string idR = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";
%>
<iframe id="idDatos" scrolling="no" width="100%" height="50px" src="../___Import/___upload.aspx?id=<%=id%>&amp;idR=<%=id%>" style="border: 0px solid #cccccc;"  ></iframe>

<div id="idRespArchivos"></div>

<%
break;

case 18: // Para consulta de disposiciones por Nombre
 
 try{ //
 idP0=Request.QueryString["id"];  //ID_disposicion
 idP1=Request.QueryString["tab"];  //tabulador       
			  
			 dbManager.Open();		
			 strSQL = "exec spNotificaciones 1, null,"+Session["sysEdicion"].ToString()+",'A',"+idP0+","+Session["sysIdPlanta"].ToString()+","+idP1+"";			 
			
			 //Response.Write(strSQL);	   
			//Response.End();
			 dbManager.ExecuteReader(CommandType.Text,strSQL);
			
			sec=0;	idP1="";
  
	 while(dbManager.DataReader.Read()) {
						
			 if (sec < 1){
			%>
<br />
        <div align="left" style="float: 30%;"><a href="#" class="link"  onclick="javascript: abrirVentanaPrint('___sqlReport.aspx?typ=0&id=<%=idP0%>&t=Reporte Disposicion Pre-Contractual','hijo54321','status=yes,width='+ (screen.width-50) +',height='+ (screen.height-100) +'');">&nbsp; <img src="../___Images/imprimirReport.gif" width="31" height="21" /></a></div><div align="left" style="float: 70%;" id="idElimReporte"></div>
                              
<table width="100%" border="0" cellpadding="0" cellspacing="1"  >
<tr class="tituloGrid" >
                <td width="15%" height="25" class="colorGrid" ><div align="center">Fecha</div></td>
                <td width="35%" class="colorGrid" ><div align="center">Acci&oacute;n</div></td>
                <td width="22%" class="colorGrid"><div align="center">Usuario</div></td>
                <td width="9%" class="colorGrid" ><div align="center">Tipo</div></td>
                <td width="15%" class="colorGrid" align="center" >
                  Observaci&oacute;n               </td>
                <td width="4%" class="colorGrid" >&nbsp;</td>
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
                <td  bgcolor="<%=bgColor%>" height="25" valign="top">&nbsp;<%=dbManager.DataReader["fecha"].ToString()%></td>
                <td bgcolor="<%=bgColor%>"  valign="top"><%=dbManager.DataReader["accion"].ToString()%></td>
                <td  bgcolor="<%=bgColor%>" valign="top"><%=dbManager.DataReader["rrhh"].ToString()%></td>
                <td  bgcolor="<%=bgColor%>" valign="top"><div align="center"><%=dbManager.DataReader["tipo_rrhh"].ToString()%></div></td>
                <td  bgcolor="<%=bgColor%>" valign="top"><% Response.Write(dbManager.DataReader["observacion"].ToString());
/*Response.Write(dbManager.DataReader["observacion"].ToString()!="" ? "<strong>"+dbManager.DataReader["observacion"].ToString()+"</strong>"+" Por: <br> "+dbManager.DataReader["usuario"].ToString()+": "+ dbManager.DataReader["fechaSimple"].ToString(): "");*/

%>			</td>
                <td  bgcolor="<%=bgColor%>" align="center" valign="top">
                 <input type="hidden" name="txtIdReporte<%=sec%>" id="txtIdReporte<%=sec%>"  value="<%=dbManager.DataReader["idReporte"].ToString()%>" /><a href="#" class='btn btn-danger btn-xs'  onclick="javascript: if (confirm('Esta Seguro de Eliminar el Reporte?')){ generalJS('0','frmMeta|___sqlAjax2.aspx|txtIdReporte<%=sec%>;idTrama|idElimReporte|GET|&tip=<%=dbManager.DataReader["tipo_texto"].ToString()%>&typ=12&tab=2');}">
                 
                 X</a> </td>
              </tr>
              <%} %>
              <tr>
               <td  style="border-radius: 0px 0px 0px 10px;">&nbsp;</td>
               <td  ></td>
               <td  >&nbsp;</td>
               <td  >&nbsp;</td>
               <td  >&nbsp;</td>
               <td  >&nbsp;</td>
              </tr>
            </table>
<% 			
         }catch (Exception ex){ Response.Write(ex.Message.ToString());}
          finally{dbManager.Dispose();}	             
break;


case 19:
idP0=Request.QueryString["p0"];  //


try  {       
   			dbManager.Open();
			strSQL = "exec spProcesos "+idP0+",null,null,null,null,null,null,null,null,null,8,null,null,null";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;		 

     while(dbManager.DataReader.Read())
			   {			       
				sec++;
				
				if (sec<2){
				%>
                 
			
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="detalleDisposicion" align="center"><strong>PRONACA Planta <%=(Session["sysPLANTA"]+" "+Session["sysLABORATORIO"])%></strong></td>
  </tr>
  <tr>
    <td class="detalleDisposicion" align="center"><strong>Bodega Materia Prima y Producto Terminado</strong></td>
  </tr>
  <tr>
    <td><div align="center">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="20%" align="left" class="detalleDisposicion">Usuario: <%=(Session["sysNombreUsuario"]+" "+Session["sysLABORATORIO"])%></td>
          <td width="43%" align="center" class="detalleDisposicion"><strong>Reporte Almacenaje </strong></td>
          <td width="30%" align="right" class="detalleDisposicion">Fecha: 
            <%
		  Response.Write(DateTime.Now.ToString());%></td>
        </tr>
      </table>
      </div></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  >
  <tr class="titulo" >
    <td width="11%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" height="30" align="center" ><strong>Fecha</strong></td>
    <td width="12%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Ubicaci&oacute;n</strong></td>
    <td width="11%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Lote</strong></td>
    <td width="10%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>C&oacute;digo</strong></td>
    <td width="34%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Descripci&oacute;n</strong></td>
    <td width="6%"  style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Cant.</strong></td>
    <td width="6%"  style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Desp.</strong></td>
    <td width="10%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Obs.</strong></td>
  </tr>	<%
           }
  
                if ((sec % 2)==0){
				  bgColor="#f1f1f1";
				}else{
				   bgColor="#ffffff";				  
			    } 
		%>
 
  <tr class="detalleDisposicion" >
    <td   height="25" style="border-bottom: 1px solid #f1f1f1;"><div align="center"><%=dbManager.DataReader["fecha"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="center"><%=dbManager.DataReader["ubicacion"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="center"><%=dbManager.DataReader["lote"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="center"><%=dbManager.DataReader["codigo"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><%=dbManager.DataReader["descripcion"].ToString()%></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="center"><%=dbManager.DataReader["cantidad"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="center"></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="center"></div></td>
  </tr>
  <%}
   }catch (Exception ex){
                 Response.Write(ex.Message.ToString());  
             }finally{
               dbManager.Dispose();
             }
  %>
</table>

<%
break;


case 20: //Para las especificaciones en los parametros de los analisis
//Declaracion de Variables
idP0=Session["sysIdTipoRrhh"]!=null? (string)Session["sysIdTipoRrhh"] : null;
idP1=Session["sysIdTipoRrhh"]!=null? (string)Session["sysIdPlanta"] : null;


//manejo de clase de datos y consulta mediante stored procedure
//Este script se encarga de generar las variables de sesion y autenticacion de usuario

         try
          { 
			 
			
			   dbManager.Open();
               strSQL = "SP_DISPOSICIONES null,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',null,"+Session["sysEdicion"].ToString()+",null,null,null,"+Session["sysIdRrhh"].ToString()+",null,null,'R' ";
			   
			  // Response.Write(strSQL);
			   
			   strSQL = "spReportes null";
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
                 
              cuerpo="</br><p></p><table width='55%' border='0' cellspacing='0' cellpadding='0' align='center' class='tablaResumen'><tr><td width='5%' align='center' ></td><td  class='numeroDisposicion' height='25' width='40%'>&nbsp;Estado de Disposiciones</td><td  class='numeroDisposicion' width='10%'>Total</td></tr>";
			   
			   idP2="";
			   while(dbManager.DataReader.Read())
			   {			       
				 secuencial += double.Parse(dbManager.DataReader["N"].ToString());
				 
				  tipo = int.Parse(dbManager.DataReader["id"].ToString());
				 switch (tipo){
					case 2: //Nuevos
					idP2="style='width:14px;height:14px;border-radius:7px;background:#0033CC;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 4: //Detenidos
					idP2="style='width:14px;height:14px;border-radius:7px;background:#CC0000;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 11: //Incumpplidos
					idP2="style='width:14px;height:14px;border-radius:7px;background:#FF6600;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 7: //atrasados
					idP2="style='width:14px;height:14px;border-radius:7px;background:#FFCC00;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 15: //Sin reporte
					idP2="style='width:14px;height:14px;border-radius:7px;background:#FF6E8B;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 5: //En ejecucion
					idP2="style='width:14px;height:14px;border-radius:7px;background:#009900;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 8: //En validacion
					idP2="style='width:14px;height:14px;border-radius:7px;background:#59FFFF;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 9: //En espera
					idP2="style='width:14px;height:14px;border-radius:7px;background:#9C9CFF;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					
					}

                  cuerpo +="<tr bgcolor='#ffffff'><td align='center' ><div "+ idP2 +"  ></div></td><td align='left' height='25' >&nbsp;"+ dbManager.DataReader["nombre"].ToString() +"</td><td align='center' >"+ dbManager.DataReader["N"].ToString() +"</td></tr>";
				  	
				}
				
				cuerpo +="<tr  ><td ></td><td height='25'  class='numeroDisposicion'>&nbsp;&nbsp;Total General</td><td align='center'  class='numeroDisposicion'>"+ secuencial.ToString() +"</td></tr></table><br>";
				
				
				 Response.Write(cuerpo);
				 
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


case 21: //Para las especificaciones en los parametros de los analisis
//Declaracion de Variables
idP0=Session["sysIdTipoRrhh"]!=null? (string)Session["sysIdTipoRrhh"] : null;
idP1=Session["sysIdTipoRrhh"]!=null? (string)Session["sysIdPlanta"] : null;


//manejo de clase de datos y consulta mediante stored procedure
//Este script se encarga de generar las variables de sesion y autenticacion de usuario

         try
          { 
			 
			
			   dbManager.Open();
               strSQL = "SP_DISPOSICIONES null,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',null,"+Session["sysEdicion"].ToString()+",null,null,null,"+Session["sysIdRrhh"].ToString()+",null,null,'R' ";
			   
			  // Response.Write(strSQL);
			   
			   strSQL = "spReportes 1";
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
                 
              cuerpo="</br><p></p><table width='100%' border='0' cellspacing='0' cellpadding='0' align='center' class='tablaResumen'><tr><td   height='25' width='30%'>&nbsp;Disposiciones</td><td  width='50%'>Responsable</td><td  width='20%'>fecha Fin</td><td  width='20%'>Dias Atraso</td></tr>";
			   
			   idP2="";
			   while(dbManager.DataReader.Read())
			   {			       
				 secuencial = double.Parse(dbManager.DataReader["proDias"].ToString());
				 
				  tipo = int.Parse(dbManager.DataReader["id_disposicion"].ToString());
				 
                  cuerpo +="<tr bgcolor='#ffffff'><td align='left' height='25' >&nbsp;"+ dbManager.DataReader["disposicion"].ToString() +"</td><td align='center' >"+ dbManager.DataReader["responsable"].ToString() +"</td><td align='center' >"+ dbManager.DataReader["fechaFin"].ToString() +"</td><td align='center' >"+ dbManager.DataReader["diasAtraso"].ToString() +"</td></tr>";
				  	
				}
				
				cuerpo +="<tr  ><td ></td><td height='25'></td><td align='center' >Promedio General: </td><td align='center' ><strong>"+ secuencial.ToString() +"</strong></td></tr></table><br>";
				

				 Response.Write(cuerpo);
				 
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

case 22: //Para las especificaciones en los parametros de los analisis
//Declaracion de Variables
idP0=Session["sysIdTipoRrhh"]!=null? (string)Session["sysIdTipoRrhh"] : null;
idP1=Session["sysIdTipoRrhh"]!=null? (string)Session["sysIdPlanta"] : null;


//manejo de clase de datos y consulta mediante stored procedure
//Este script se encarga de generar las variables de sesion y autenticacion de usuario

         try
          { 
			 
			
			   dbManager.Open();
               strSQL = "SP_DISPOSICIONES null,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',null,"+Session["sysEdicion"].ToString()+",null,null,null,"+Session["sysIdRrhh"].ToString()+",null,null,'R' ";
			   
			  // Response.Write(strSQL);
			   
			   strSQL = "spReportes 2";
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
                 
              cuerpo="</br><p></p><table width='100%' border='0' cellspacing='0' cellpadding='0' align='center' class='tablaResumen'><tr><td width='5%' align='center' ></td><td  class='numeroDisposicion' height='25' width='40%'>&nbsp;Estado de Disposiciones</td><td  class='numeroDisposicion' width='10%'>Total</td></tr>";
			   
			   idP2="";
			   while(dbManager.DataReader.Read())
			   {			       
				 secuencial = double.Parse(dbManager.DataReader["proDias"].ToString());
				 
				  tipo = int.Parse(dbManager.DataReader["id_disposicion"].ToString());
				 switch (tipo){
					case 2: //Nuevos
					idP2="style='width:14px;height:14px;border-radius:7px;background:#0033CC;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 4: //Detenidos
					idP2="style='width:14px;height:14px;border-radius:7px;background:#CC0000;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 11: //Incumpplidos
					idP2="style='width:14px;height:14px;border-radius:7px;background:#FF6600;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 7: //atrasados
					idP2="style='width:14px;height:14px;border-radius:7px;background:#FFCC00;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 15: //Sin reporte
					idP2="style='width:14px;height:14px;border-radius:7px;background:#FF6E8B;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 5: //En ejecucion
					idP2="style='width:14px;height:14px;border-radius:7px;background:#009900;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 8: //En validacion
					idP2="style='width:14px;height:14px;border-radius:7px;background:#59FFFF;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					case 9: //En espera
					idP2="style='width:14px;height:14px;border-radius:7px;background:#9C9CFF;float:left;margin-bottom:2px; margin-left:3px;'"; 
					break;
					
					}

                  cuerpo +="<tr bgcolor='#ffffff'><td align='center' ><div "+ idP2 +"  ></div></td><td align='left' height='25' >&nbsp;"+ dbManager.DataReader["disposicion"].ToString() +"</td><td align='center' >"+ dbManager.DataReader["responsable"].ToString() +"</td></tr>";
				  	
				}
				
				cuerpo +="<tr  ><td ></td><td height='25'  class='numeroDisposicion'>&nbsp;&nbsp;Total General</td><td align='center'  class='numeroDisposicion'>"+ secuencial.ToString() +"</td></tr></table><br>";
				
				 Response.Write(cuerpo);
				 
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
            
break;
case 23: // Para consulta de disposiciones por Nombre
 
 try{ //
 idP0= Request.QueryString["id"]!="" ? "'"+Request.QueryString["id"]+"'" : "null";  //ID_disposicion
       
			  
			 dbManager.Open();		
			 strSQL = "exec SP_RRHH null,null,null,null,"+idP0+",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'A',null,4 ";			 
			
			 //Response.Write(strSQL);	   
			//Response.End();
			 dbManager.ExecuteReader(CommandType.Text,strSQL);
			
			sec=0;	idP1="";
  
	 while(dbManager.DataReader.Read()) {
						
			 if (sec < 1){
			%>
<br />
                            
<table width="99%" border="0" cellpadding="0" cellspacing="1" align="center" >
<tr class="tituloGrid" >
                <td width="29%" height="25" class="colorGrid" ><div align="center">Apellidos</div></td>
    <td width="22%" class="colorGrid" ><div align="center">Direcci&oacute;n</div></td>
    <td width="21%" class="colorGrid" ><div align="center">Email</div></td>
    <td width="18%" class="colorGrid" ><div align="center">Delegados</div></td>
    <td width="5%" class="colorGrid" ><div align="center">Estado</div></td>
    <td width="5%" class="colorGrid" ></td>
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
                <td height="25" valign="top"  bgcolor="<%=bgColor%>"><input type="hidden" id="txtID_<%=dbManager.DataReader["id"].ToString()%>" name="txtID_<%=dbManager.DataReader["id"].ToString()%>" value="<%=dbManager.DataReader["id"].ToString()%>" /><a href='#' data-toggle='modal' data-target='#validador' data-whatever='@getbootstrap' onClick="javascript: exampleModalLabel.innerHTML='Modificar Usuario'; generalJS('0','frmMeta|___sqlAjax1.aspx|txtID_<%=dbManager.DataReader["id"].ToString()%>;txtID_<%=dbManager.DataReader["id"].ToString()%>|idValidador|GET|&typ=20');"  style="font-family: Verdana, Arial, Helvetica, sans-serif; text-decoration: none; color: #196674;font-size: 12px;"  ><%=dbManager.DataReader["apellidos"].ToString()%></a></td>
                <td valign="top" bgcolor="<%=bgColor%>" ><%=dbManager.DataReader["direccion"].ToString()%></td>
                <td valign="top"  bgcolor="<%=bgColor%>"><%=dbManager.DataReader["email"].ToString()%></td>
                <td valign="top"  bgcolor="<%=bgColor%>"><%
				if (dbManager.DataReader["delegados"].ToString()!=""){
  				    Response.Write(dbManager.DataReader["delegados"].ToString().Replace("|","<br>"));%><input type="hidden" value="<%=dbManager.DataReader["strIdRrhh"].ToString()%>" id="txtStr<%=sec%>" name="txtStr<%=sec%>" /><strong>Trasladar:</strong><br> <input name="txtTraslado<%=sec%>" type="text" class="cajaFormulario" id="txtTraslado<%=sec%>"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&op=4&tE=0&dl=<%=dbManager.DataReader["strIdRrhh"].ToString()%>|idAutoTraslado<%=sec%>|GET|txtTraslado<%=sec%>|txtTrasladoSel<%=sec%>|idTraslad<%=sec%>');}" onclick="this.value=''; var objSel=document.getElementById('txtTrasladoSel<%=sec%>'); objSel.value=''; var objId=document.getElementById('idTraslad<%=sec%>'); objId.value=''; " placeholder="Buscar"/><div id='idAutoTraslado<%=sec%>'></div><input name="txtTrasladoSel<%=sec%>" type="hidden" class="cajaFormulario" id="txtTrasladoSel<%=sec%>" size="10" placeholder="Responsable" readonly="readonly"/><input name="idTraslad<%=sec%>" type="hidden" id="idTraslad<%=sec%>" />
                     
				<%}	%></td>
                <td valign="top"  bgcolor="<%=bgColor%>" align="center">
                <%=dbManager.DataReader["estado"].ToString()%></td>
                <td valign="top"  bgcolor="<%=bgColor%>"><div align="center">
                 <a href="#" class='btn btn-danger btn-xs'  onclick="javascript: if (confirm('Esta Seguro de Eliminar el Usuario?')){ generalJS('0','frmMeta|___sqlAjax.aspx|idTemp;idTemp|idRegistroUsuario|GET|&id=<%=dbManager.DataReader["id"].ToString()%>&typ=26');}">X</a> </div></td>
  </tr>
              <%} %>
              <tr>
               <td  style="border-radius: 0px 0px 0px 10px;">&nbsp;</td>
               <td  >&nbsp;</td>
               <td  >&nbsp;</td>
              </tr>
</table>
<% 			
     if (sec==0) Response.Write("<span class='detalleDisposicion'> No Existen Registros </span>"); 
	 
	     }catch (Exception ex){ Response.Write(ex.Message.ToString());}
          finally{dbManager.Dispose();}	             
break;

case 24: //Para el ingreso de Usuarios

idP0=Request.QueryString["p0"];  // Estado de la disposicion
idP1=Request.QueryString["p1"]!="null" ?  "'" + Request.QueryString["p1"].ToString() + "'" : "null";   // Numero de Cedula
idP2=Request.QueryString["p2"]!="null" ?  "'" + Request.QueryString["p2"].ToString() + "'" : "null";   // Apellidos y Nombres
idP3=Request.QueryString["p3"]!="null" ?  "'" + Request.QueryString["p3"].ToString() + "'" : "null";   // Correo
idP4=Request.QueryString["p4"]!="null" ?  "'" + Request.QueryString["p4"].ToString() + "'" : "null";   // Cargo
idP5=Request.QueryString["p5"]!="null" ?   Request.QueryString["p5"].ToString()  : "null";   // Direccion a la que pertenece
idP6=Request.QueryString["p6"]!="null" ?   Request.QueryString["p6"].ToString() : "null";   // Padre Responsable
idP7=Request.QueryString["p7"]!="null" ?   Request.QueryString["p7"].ToString() : "null";   // Clave
idP8=Request.QueryString["p8"]!="null" ?   "'" +Request.QueryString["p8"].ToString()+"'" : "null";   // Estado
idP9=Request.QueryString["p10"]!="null" ?   "'" +Request.QueryString["p10"].ToString()+"'" : "null";   // Nombre de la direccion




        try
         { 
			  //Para el ingreso de parametros de muestras
			 dbManager.Open();
		
			strSQL = "exec SP_RRHH 1,1,1,"+idP1+","+idP2+","+idP2+",'NN',null,null,null,"+idP3+",null,"+idP4+","+idP9+",null,'Blue',"+idP3+",'"+idP7+"',null,null,"+idP8+","+Session["sysIdRrhh"].ToString()+",null,"+idP0+","+idP5+","+idP6+"";
		 
			  //Response.Write(strSQL);	   
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


case 25: //Para el ingreso de   Analisis

idP0=Request.QueryString["p0"];  // Estado de la disposicion
idP1=Request.QueryString["p1"]!="null" ?  "'" + Request.QueryString["p1"].ToString() + "'" : "null";   // Numero de Cedula
idP2=Request.QueryString["p2"]!="null" ?  "'" + Request.QueryString["p2"].ToString() + "'" : "null";   // Apellidos y Nombres
idP3=Request.QueryString["p3"]!="null" ?  "'" + Request.QueryString["p3"].ToString() + "'" : "null";   // Correo
idP4=Request.QueryString["p4"]!="null" ?  "'" + Request.QueryString["p4"].ToString() + "'" : "null";   // Cargo
idP5=Request.QueryString["p5"]!="null" ?   Request.QueryString["p5"].ToString()  : "null";   // Direccion a la que pertenece
idP6=Request.QueryString["p6"]!="null" ?   Request.QueryString["p6"].ToString() : "null";   // Padre Responsable
idP7=Request.QueryString["p7"]!="null" ?   Request.QueryString["p7"].ToString() : "null";   // Clave
idP8=Request.QueryString["p8"]!="null" ?   "'" +Request.QueryString["p8"].ToString()+"'" : "null";   // estado
idP9=Request.QueryString["id"];  //ID disposicion
idP10=Request.QueryString["p9"]!="null" ?   "'" +Request.QueryString["p9"].ToString()+"'" : "null";   // Nombre de la direccion
        try{ 
			  //Para el ingreso de parametros de muestras
			 dbManager.Open();
		    
            strSQL = "exec SP_RRHH "+ idP9 +",1,1,"+idP1+","+idP2+","+idP2+",'NN',null,null,null,"+idP3+",null,"+idP4+","+idP10+",null,null,"+idP3+",'"+idP7+"',null,null,"+idP8+","+Session["sysIdRrhh"].ToString()+",2,"+idP0+","+idP5+","+idP6+"";
		  
			//Response.Write(strSQL);	   
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

case 26: //Para el ingreso de   Analisis
idP0=Request.QueryString["id"];  // Estado de la disposicion
        try{ 
			  //Para el ingreso de parametros de muestras
			 dbManager.Open();
		    
            strSQL = "exec SP_RRHH null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,"+idP0+" ";
		  
			//Response.Write(strSQL);	   
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

case 27: //Para el ingreso de   Analisis
idP0=Request.QueryString["p0"];  //ID disposicion
idP1=Request.QueryString["mF"]!="null" ? Request.QueryString["mF"].Replace('|',',') : "null"; //Observacion

        try
         { 
			  //Para el ingreso de parametros de muestras
			 dbManager.Open();
		
			    strSQL = "update sg_progDisposiciones set estadoProgramacion='Edita' where id in ("+idP1+")";
			 
				//Response.Write(strSQL);	   
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
