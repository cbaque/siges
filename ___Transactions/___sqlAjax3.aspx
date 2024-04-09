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
ComboLista dbDireccion;
//Response.Write(tipo);
//Response.End();
switch (tipo){
case 41:
idP0 = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";

dbDireccion = new ComboLista("cmbDireccion", "0", "exec spPlantillas 2,1,4,null,null,null,'A'", "", "", "", "cajaFormulario", "0", "");
%>

<div style="border-radius: 10px 10px 0px 0px; width:15%; height:25px; color: #ffffff;font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif;text-decoration: none;" class="colorGrid" align="center" >Gesti&oacute;n de Cadenas</div><br>
<label style="float:left; margin-left: 20%;" class="detalleDisposicion">Categoria: </label>
&nbsp;<a href="#" class='btn btn-primary btn-xs'  data-toggle='modal' data-target='#validador' data-whatever='@getbootstrap' onClick="javascript: exampleModalLabel.innerHTML='Configuraci&oacute;n de Plantillas'; generalJS('0','frmMeta|___sqlAjax3.aspx|cmbTipoDisp;cmbCabPlantilla|idValidador|GET|&typ=43');" > Configuraci&oacute;n </a>
<div style="float:left; margin-left:2px; width: 12%;"><%
		    dbDireccion.Nombre=("cmbTipoDisp");
			dbDireccion.CssCmb="cajaFormulario";
			dbDireccion.ItemSelect = "4";
			//dbDireccion.Events=("onchange=' javascrit: iniTab(\"___sqlAjax3.aspx|cmbTipoDisp;idTemp|idPlantilla|GET|42\");'");
			Response.Write(dbDireccion.cargarComboLista()); 
		%></div>
        <div style="float:left; margin-left:2px; width: 20%;"><%
		    dbDireccion.StrSQL="exec spPlantillas 7,1,4,null,null,null,'A'";
			dbDireccion.Nombre=("cmbCabPlantilla");
			dbDireccion.CssCmb="cajaFormulario";
			dbDireccion.ItemSelect = "1";
			dbDireccion.Events=("onchange=' javascrit: iniTab(\"___sqlAjax3.aspx|cmbTipoDisp;cmbCabPlantilla|idPlantilla|GET|42\");'");
			Response.Write(dbDireccion.cargarComboLista()); 
		%></div>
        
        
   <br /><br />
   <table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tr>
    <td align="center">
    <div style="float:left; width:50%;"> 
    <span class="detalleDisposicion" >Tarea:</span><br />
    <input name="txtAct" type="text" class="cajaFormulario" id="txtAct" size="10"  value=""  placeholder="Escriba una actividad"/>
    </div>
    
    <div style="float:left; width:27%; " align="center"> <span class="detalleDisposicion" >Responsable:</span><br />
    <div style="float:left; width:45%; ">   
    <input name="txtResp" type="text" class="cajaFormulario" id="txtResp" size="10"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&amp;op=1&tE=0|idAutoResp|GET|txtResp|txtRespSel|idResp');}" onclick="this.value=''; var objSel=document.getElementById('txtRespSel'); objSel.value=''; var objId=document.getElementById('idResp'); ;objId.value=''; " placeholder="Buscar"/><div id='idAutoResp'></div></div><div style="float:left; width:55%; "><input name="txtRespSel" type="text" class="cajaFormulario" id="txtRespSel" size="10" placeholder="Responsable" readonly="readonly"/><input name="idResp" type="hidden" id="idResp" />  </div>      
    
    </div>
    
    <div style="float:left; width:7%;"> <span class="detalleDisposicion" >Duraci&oacute;n:</span><br />
        <input name="txtDur" type="text" class="cajaFormulario" id="txtDur" size="10" maxlength="10"  onkeypress="return soloNumeros(event)" placeholder="D&iacute;as" />
    </div>
    
   
    
    <div style="float:left; width:6%;"> <span class="detalleDisposicion" >&nbsp;</span><br />
      <a href="#" onclick="javascript: if (validateForm('frmMeta|cmbTipoDisp;R|cmbCabPlantilla;R|txtAct;R|txtRespSel;R|txtDur;R')){generalJS('0','frmMeta|___sqlAjax3.aspx|cmbTipoDisp;idResp;txtAct;txtDur;cmbCabPlantilla|idIngresoActividad|GET|&typ=47');}" class="btn btn-primary btn-xs" >Ingresar</a> </div> <!-- generalJS('0','frmMeta|___sqlAjax.aspx|idTrama;idTrama|idProgramacion|GET|&typ=10');  -->
    <div id="idIngresoActividad" style="float:left; width:25%;"></div></td>
  </tr>
  <!--<tr>
    <td><br /><div style="background-color: #0165BE; height:3px; " ></div></td>
  </tr>-->
 
</table>
   
   
   <div id="idPlantilla" style="width: 98%;" ></div>



<%

break;
case 42:
idP0=Request.QueryString["id"] ;  //id_tipo_disposicion
idP1=Request.QueryString["id1"]; //id_plantilla
%>

<% 
  try  {       
   			dbManager.Open();
		
			strSQL = "exec spPlantillas null,1,"+idP0+","+idP1+"";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1="";	  
	%>
<br />

	 <% while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	 
	 %>
<div style='width: 100%; height:490px; overflow:auto;border-left: solid 1px #f1f1f1; border-bottom: solid 1px #f1f1f1; border-radius: 10px 0px 0px 10px;'>
<table width="100%" border="0" cellpadding="0" cellspacing="0"  >
  <tr class="tituloGrid"  >
    <td width="4%" class="colorGrid" height="25"  ><div align="center">Orden</div></td>
    <td width="42%" class="colorGrid" ><div align="center">Tarea</div></td>
    <td width="30%" class="colorGrid" ><div align="center" >Responsable</div></td>
    <td width="5%" class="colorGrid" ><div align="center">D&iacute;as</div></td>
    <td width="4%" class="colorGrid" ><div align="center">Estado</div></td>
    <td width="15%" class="colorGrid" >&nbsp;</td>
    </tr>
	 <%
    	}
			sec++;
			if ((sec % 2)==0){bgColor="#ffffff";}else{bgColor="#ffffff";} 
		%>

 
  <tr class="detalleDisposicion" >
    <td  bgcolor="<%=bgColor%>" height="30"><div align="center"><input name="txtOrden<%=sec%>" type="text" class="cajaFormulario" id="txtOrden<%=sec%>" size="10" onkeypress="return soloNumeros(event)"  value="<%=dbManager.DataReader["orden"].ToString()%>" /></div></td>
    <td bgcolor="<%=bgColor%>" valign="top" ><input name="txtTarea<%=sec%>" type="text" class="cajaFormulario" id="txtTarea<%=sec%>" size="10"  value="<%=dbManager.DataReader["texto"].ToString()%>" /></td>
    <td  bgcolor="<%=bgColor%>" valign="top" >       
    <div style="float:left; width:35%; ">   
    <input name="txtResposable<%=sec%>" type="text" class="cajaFormulario" id="txtResposable<%=sec%>" size="10"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&amp;op=1&tE=0|idAutoRespuesta<%=sec%>|GET|txtResposable<%=sec%>|txtResposableSel<%=sec%>|idRespResposable<%=sec%>');}" onclick="this.value=''; /*var objSel=document.getElementById('txtResposableSel<%=sec%>'); objSel.value=''; var objId=document.getElementById('idRespResposable<%=sec%>'); objId.value=''; */" placeholder="Buscar"/><div id='idAutoRespuesta<%=sec%>'></div></div><div style="float:left; width:65%; "><input name="txtResposableSel<%=sec%>" type="text" class="cajaFormulario" id="txtResposableSel<%=sec%>" value="<%=dbManager.DataReader["responsable"].ToString()%>" size="10" placeholder="Responsable" readonly="readonly"/><input name="idRespResposable<%=sec%>" type="hidden" id="idRespResposable<%=sec%>" value="<%=dbManager.DataReader["id_rrhh"].ToString()%>" />
    
    </td>
    <td  bgcolor="<%=bgColor%>" align="center"><input name="txtDuracion<%=sec%>" type="text" class="cajaFormulario" id="txtDuracion<%=sec%>" size="10"  value="<%=dbManager.DataReader["duracion"].ToString()%>" onkeypress="return soloNumeros(event)" /></td>
    <td  bgcolor="<%=bgColor%>" align="center"><input name="txtEstado<%=sec%>" type="text" class="cajaFormulario" id="txtEstado<%=sec%>" size="10"  value="<%=dbManager.DataReader["estado"].ToString()%>" /></td>
    <td  bgcolor="<%=bgColor%>">
      <div style="margin-left: 8px;">
      <a href="#" class='btn btn-success btn-xs' onclick="javascript: if (confirm('Esta Seguro de Actualizar la actividad?')){ generalJS('0','frmMeta|___sqlAjax3.aspx|txtOrden<%=sec%>;txtTarea<%=sec%>;idRespResposable<%=sec%>;txtDuracion<%=sec%>;txtEstado<%=sec%>|idPlantilla|GET|&id=<%=dbManager.DataReader["id"].ToString()%>&typ=49');}">Grabar</a>&nbsp;
      <a href="#" class='btn btn-danger btn-xs' onclick="javascript: if (confirm('Esta Seguro de Eliminar? la activdad:  <%=dbManager.DataReader["texto"].ToString()%>')){ generalJS('0','frmMeta|___sqlAjax3.aspx|idTemp;idTemp|idPlantilla|GET|&id=<%=dbManager.DataReader["id"].ToString()%>&typ=48');}">X</a></div></td>
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
case 43:
idP0=Request.QueryString["p0"];
idP1=Request.QueryString["p1"];
//Response.Write(idP0 + ":" + idP1);
%>

<br />
<table width="80%" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td width="23%" align="right" valign="top" class="detalleDisposicion">Nombre de Plantilla:</td>
    <td width="64%" align="left"><textarea name="txtPlantilla" cols="40" rows="2"  class="cajaFormulario" id="txtPlantilla"></textarea>    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><a href="#" onclick="javascript: if (validateForm('frmMeta|txtPlantilla;R')){generalJS('0','frmMeta|___sqlAjax3.aspx|txtPlantilla;cmbTipoDisp|idNuevaPlantilla|GET|&typ=44');}" class="btn btn-success btn-sm">Grabar</a>    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div id="idNuevaPlantilla" ></div></td>
  </tr>
</table>
<div id="idConsTipoDisposicion"></div>
<%

break;
case 44: //Para el ingreso de Plantillas
idP0=Request.QueryString["p0"];  // Nombre de la Plantilla
idP1=Request.QueryString["p1"];  // id_tipo_disposicion


        try{ 
			 
			 dbManager.Open();
		 	 strSQL = "exec spPlantillas 1,1,"+idP1+",null,null,1,'A','"+ idP0 +"','sbauz'";
			 	//Response.Write(strSQL);	   
			     dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
        
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             


break;

case 45: //Consulta de Plantillas
idP0=Request.QueryString["id"]; //id_tipoDisposicion
idP1=Request.QueryString["id1"]; //id_plantilla
  try  {       
   			dbManager.Open();
		
			strSQL = "exec spPlantillas 8,1,"+idP0+","+idP1+",null,null,'A'";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1="";	  
	%>
<% while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	 
	 %>
<div style='width: 100%; height:210px; overflow:auto;border-left: solid 1px #CCCCCC; border-bottom: solid 1px #CCCCCC;' align="">
<table width="100%" border="0" cellpadding="0" cellspacing="0"  >
  <tr class="tituloGrid"  >
    <td width="3%" class="colorGrid" height="25" style="border-top:solid 1px #999999;" ><div align="center">No.</div></td>
    <td width="50%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Nombre</div></td>
    <td width="25%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Fecha</div></td>
    <td width="12%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Estado</div></td>
    <td width="8%" class="colorGrid" style="border-top:solid 1px #999999;">&nbsp;</td>
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
    <td  bgcolor="<%=bgColor%>" height="30"><div align="center"><%=sec%></div></td>
    <td bgcolor="<%=bgColor%>" align="center" ><%=dbManager.DataReader["nombre"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>"><%=dbManager.DataReader["fecha"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>"><%=dbManager.DataReader["estado"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>">
      <div align="left"><a href="#" class='btn btn-danger btn-xs' onclick="javascript: if (confirm('Esta Seguro de Eliminar la Plantilla? \nTambien se elimina las actividades relacionadas a la plantilla de <%=dbManager.DataReader["nombre"].ToString()%> ')){ generalJS('0','frmMeta|___sqlAjax3.aspx|idTemp;idTemp|idConsTipoDisposicion|GET|&id=<%=dbManager.DataReader["id"].ToString()%>&typ=46');}">X</a></div></td>
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
case 46: //Eliminacion de Plantillas
idP0=Request.QueryString["id"];  // id_cabecera de Plantilla

        try{ //Para el ingreso de parametros de muestras
			 
			 dbManager.Open();
		 	 strSQL = "exec spPlantillas 3,1,"+ idP0 +"";
			 	//Response.Write(strSQL);	   
			     dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
        
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             


break;

case 47: //Ingreso del Detalle de Plantillas
idP0=Request.QueryString["p0"];  // id_tipo_disposicion
idP1=Request.QueryString["p1"];  // id_rrhh
idP2="null";                     // orden
idP3=Request.QueryString["p2"];  // texto
idP4=Request.QueryString["p3"];  // duracion
idP5=Request.QueryString["p4"];  // id_plantilla

        try{ //Para el ingreso de parametros de muestras
								 
			 dbManager.Open();
		 	 strSQL = "exec spPlantillas 4,"+Session["sysIdPlanta"]+","+idP0+","+idP1+","+Session["sysIdTipoRrhh"]+","+idP2+",'A',null,'"+ Session["sysIdRrhh"] +"','"+idP3+"',null,"+idP4+",null,'R',"+idP5+"";
			 	
				//Response.Write(strSQL);	   
			     dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
        
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             


break;

case 48: //Eliminacion de actividades de la Plantillas
idP0=Request.QueryString["id"];  // id_tipoDisposicion

        try{ //Para el ingreso de parametros de muestras
			 
			 dbManager.Open();
		 	 strSQL = "exec spPlantillas 5,1,"+ idP0 +"";
			 	//Response.Write(strSQL);	   
			     dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
        
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             


break;

case 49: //Modificacion de cada actividad en Plantillas
idP0=Request.QueryString["id"];  // id_actividad
idP1=Request.QueryString["p0"];  // orden
idP2=Request.QueryString["p1"]!="null" ? "'" + Request.QueryString["p1"]+"'": "null";  // tarea
idP3=Request.QueryString["p2"];  // responsable
idP4=Request.QueryString["p3"];  // duracion
idP5=Request.QueryString["p4"]!="null" ? "'" + Request.QueryString["p4"]+"'": "null"; // estado

        try{ //Para el ingreso de parametros de muestras
			 
			 dbManager.Open();
		 	 strSQL = "exec spPlantillas 6,1,"+ idP0 +","+ idP3 +",null,"+ idP1 +","+ idP5 +",null,null,"+ idP2 +",null,"+idP4+",null,null";
			 	//Response.Write(strSQL);	   
			    dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
        
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             


break;

case 50:
idP0=Request.QueryString["p0"];  // id_tipoDisposicion
 strSQL = "exec spPlantillas 7,1,"+idP0+",null,null,null,'A'";
 //Response.Write(strSQL);
dbDireccion = new ComboLista("cmbCabPlanti", "0", strSQL, "", "", "", "cajaFormulario", "0", "");
					
			Response.Write(dbDireccion.cargarComboLista()); 
		
break;

}

  
%>
