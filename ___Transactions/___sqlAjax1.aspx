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
string idP17; /*string idP18; string idP19; string idP20;*/
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

int tipo = Request.QueryString["typ"]!=null ? int.Parse(Request.QueryString["typ"]): -1;
//Response.Write(tipo);
//Response.End();
switch (tipo){
case 0:
idP0 = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";
idP1 =""; idP2 =""; idP3 ="";
 try{ //Para el ingreso de parametros de muestras
			 
			 dbManager.Open();
		 	 strSQL = "select convert(varchar,fechaInicio,103) as fechaInicio , convert(varchar,fechaFinal,103) as fechaFinal,detalle from sg_progDisposiciones where id = "+idP0+"";
			 //Response.Write(strSQL);	   
			 dbManager.ExecuteReader(CommandType.Text,strSQL);
			 
			 while(dbManager.DataReader.Read()) {
  	            idP1 = dbManager.DataReader["fechaInicio"].ToString();
				idP2 = dbManager.DataReader["fechaFinal"].ToString();
			    idP3 = dbManager.DataReader["detalle"].ToString();
             }
			 
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	   

%>

<br />
<br />
<table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
  <tr>
    <td width="23%" align="right" class="detalleDisposicion">Fecha Inicio:</td>
    <td width="64%" align="left">
    <div id="idIngresoActividad2" style="float:left; width:30%;"><input name="txtFechaIni" type="text" class="cajaFormulario" id="txtFechaIni" size="10" maxlength="10"  value="<%=idP1%>" onkeyup="javascript: mascara(this,'/',patron,true);"/></div>       </td>
  </tr>
  <tr>
    <td align="right" class="detalleDisposicion">Fecha Fin:</td>
    <td align="left">
      <div id="idIngresoActividad3" style="float:left; width:30%;">
        <input name="txtFechaFin" type="text" class="cajaFormulario" id="txtFechaFin" size="10" maxlength="10"  value="<%=idP2%>" onkeyup="javascript: mascara(this,'/',patron,true);"/>
      </div>      </td>
  </tr>
  <tr>
    <td align="right" valign="top" class="detalleDisposicion">Descripci&oacute;n de la Actividad:</td>
    <td align="left"><textarea name="txtAct" rows="3"  class="cajaFormulario" id="txtAct"><%=idP3%></textarea>    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><a href="#" onclick="javascript: if (validateForm('frmMeta|txtFechaIni;R|txtFechaFin;R|txtAct;R')){generalJS('0','frmMeta|___sqlAjax1.aspx|idTrama;txtFechaIni;txtFechaFin;txtAct|idActualizarActividad|GET|&id=<%=idP0%>&typ=11&tab=3');}" class="btn btn-success btn-sm">Grabar</a>    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div id="idActualizarActividad" ></div></td>
  </tr>
</table>
<%
break;
case 1: //Edicion de Actividad
idP0=Request.QueryString["p0"];  //ID disposicion
idP1=Request.QueryString["id"];  //C = Confirmado

        try{ //Para el ingreso de parametros de muestras
			 
			 dbManager.Open();
		 	 strSQL = "update sg_notificaciones set estado = 'E' where id = "+idP1+"";
			 //	Response.Write(strSQL);	   
			 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
          
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             
break;

case 2:

%>
<br />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="665" class="detalleDisposicion"><span style="float:left; width: 50px;"> C&oacute;digo: </span><input name="txtCodsCslta" type="text" class="cajaFormulario" id="txtCodsCslta" size="7"  value="" placeholder="125;134"  style="float:left; width: 250px;" maxlength="50" /> <a href="#" class="btn btn-success btn-xs" onclick="javascript:     
    if(validateForm('frmMeta|txtCodsCslta;R')){
    iniTab('___sqlAjax1.aspx|txtCodsCslta;txtCodsCslta|idDescartar|GET|19&op=1');}" >Buscar</a></td>
    <td width="102"  class="detalleDisposicion" ><div align="right">Disposici&oacute;n:</div></td>
    <td width="302"><input name="txtBDisposicion" type="text"  class="cajaFormulario" id="txtBDisposicion" value="<%
	Response.Write( Request.QueryString["p0"].ToString()!="null" ?  Request.QueryString["p0"].ToString() : "");
	%>" size="10" onkeyup="javascript: if (this.value.length>2){  iniTab('___sqlAjax1.aspx|txtBDisposicion;txtBDisposicion|idDescartar|GET|19&op=0');}" onclick="this.value='';" placeholder="Buscar por Nombre" />    </td>
  </tr>
  <tr>
    <td><div id='idEliminar'></div></td>
    <td class="titulo" style="border-radius: 15px 0px 0px 0px;">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<div id="idDescartar"></div>

<%
break;


case 3: 

       idP0=Request.QueryString["p0"];  //Texto
	   idP1=Request.QueryString["p1"];  //Seleccionado
  	   idP2=Request.QueryString["p2"];  // ID 		
 	
		try
         { 		  
		   //Para la consulta de anlisis
		  dbManager.Open();
          
          strSQL="exec SP_DISPOSICIONES 10,"+Session["sysIdTipoRrhh"]+","+Session["sysIdPlanta"].ToString()+",'A','"+idP0+"'";  
		  
		  //Response.Write(strSQL);	  
						  
		 dbManager.ExecuteReader(CommandType.Text,strSQL);
         //Response.Write(idP0+"|"+idP1+"|"+idP2+"|"+idP3);
		 	   
			   cuerpo="<table width='100%' border='0' cellpadding='0' cellspacing='0' >";//<div id='idRegistros' style='width: 150px; height:170px; overflow:auto;' onClick='javascript: idRegistros.parentNode.removeChild(idRegistros);'>";		   
			   while(dbManager.DataReader.Read())
			   {	
		          
				  cuerpo += "<tr ><td width='50%' class='columnasAutocompletado'><a href='#' onclick='javascript: objSel=document.getElementById(\""+idP1+"\"); objSel.value=\""+dbManager.DataReader[1].ToString()+"\"; objSel.style=\"background-color:#FFFF99\"; var idSel=document.getElementById(\""+idP2+"\"); idSel.value=\""+dbManager.DataReader[0].ToString()+"\";'>" + dbManager.DataReader[1].ToString()+"</a></td><td width='50%' class='columnasAutocompletado'>"+dbManager.DataReader[2].ToString()+"</td></tr>";		  	
							
				
				}
				  				 
				cuerpo +="</table>";
				 Response.Write(cuerpo);	//"</div>"+		  
             }catch (Exception ex){
                 Response.Write(ex.Message.ToString());  
             }finally{
               dbManager.Dispose();
             }
break;




case 4: //Para el ingreso de   Analisis
idP0=Request.QueryString["p0"];  //ID disposicion
idP1=Request.QueryString["id"];  //id

        try
         { 
			  //Para el ingreso de parametros de muestras
			 dbManager.Open();
		
			strSQL = "exec SP_DISPOSICIONES 11,null,null,null,null,"+idP1+"";
			 
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

case 5: //Para el ingreso de   Analisis
idP0=Request.QueryString["p0"];  // Estado de la disposicion
idP1=Request.QueryString["p1"];  // Tipo de disposicion
idP2=Request.QueryString["p2"];  // Naturaleza de la disposicion
idP3=Request.QueryString["p3"];  // ID_Responsable
idP4=Request.QueryString["p4"]!="null" ?  "'" + Request.QueryString["p4"] + "'" : "null"; // ID_CoResponsable
idP5=Request.QueryString["p5"];  // ID_Asociado
idP6=Request.QueryString["p6"]!="null" ?  "'" + Request.QueryString["p6"] + "'" : "null"; // Nombre de la disposicion
idP7=Request.QueryString["p7"]!="null" ?  "'" + Request.QueryString["p7"] + "'" : "null";  // Detalle de la disposicion
idP8=Request.QueryString["p8"];  // Fecha Inicio
idP9=Request.QueryString["p9"];  // Fecha Fin
idP10=Request.QueryString["p10"]!="null" ?  Request.QueryString["p10"] : "null";  // ID_analista
idP11=Request.QueryString["p11"]!="null" ?  "'" + Request.QueryString["p11"] + "'" : "null";  // Antecedentes
idP12=Request.QueryString["p12"]!="null" ?  "'" + Request.QueryString["p12"] + "'" : "null";  // Observaciones
idP13=Request.QueryString["p13"]!="null" ? Request.QueryString["p13"] : "0";  // Progreso

idP14=Request.QueryString["id"]; //id_disposicion
idP16=Request.QueryString["p14"]; //id_plantilla

try
          { 

fecha = idP8.Split('/');

if (idP9!="null"){ //Para controlar si ingresa o Nó la fecha final
			 fecha1 = idP9.Split('/'); //  fecha fin
			  idP15 = "'"+fecha1[2]+"/"+fecha1[1]+"/"+fecha1[0]+"'";
		   }else{
		     idP15 = idP9;
		   }
		   

//manejo de clase de datos y consulta mediante stored procedure
//Este script se encarga de ingresar una nueva muestra de analisis

        
			 //Para el ingreso de parametros de muestras
			 dbManager.Open();
				
			strSQL = "SP_DISPOSICIONES  12,"+Session["sysIdTipoRrhh"]+","+Session["sysIdPlanta"].ToString()+",'A',null,"+ idP14 +","+idP0+","+idP1+","+idP2+","+idP3+","+idP4+","+idP5+",null,null,"+idP6.Replace(',',';')+","+idP7.Replace(',',';')+",'"+fecha[2]+fecha[1]+fecha[0]+"',"+idP15+","+idP10+","+idP11.Replace(',',';')+","+idP12.Replace(',',';')+","+idP13+",null,"+Session["sysIdRrhh"].ToString()+",null,null,"+idP16+"";
			
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


case 6: // Para consulta de disposiciones por Nombre
 
 			%>
            
    <!--&nbsp;&nbsp;<a href="#" class='btn btn-success btn-sm'  data-toggle='modal' data-target='#validador' data-whatever='@getbootstrap' onclick="javascript: exampleModalLabel.innerHTML='Reporte de Actividades'; generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;idTemp|idValidador|GET|&typ=12&id=');">Reportar</a>-->	
   <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td width="79%" align="left" class="detalleDisposicion"><div style=" width:100%;" >Avances:<span id="idEtiqAvances" style=" margin-left: 70%;"></span>
        <div id="idGrabarMensajes" style="float:left;" ></div><br /><textarea name="txtMensaje" cols="50" rows="3"  class="cajaFormulario" id="txtMensaje" onkeyup="javascript: var oEtAva=document.getElementById('idEtiqAvances'); oEtAva.innerHTML = this.value.length>0  ?  'Escribi&oacute; <b>'+this.value.length + '</b> de <b>255</b> caracteres' : ''; " maxlength="255"></textarea>  
    </div>  </td>
    <td width="15%" align="left" valign="bottom">&nbsp;<a href="#" onclick="javascript: if (validateForm('frmMeta|txtMensaje;R')){generalJS('0','frmMeta|___sqlAjax1.aspx|idTrama;txtMensaje|idGrabarMensajes|GET|&typ=13&tab=2');}" class="btn btn-primary" >Grabar</a></td>
  </tr>
</table>

<div id="idReportes" style='width: 100%; height:350px; overflow:auto;'></div>
	
<% 			
           
break;

case 7: // Para Modulo de Mensajes
 try{ //
 idP0=Request.QueryString["id"];  //ID_disposicion
			  
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
<table width="100%" border="0" cellpadding="0" cellspacing="0"  >
              <tr class="tituloGrid" >
                <td width="16%" height="20" class="colorGrid" ><div align="center">Fecha</div></td>
                <td width="50%" class="colorGrid" ><div align="left">Mensaje</div></td>
                <td width="25%" class="colorGrid" ><div align="left">Usuario</div></td>
                <td width="9%" class="colorGrid" ><div align="center">Tipo</div></td>
               
             
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
                <td  bgcolor="<%=bgColor%>" height="30">&nbsp;<%=dbManager.DataReader["fecha"].ToString()%></td>
                 <td  bgcolor="<%=bgColor%>">
				<%=dbManager.DataReader["mensaje"].ToString()%>
				</td>
                
                <td  bgcolor="<%=bgColor%>"><%=dbManager.DataReader["nombre"].ToString()%></td>
                <td  bgcolor="<%=bgColor%>"><div align="center"><%=dbManager.DataReader["tipo"].ToString()%></div></td>
              </tr>
              <%} %>
</table>
<% 			
         }catch (Exception ex){ Response.Write(ex.Message.ToString());}
          finally{dbManager.Dispose();}	             
break;


case 8: //Para el ingreso de Mensajes
try{ 
 idP0=Request.QueryString["p0"];  //ID_disposicion
 idP1=Request.QueryString["p1"]!="null" ?  "'" + Request.QueryString["p1"] + "'" : "null";  //Mensaje
 idP2=Session["sysEdicion"].ToString()=="0" ? Session["sysIdRrhhAsociado"].ToString() : Session["sysIdRrhh"].ToString();  // para diferenciar quien ingresa el mensaje es el Delegado o Analista q tambien lo hace			  			  
			 dbManager.Open();		
			 strSQL = "exec spNotificaciones 2, "+Session["sysIdRrhh"].ToString() +", "+Session["sysIdTipoRrhh"].ToString()+",'A',"+idP0+","+Session["sysIdPlanta"].ToString()+","+Session["sysEdicion"].ToString()+","+idP1+","+idP2 +"";	
		 
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

case 9:
%>
<br />
<span class="detalleDisposicion" style="margin-left: 5%;" >Mensaje:</span><span id="idEtiqMensajes" class="detalleDisposicion" style=" margin-left: 50%;"></span>
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
   
    <td width="64%" align="left"><textarea name="txtMensaje" cols="50" rows="3"  class="cajaFormulario" id="txtMensaje" onkeyup="javascript: var oEtMen=document.getElementById('idEtiqMensajes'); oEtMen.innerHTML = this.value.length>0  ?  'Escribi&oacute; <b>'+this.value.length + '</b> de <b>255</b> caracteres' : ''; " maxlength="255"></textarea>  </td>
    <td width="15%" align="left" valign="bottom">&nbsp;<a href="#" onclick="javascript: if (validateForm('frmMeta|txtMensaje;R')){generalJS('0','frmMeta|___sqlAjax1.aspx|idTrama;txtMensaje|idGrabarMensajes|GET|&typ=8&tab=4');}" class="btn btn-primary" >Enviar</a>   <div id="idGrabarMensajes" style="float:left;" ></div></td>
  </tr>
</table>
<div id="idRespMensajes"></div>
<%
break;

case 10:
%>
<form enctype="multipart/form-data" runat="server" method="post" id='frmFile' name='frmFile' action="#" >
<div align="right" class="letra">ARCHIVO:</div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="3%"><asp:FileUpload ID="SubirFile" runat="server" size="58"/></td>
              <td width="97%"><asp:ImageButton BorderStyle="none" BorderWidth="0" CssClass="link" Height="17" ID="Button_Subir" ImageUrl="../___Images/subir.jpg" runat="server" Width="75"  OnClick="Button_Subir_Click" /></td>
            </tr>
          </table>
          
          <asp:Label ID="lblMensaje" runat="server" CssClass="letra"></asp:Label>
          <asp:Label ID="lblTabla" runat="server" ></asp:Label>
          
          </form>
  <script runat="server" language="c#">
  protected void Button_Subir_Click(object sender, EventArgs e)
  {
 	string Extension= System.IO.Path.GetExtension (SubirFile.FileName);
	string strTabla =""; string strSQL="";  int i=0; string strBatches=""; string strTamBatches=""; string bgColor=""; string dias="";    string strTablaErrores =""; string nombrearch=""; string semana=""; string strReportes="";
	string[] matL;
	string[] matLineas;
	string[] matFechas={"","","","","","","",""};
	
		
					
		if (SubirFile.HasFile)
  			{		
  			if (Extension.ToUpper()== ".PDF")	
	  			{	
				//try
   					//{
          		//Para subir archivos
		  		SubirFile.SaveAs(MapPath(SubirFile.FileName));
		        //Response.Write("ok");
		//IDBManager dbManager = new DBManager(DataProvider.OleDb);
        //dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();	
		   
		//dbManager.Open();
		//dbManager.ExecuteNonQuery(CommandType.Text,"delete from planes where semana="+semana+" and prioridad=1");
		
				
				
			   
			   
	             
	 			}
   			else
     			{
      			lblMensaje.Text = "Solo se aceptan archivos Excel .PDF!! <br> Nombre del archivo: "+ SubirFile.FileName;
      			}
  			}	 
		else
  			{
    		lblMensaje.Text = "Tiene que subir un archivo, Es un campo obligatorio!";
   			}
	    
	//}
 //catch (Exception ex)
	//{
	//lblMensaje.Text="El tamano del archivo sobrepasó el máximo permitido que es de 4096 KB. <br> El tamano actual del archivo es de " + SubirFile.PostedFile.ContentLength + " KB. <br>" ;
	//	Response.Write(ex.Message.ToString());  
	//}
	
		
				
		//lblTabla.Text = "<table width='90%' border='0' cellspacing='0' cellpadding='0'><tr><td width='45%' valign='top'>"+strTabla+"</td><td width='45%' valign='top'>"+strTablaErrores+"</td></tr></table>" ;
		
		
	}
  </script>       
<%
break;
case 11: //Edicion de Actividad
try{
idP0=Request.QueryString["id"]!="null" ?   Request.QueryString["id"]  : "null";   //ID_disposicion
idP1=Request.QueryString["p1"]!="null" ?   Request.QueryString["p1"]  : "null";   //fecha Inicio
idP2=Request.QueryString["p2"]!="null" ?   Request.QueryString["p2"]  : "null";   //fecha Fin
idP3=Request.QueryString["p3"]!="null" ?  "'" + Request.QueryString["p3"] + "'" : "null";  // Detalle de la disposicion
idP6=Request.QueryString["idCat"]!="null" ?   Request.QueryString["idCat"]  : "null";   //categoria de disposicion
idP7=Request.QueryString["ord"]!="null" ?   Request.QueryString["ord"]  : "null";   //orden
	
	if (idP1!="null"){ //Para controlar si ingresa o Nó la fecha final
			 fecha = idP1.Split('/'); //  fecha fin
			  idP4 = "'"+fecha[2]+fecha[1]+fecha[0]+"'";
		   }else{
		     idP4 = idP1;
		   }

if (idP2!="null"){ //Para controlar si ingresa o Nó la fecha final
			 fecha1 = idP2.Split('/'); //  fecha fin
			  idP5 = "'"+fecha1[2]+fecha1[1]+fecha1[0]+"'";
		   }else{
		     idP5 = idP2;
		   }
		   			 
			 dbManager.Open();
		 	 strSQL = "SP_DISPOSICIONES 15,"+idP7+","+Session["sysIdPlanta"].ToString()+",'A',null,"+idP0+",null,"+idP6+",null,"+Session["sysIdRrhh"].ToString()+",null,null,null,null,null,"+idP3.Replace(',',';')+","+idP4+","+idP5+"";
			 //Response.Write(strSQL);	   
			 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
              //Response.Write("Registro Actualizado <img src='../___Images/estado_ok.gif'>");
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             
break;

case 12:
%>
<br>

<div id="idRespMensajes"></div>
<%
break;


case 13: //Para el ingreso de Mensajes
try{ 
 idP0=Request.QueryString["p0"];  //ID_disposicion
 idP1=Request.QueryString["p1"]!="null" ?  "'" + Request.QueryString["p1"] + "'" : "null";  //Mensaje
 idP2= Session["sysEdicion"]=="0" ? "N" :"R";
 	  
			 dbManager.Open();		
			 strSQL = "exec spNotificaciones 4, "+Session["sysIdRrhh"].ToString() +", "+Session["sysIdTipoRrhh"].ToString()+",'A',"+idP0+","+Session["sysIdPlanta"].ToString()+",'"+idP2+"',"+idP1+","+ Session["sysIdRrhhAsociado"] +", 'Avance' ";	
		 
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

case 14: //Para Terminar una actividad del Cronograma
try{ 
 idP0=Request.QueryString["id"];  //id Porgramacion 
 idP1=Session["sysEdicion"].ToString()=="0" ? Session["sysIdRrhhAsociado"].ToString() : Session["sysIdRrhh"].ToString();  // para diferenciar quien cumple una actividad es el Delegado o Analista q tambien lo hace			  
			 dbManager.Open();		
			 strSQL = "exec spProcesos null, "+idP0+","+Session["sysIdRrhh"].ToString() +", 'A',"+Session["sysIdPlanta"].ToString()+","+ Session["sysEdicion"] +","+ idP1 +"";	
		
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

case 15:
//idP0=Request.QueryString["q"]!="null" ? Request.QueryString["q"] : "null" ;  //
idP1="";
idP0=Request.QueryString["p0"]!="null" ? "'" + Request.QueryString["p0"]+"'" : "null" ;  //

%>
<br />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td width="435" class="detalleDisposicion"><div style="float:left; width: 20%;" >Codigos:</div><div id='idEliminar' style="float:left; width: 80%;"></div></td>
    <td width="125" class="detalleDisposicion" style="border-radius: 15px 0px 0px 0px;"><div align="right">Por Disposicion: </div></td>
    <td colspan="2"><input name="txtBDisposicion" type="text"  class="cajaFormulario" id="txtBDisposicion" value="" size="10" onkeyup="javascript: var oId1=document.getElementById('txtFechIni');  var oId2=document.getElementById('txtFechFin'); var oId3=eval('document.forms[0].cmbEstDispos'); if (this.value.length > 2){ iniTab('___sqlAjax1.aspx|txtBDisposicion;txtBDisposicion|idBuscadorP|GET|16&ti=0&id1='+oId1.value+'&id2='+oId2.value+'&id3='+oId3.value); }" placeholder="Nombre de la Disposici&oacute;n"  onclick="this.value='';"/>          </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td> <input name="txtCodsCslta" type="text" class="cajaFormulario" id="txtCodsCslta" size="7"  value="" placeholder="125;134"  style="float:left; width: 250px;" maxlength="50" /> <a href="#" class="btn btn-success btn-xs" onclick="javascript:     
    if(validateForm('frmMeta|txtCodsCslta;R')){
    iniTab('___sqlAjax1.aspx|txtCodsCslta;txtCodsCslta|idBuscadorP|GET|16&ti=2');}" >Buscar</a>
    </span></div></td>
    <td class="detalleDisposicion" style="border-radius: 15px 0px 0px 0px;"><div align="right">Por Fecha y Estado: </div></td>
    <td width="301"><div style="float:left; width: 50%;"><input name="txtFechIni" type="text" class="cajaFormulario" id="txtFechIni" size="7" maxlength="10"  value="" placeholder="Desde"  style="float:left; width: 90px;" onClick="calenJquery('txtFechIni');" /></div>
      
    <div style="float:left; width:50%;"><input name="txtFechFin" type="text" class="cajaFormulario" id="txtFechFin" size="7" maxlength="10" value="" placeholder="Hasta"  style="float:left; width: 90px;" onClick="calenJquery('txtFechFin');" /> </div></td>
    <td width="120" ><%		
		    ComboLista dbEstDisp;
dbEstDisp = new ComboLista("cmbEstDispos", "0", "exec SP_DISPOSICIONES 1,1,"+Session["sysIdPlanta"].ToString()+",'A'", "", "", "", "cajaFormulario", "0", "");
			dbEstDisp.Nombre=("cmbEstDispos");
			dbEstDisp.CssCmb="cajaFormulario";
			//dbEstadoDisposicion.ItemSelect = idP19;
			//dbTipoDisposicion.Events=("onChange='generalJS(\"0\",\"frmMeta|___sqlAjax.aspx|cmbEstanteria;cmbEstanteria|idArchivos|GET|&typ=2&tab=2\");'");
			Response.Write(dbEstDisp.cargarComboLista());
		%></td>
    <td width="82" ><a href="#" class="btn btn-primary btn-xs" onClick="javascript:  var oId1=document.getElementById('txtFechIni'); var oId2=document.getElementById('txtFechFin'); var oId3=eval('document.forms[0].cmbEstDispos'); if(validateForm('frmMeta|txtFechIni;R|txtFechFin;R')){ iniTab('___sqlAjax1.aspx|txtBDisposicion;txtBDisposicion|idBuscadorP|GET|16&ti=1&i1='+oId1.value+'&id2='+oId2.value+'&id3='+oId3.value); }" >Buscar</a></td>
  </tr>
</table><div id="idBuscadorP"></div>

<%
break;

case 16: %> 
 
  <br />
<div style='width: 98%; height:370px; overflow:auto;'>
<% 
  
  idP1=""; idP2=""; idP3=""; idP4=""; idP5=""; idP6="";
idP0=Request.QueryString["id"]!="null" ? "'" + Request.QueryString["id"]+"'" : "null" ;  //
idP2=Request.QueryString["i1"] ;  //Fecha Inicio
fecha = idP2!=null ? idP2.Split('/') : null;
idP3=Request.QueryString["id2"] ;  // fecha Fin
fecha1 = idP3!=null ? idP3.Split('/') : null;
idP4=Request.QueryString["id3"]!="" ? Request.QueryString["id3"] : "null" ;  // estado
idP5=Request.QueryString["ti"]!="" ? Request.QueryString["ti"] : "0" ;  // estado
//Response.Write(idP2+":"+idP3+":"+idP4 +":"+ idP5);
  //Response.End();
 
idP6 = Session["sysEdicion"].ToString()=="0" ? Session["sysIdRrhh"].ToString() : "null" ;
  
  try  {       
   			dbManager.Open();
		
		
			if (idP5=="0") {strSQL = "exec SP_DISPOSICIONES 10,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',"+idP0+",null,null,null,null,"+ idP6 +"";}
		    if (idP5=="1") {strSQL = "exec SP_DISPOSICIONES 17,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',null,null,"+ idP4 +",null,null,"+ idP6 +",null,null,null,null,null,null,'"+fecha[2]+fecha[1]+fecha[0]+"','"+fecha1[2]+fecha1[1]+fecha1[0]+"'";}
if (idP5=="2") {strSQL = "exec SP_DISPOSICIONES 18,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',"+idP0+",null,null,null,null,"+ idP6 +"";}
			
			
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
    <td width="3%" class="colorGrid" height="25" style="border-top:solid 1px #999999;" align="center">No.</td>
    <td width="30%" class="colorGrid" style="border-top:solid 1px #999999;" align="center">Disposicion</td>
     <td width="10%" class="colorGrid" style="border-top:solid 1px #999999;" align="center">Estado</td>
    <td width="9%" class="colorGrid" style="border-top:solid 1px #999999;" align="center">Fecha</td>
    <td width="11%" class="colorGrid" style="border-top:solid 1px #999999;" align="center">Analista</td>   
    <td width="25%" class="colorGrid" style="border-top:solid 1px #999999;" align="center">Responsable</td>
    </tr>
	 <%	}	sec++;				
			if ((sec % 2)==0){
			  bgColor="#F0F0FF";
			}else{
			  bgColor="#ffffff";				  
			} 
	%>
  <tr style="font-family: Verdana, Arial, Helvetica, sans-serif; text-decoration: none; color: #666666;font-size: 12px;" >
    <td  bgcolor="<%=bgColor%>" height="30"><div align="center"><%="("+dbManager.DataReader["id"].ToString()+")"%></div></td>
    <td bgcolor="<%=bgColor%>" ><a href="#"  class="link" onclick="javascript: generalJS('0','frmMeta|___doMain.aspx|idTemp;idTemp|idHome|GET|&id=<%=dbManager.DataReader["id"].ToString()%>&pID=<%=dbManager.DataReader["id_estadoDisposicion"].ToString()%>&tab=1'); $('#validador').modal('toggle'); " ><%=dbManager.DataReader["disposicion"].ToString()%></a></td>
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

 
             
<% break;


case 17:
ComboLista dbDireccion;
idP0 = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";
dbDireccion = new ComboLista("cmbDireccion", "0", "SP_MENU_TIPORRHH null,null,null,null,null,null,null,null,null,null,null,'A',null,5", "", "", "", "cajaFormulario", "0", "");

%>
<br />

<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="25%"  align="center" style="border-radius: 15px 15px 0px 0px; height:25px; color: #ffffff; font-size: 12px;font-family: Verdana, Arial, Helvetica, sans-serif;text-decoration: none;" class="colorGrid">&nbsp;&nbsp;Gestion de Usuarios</td>
    <td width="75%"><div id="idRegistroUsuario"></div></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" style="border-radius: 0px 15px 15px 15px; height:25px; border:solid 1px #CCCCCC;">
  <tr>
    <td width="25%" valign="top" style="border-right:solid 1px #CCCCCC;">
    <br />
  <label style="float:left; " class="detalleDisposicion" >&nbsp;Tipo: </label><label style="float:left; margin-left: 35%;" class="detalleDisposicion">No. Indentifici&oacute;n: </label><br />
  <div style="float:left; width:40%; margin-left:2%;">
    <select name="cmbTipoUsuario" id="cmbTipoUsuario" class="cajaFormulario">
      <option value="">Seleccione</option>
      <option value="0" >Gestor</option>
      <option value="1">Analista</option>
    </select>
</div><div style="float:left; width:38%;"><input name="txtNumIdentificacion" type="text" class="cajaFormulario" id="txtNumIdentificacion" maxlength="100"  value=""  placeholder="Cedula" onkeypress="return soloNumeros(event)"></div>

<br /><br /> <!-- Salto Etiquetas -->
   <label style="float:left; width:35%;" class="detalleDisposicion">&nbsp;Colaborador: </label><br />
   <div style="float:left; width:96%;margin-left:2%;"><input name="txtColaborador" type="text" class="cajaFormulario" id="txtColaborador" maxlength="100"  value=""  placeholder="Apellidos y Nombres"/>
   </div>
  <br /><br />
   <label style="float:left; width:35%;" class="detalleDisposicion">&nbsp;Usuario/Email: </label><br /><div style="float:left; width:96%;margin-left:2%;"><input name="txtUsuario" type="text" class="cajaFormulario" id="txtUsuario" maxlength="100" value=""  placeholder="Email"/>
   </div>
   <br /><br />
   <label style="float:left; " class="detalleDisposicion">&nbsp;Clave: </label><label style="float:left; margin-left: 35%;" class="detalleDisposicion">Estado: </label>
   <br /><div style="float:left; width:36%;margin-left:2%;"><input name="password" type="password" class="cajaFormulario" id="password" value="" maxlength="100"  placeholder="Clave" onBlur="javascript:EncriptPassStudent(frmMeta);"/>   <input name="encriptpass" type="hidden" id="encriptpass"> 
   </div><div style="float:left; width:40%; margin-left:2%;">
    <select name="cmbEstado" id="cmbEstado" class="cajaFormulario">
      <option value="">Seleccione</option>
      <option value="A" >Activo</option>
      <option value="I">Inactivo</option>
    </select>
</div>
   <br /><br />
   <label style="float:left; width:35%;" class="detalleDisposicion">&nbsp;Cargo: </label><br />
   <div style="float:left; width:96%;margin-left:2%;"><input name="txtCargo" type="text" class="cajaFormulario" id="txtCargo" maxlength="100"  value=""  placeholder="Cargo"/>
   </div>
   <br /><br />
   <label style="float:left; width:70%;" class="detalleDisposicion">&nbsp;Direcci&oacute;n: </label><a href="#" class='btn btn-success btn-xs'  data-toggle='modal' data-target='#validador' data-whatever='@getbootstrap' onClick="javascript: exampleModalLabel.innerHTML='Nueva Direcci&oacute;n'; generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;idTemp|idValidador|GET|&typ=29');" >Configurar</a><br /><div style="float:left; width:96%;margin-left:2%;"><%
		    dbDireccion.Nombre=("cmbDireccion");
			dbDireccion.CssCmb="cajaFormulario";
			//dbTipoDisposicion.ItemSelect = idP20;
			dbDireccion.Events=("onChange='javascript: var SelectedIndex = this.options.selectedIndex; var objDir = document.getElementById(\"idDirNombre\"); if (this.value !=\"\"){objDir.value = this.options[SelectedIndex].text; }else { objDir.value =\"\"; }'");
			Response.Write(dbDireccion.cargarComboLista()); 
		%>
     <span style="float:left; width:63%; ">
     <input name="idDirNombre" type="hidden" id="idDirNombre" />
     </span></div>
   
     <br /> 
   <!-- Salto de Bloques -->
  
 <br /> <span class="detalleDisposicion" >&nbsp;Delegado de: </span><br /> 
 <div style="margin-left:5%;float: left; width:30%;"><input name="txtResponsable" type="text" class="cajaFormulario" id="txtResponsable" size="10"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&amp;op=1&tE=0|idAutoResponsable|GET|txtResponsable|txtResponsableSel|idResponsable');}" onclick="this.value=''; var objSel=document.getElementById('txtResponsableSel'); objSel.value=''; var objId=document.getElementById('idResponsable'); objId.value=''; " placeholder="Buscar"/><div id='idAutoResponsable'></div></div><div style="float:left; width:63%; "><input name="txtResponsableSel" type="text" class="cajaFormulario" id="txtResponsableSel" size="10" placeholder="Responsable" readonly="readonly"/><input name="idResponsable" type="hidden" id="idResponsable" /></div>
   
<div align="center">
  <br /> 
   <a href="#" onclick="javascript: if (validateForm('frmMeta|cmbTipoUsuario;R|txtNumIdentificacion;R|txtColaborador;R|txtUsuario;R|password;R|cmbEstado;R|txtCargo;R|cmbDireccion;R|txtResponsableSel;B')){generalJS('0','frmMeta|___sqlAjax.aspx|cmbTipoUsuario;txtNumIdentificacion;txtColaborador;txtUsuario;txtCargo;cmbDireccion;idResponsable;encriptpass;cmbEstado;password;idDirNombre|idRegistroUsuario|GET|&amp;typ=24');}" class="btn btn-primary btn-sm" >Grabar</a>
  
</div>
<!-- <br /> <span class="detalleDisposicion" style="margin-left:<%//=margen%>;">Delegado dse: </span><div style="width:40%; margin-left:<%//=margen%>;"><input name="txtActividad2" type="text" class="cajaFormulario" id="txtActividad2" size="10"  value=""  placeholder="Apellidos y Nombres"/></div>
     &nbsp;-->
      <br /> 
    </td>
    <td width="64%" valign="top">
    <br />
    <div style="float:right; width:40%;margin-right: 5%;" class="detalleDisposicion" >Colaborador: &nbsp;</div>
 <br />
   <div style="float:right; width:40%; margin-right: 5%;" ><input name="txtColaboradorBusqueda" type="text" class="cajaFormulario" id="txtColaboradorBusqueda" maxlength="100"  value=""  placeholder="Buscar por Apellidos" style="float: left; width: 250px;" />
<a href="#" class="btn btn-primary btn-xs" onClick="javascript:   if(validateForm('frmMeta|txtColaboradorBusqueda;R')){ iniTab('___sqlAjax.aspx|txtColaboradorBusqueda;txtColaboradorBusqueda|idListaUsuarios|GET|23'); }" style="float: left;" >Buscar</a>
   </div>
     <div style='width: 100%; height:450px; overflow:auto;'  id="idListaUsuarios"></div></td>
  </tr>
</table>
<%
break;

case 18:
idP0=Request.QueryString["p0"]!="null" ? "'" + Request.QueryString["p0"]+"'" : "null" ;  //
%>

<% 
  try  {       
   			dbManager.Open();
		
			strSQL = "exec SP_DISPOSICIONES 10,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',"+idP0+"";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1="";	  
	%>
<br />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="570"><div id='idEliminar'></div></td>
    <td width="208" bgcolor="#666666" class="titulo" style="border-radius: 15px 0px 0px 0px;"><div align="right">Disposici&oacute;n:</div></td>
    <td width="290" bgcolor="#5580FF"><input name="txtBDisposicion" type="text"  class="cajaFormulario" id="txtBDisposicion" value="<%
	Response.Write( Request.QueryString["p0"].ToString()!="null" ?  Request.QueryString["p0"].ToString() : "");
	%>" size="10" onkeyup="javascript: if (this.value.length>2){ generalJS('0','frmMeta|___sqlAjax1.aspx|txtBDisposicion;txtBDisposicion|idValidador|GET|&typ=2');}" onclick="this.value='';" placeholder="Buscar por Nombre" />
    </td>
  </tr>
</table>
	 <% while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	 
	 %>
<div style='width: 100%; height:390px; overflow:auto;border-left: solid 1px #CCCCCC; border-bottom: solid 1px #CCCCCC;'>
<table width="100%" border="0" cellpadding="0" cellspacing="0"  >
  <tr class="tituloGrid"  >
    <td width="3%" class="colorGrid" height="25" style="border-top:solid 1px #999999;" ><div align="center">No.</div></td>
    <td width="58%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Disposicion</div></td>
    <td width="13%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Analista</div></td>
    <td width="11%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Fecha</div></td>
    <td width="12%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Estado</div></td>
    <td width="3%" class="colorGrid" style="border-top:solid 1px #999999;">&nbsp;</td>
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
    <td bgcolor="<%=bgColor%>" ><%=dbManager.DataReader["disposicion"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>">&nbsp;<%=dbManager.DataReader["abreviado"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>"><%=dbManager.DataReader["fecha"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>"><%=dbManager.DataReader["estado"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>">
      <div align="left"><a href="#" class='btn btn-success btn-xs' onclick="javascript: if (confirm('Esta Seguro de Eliminar la Disposicion?')){ generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;idTemp|idEliminar|GET|&typ=4&id=<%=dbManager.DataReader["id"].ToString()%>&tab=E');}">X</a></div></td>
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

case 19:
idP0=Request.QueryString["id"]!="null" ? "'" + Request.QueryString["id"]+"'" : "null" ;  //
idP1=Request.QueryString["op"]!="null" ? Request.QueryString["op"] : "null" ;  // 

  try  {       
   			dbManager.Open();
		     if (idP1=="0") {strSQL = "exec SP_DISPOSICIONES 10,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',"+idP0+"";}
			
			 if (idP1=="1") {
			 strSQL = "exec SP_DISPOSICIONES 19,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',"+idP0+""; }

		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1="";	  
	%>
<br />

	 <% while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	 
	 %>
<div style='width: 100%; height:390px; overflow:auto;border-left: solid 1px #CCCCCC; border-bottom: solid 1px #CCCCCC;'>
<table width="100%" border="0" cellpadding="0" cellspacing="0"  >
  <tr class="tituloGrid"  >
    <td width="3%" class="colorGrid" height="25" style="border-top:solid 1px #999999;" ><div align="center">No.</div></td>
    <td width="58%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Disposicion</div></td>
    <td width="13%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Analista</div></td>
    <td width="11%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Fecha</div></td>
    <td width="12%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Estado</div></td>
    <td width="3%" class="colorGrid" style="border-top:solid 1px #999999;">&nbsp;</td>
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
    <td  bgcolor="<%=bgColor%>" height="30"><div align="center">(<%=dbManager.DataReader["id"].ToString()%>)</div></td>
    <td bgcolor="<%=bgColor%>" ><%=dbManager.DataReader["disposicion"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>">&nbsp;<%=dbManager.DataReader["abreviado"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>"><%=dbManager.DataReader["fecha"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>"><%=dbManager.DataReader["estado"].ToString()%></td>
    <td  bgcolor="<%=bgColor%>">
      <div align="left"><a href="#" class='btn btn-success btn-xs' onclick="javascript: if (confirm('Esta Seguro de Eliminar la Disposicion?')){ generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;idTemp|idEliminar|GET|&id=<%=dbManager.DataReader["id"].ToString()%>&typ=4');}">X</a></div></td>
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

case 20:

idP0 = Request.QueryString["p0"]!="" ? Request.QueryString["p0"]: "";
dbDireccion = new ComboLista("cmbDireccion", "0", "SP_MENU_TIPORRHH null,null,null,null,null,null,null,null,null,null,null,'A',null,5", "", "", "", "cajaFormulario", "0", "");

idP1=""; idP2=""; idP3=""; idP4=""; idP5=""; idP6=""; idP7=""; idP8=""; idP9=""; idP10=""; idP11="";
try {
dbManager.Open();
               strSQL = "exec SP_RRHH null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'A',null,7,"+idP0+"";
			   //Response.Write(strSQL);
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
			   cuerpo=""; 	   
			   while(dbManager.DataReader.Read())
			    {
			       idP1 = dbManager.DataReader["tipoEdicion"].ToString(); // tipo edicion
  			       idP2 = dbManager.DataReader["cedula"].ToString(); // cedula
   			       idP3 = dbManager.DataReader["apellidos"].ToString(); //  apellidos nombres
			       idP4 = dbManager.DataReader["email"].ToString(); // emal
          		   idP5 = dbManager.DataReader["id_direccion"].ToString(); // usuario 
				   idP6 = dbManager.DataReader["clave"].ToString()!="null" ? dbManager.DataReader["clave"].ToString() :  "" ; // cargo // clave
				   idP7 = dbManager.DataReader["estado"].ToString(); // estado
				   idP8 = dbManager.DataReader["cargo"].ToString()!="null" ? dbManager.DataReader["cargo"].ToString() :  "" ; // cargo
   				   idP9 = dbManager.DataReader["padreid"].ToString(); // padreid
				   idP10 = dbManager.DataReader["responsable"].ToString(); // padreid  
				    idP11 = dbManager.DataReader["direccion"].ToString(); // padreid  
   				   
   				   //idP8 = dbManager.DataReader["tipo"].ToString(); // detalle de disposicion
														   
  }
             

%>
    <div style="margin-left: 5%; width: 80%;" >
    <br />
  <label style="float:left; width:20%; " class="detalleDisposicion" >&nbsp;Tipo: </label>
  <div style="float:left; width:20%; ">
    <select name="cmbTipoUsuarioE" id="cmbTipoUsuarioE" class="cajaFormulario">
      <option value="">Seleccione</option>
      <option value="0" <% Response.Write( idP1=="0" ? "selected" : "" ); %> >Gestor</option>
      <option value="1" <% Response.Write( idP1=="1" ? "selected" : "" ); %> >Analista</option>
    </select>
</div>
<br /><br />
<label style="float:left; width:20%;" class="detalleDisposicion">No. Indentifici&oacute;n: </label>
<div style="float:left; width:20%;"><input name="txtNumIdentificacionE" type="text" class="cajaFormulario" id="txtNumIdentificacionE" maxlength="100"  value="<%=idP2%>"  placeholder="Cedula"/ onkeypress="return soloNumeros(event)"></div>

<br /><br /> <!-- Salto Etiquetas -->
   <label style="float:left; width:20%;" class="detalleDisposicion">&nbsp;Colaborador: </label> <div style="float:left; width:40%;"><input name="txtColaboradorE" type="text" class="cajaFormulario" id="txtColaboradorE" maxlength="100"  value="<%=idP3%>"  placeholder="Apellidos y Nombres"/>
   </div>
  <br /><br />
   <label style="float:left; width:20%;" class="detalleDisposicion">&nbsp;Usuario/Email: </label><div style="float:left; width:40%;"><input name="txtUsuarioE" type="text" class="cajaFormulario" id="txtUsuarioE" maxlength="100" value="<%=idP4%>"  placeholder="Email"/>
   </div>
   <br /><br />
   <label style="float:left;width:20%; " class="detalleDisposicion">&nbsp;Clave: </label>
   <div style="float:left; width:36%;"><input name="passwordE" type="password" class="cajaFormulario" id="passwordE" value="<%=idP6%>" maxlength="100"  placeholder="Clave" onBlur="javascript: encriptpassE.value= hex_md5(passwordE.value); "/>   <input name="encriptpassE" type="hidden" id="encriptpassE" value="<%=idP6%>"> 
   </div>
   <br /><br />
   <label style="float:left;width:20%; " class="detalleDisposicion">Estado: </label><div style="float:left; width:30%;">
    <select name="cmbEstadoE" id="cmbEstadoE" class="cajaFormulario">
      <option value="" >Seleccione</option>
      <option value="A" <% Response.Write( idP7=="A" ? "selected='selected'" : "" ); %> >Activo</option>
      <option value="I" <% Response.Write( idP7=="I" ? "selected='selected'" : "" ); %> >Inactivo</option>
    </select>
    
</div>
   <br /><br />
   <label style="float:left; width:20%;" class="detalleDisposicion">&nbsp;Cargo: </label>
   <div style="float:left; width:50%;"><input name="txtCargoE" type="text" class="cajaFormulario" id="txtCargoE" maxlength="100"  value="<%=idP8%>"  placeholder="Cargo"/>
   </div>
   <br /><br />
   <label style="float:left; width:20%;" class="detalleDisposicion">&nbsp;Direcci&oacute;n: </label><div style="float:left; width:60%;"><%
		    dbDireccion.Nombre=("cmbDireccionE");
			dbDireccion.CssCmb="cajaFormulario";
			dbDireccion.ItemSelect = idP5;
			dbDireccion.Events=("onChange='javascript: var SelectedIndex = this.options.selectedIndex; var objDir = document.getElementById(\"idDirNombreE\"); if (this.value !=\"\"){objDir.value = this.options[SelectedIndex].text; }else { objDir.value =\"\"; }'");
			Response.Write(dbDireccion.cargarComboLista());
		%>
     <span style="float:left; width:63%; ">
     <input name="idDirNombreE" type="hidden" id="idDirNombreE" value="<%=idP11%>" />
     </span></div>
   
    <br /><br />
   <!-- Salto de Bloques -->
  
 <label style="float:left; width:20%;" class="detalleDisposicion" >&nbsp;Delegado de: </label> 
 <div style="float: left; "><input name="txtResponsableE" type="text" class="cajaFormulario" id="txtResponsableE" size="10"  onkeyup="javascript: if (this.value.length&gt;2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&amp;op=1&tE=0|idAutoResponsableE|GET|txtResponsableE|txtResponsableSelE|idResponsableE');}" onclick="this.value=''; var objSelE=document.getElementById('txtResponsableSelE'); objSelE.value=''; var objIdE=document.getElementById('idResponsableE'); objIdE.value=''; " placeholder="Buscar"/><div id='idAutoResponsableE'></div></div><div style="float:left; width:50%; "><input name="txtResponsableSelE" type="text" class="cajaFormulario" id="txtResponsableSelE" size="10"  value="<% Response.Write( idP9!="" ? idP10 : "" ) ; %>" placeholder="Responsable" readonly="readonly"/><input name="idResponsableE" type="hidden" id="idResponsableE" value="<% Response.Write( idP9!="" ? idP9 : "" ) ; %>" /></div>
   
<div align="center">
  <br /> 
   <a href="#" onclick="javascript: if (validateForm('frmMeta|cmbTipoUsuarioE;R|txtNumIdentificacionE;R|txtColaboradorE;R|txtUsuarioE;R|passwordE;R|cmbEstadoE;R|txtCargoE;B|cmbDireccionE;R|txtResponsableSelE;B')){generalJS('0','frmMeta|___sqlAjax.aspx|cmbTipoUsuarioE;txtNumIdentificacionE;txtColaboradorE;txtUsuarioE;txtCargoE;cmbDireccionE;idResponsableE;encriptpassE;cmbEstadoE;idDirNombreE|idEditarRRHH|GET|&id=<%=idP0%>&typ=25');}" class="btn btn-primary btn-sm" >Grabar</a>
  <div id="idEditarRRHH"></div>
</div>

      <br /> 
</div>
<%

} catch (Exception ex){ Response.Write(ex.Message.ToString());  }
  finally{ dbManager.Dispose();}

break;

case 21: // Cambio de Clave Actual
idP0=Request.QueryString["p0"];  //Clave Actual
idP1=Request.QueryString["p1"];  //CLave Nueva
idP2=Request.QueryString["p2"];  //ID_RRHH

        try{ //Para el ingreso de parametros de muestras
			 
			 dbManager.Open();
		 	 strSQL = "update sg_Rrhh set clave = '"+ idP1 +"' where id = "+ idP2 +" and clave='"+ idP0 +"'";
			 	//Response.Write(strSQL);	   
			 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
              	Response.Write("Clave Modificada <img src='../___Images/estado_ok.gif'>");
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             
break;

case 22: // Cambio de Clave Actual
idP0=Request.QueryString["p0"];  //Email1
idP1=Request.QueryString["p1"];  //Email2
idP2=Request.QueryString["p2"];  //Email3
idP3=Request.QueryString["p3"];  //ID_RRHH

        try{ //Para el ingreso de parametros de muestras
			 
			 dbManager.Open();
		 	 strSQL = "update sg_Rrhh set mail1 = '"+ idP0 +"', mail2 = '"+ idP1 +"', mail3 = '"+ idP2 +"' where id = "+ idP3 +" ";
			 	//Response.Write(strSQL);	   
			     dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
              	Response.Write("Correos Actualizados <img src='../___Images/estado_ok.gif'>");
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             
break;


case 23:
idP1="";	strSQL = ""; idP2=Request.QueryString["id"]!="" ? Request.QueryString["id"]: "null";

  try  {       
   		  dbManager.Open();		
			if (Session["sysEdicion"].ToString()=="1"){ strSQL = "exec spReportes 2, null,"+idP2+",'A'";} else { strSQL = "exec spReportes 2, null,"+Session["sysIdRrhh"].ToString()+",'A'"; }
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
		  
	 while(dbManager.DataReader.Read()) {
	    idP1 += dbManager.DataReader["abreviado"].ToString().Trim() + "," + dbManager.DataReader["Nuevos"].ToString() +","+ dbManager.DataReader["en ejecucion"].ToString()+","+ dbManager.DataReader["atrasados"].ToString()+","+ dbManager.DataReader["detenidos"].ToString()+","+ dbManager.DataReader["en espera"].ToString() +","+ dbManager.DataReader["Revision"].ToString()+ "\n";
    }
   }catch (Exception ex){  Response.Write(ex.Message.ToString());  
             }finally{ dbManager.Dispose(); }
      Response.Write(idP1.Trim());
break;

case 24: //Para Terminar una actividad del Cronograma
try{ 
 idP0=Request.QueryString["id"];  //id Porgramacion 
 //idP1=Request.QueryString["p1"]!="null" ?  "'" + Request.QueryString["p1"] + "'" : "null";  //Mensaje
			  
			 dbManager.Open();		
			 strSQL = "exec spProcesos 2, "+idP0+","+Session["sysIdRrhh"].ToString() +", 'A',"+Session["sysIdPlanta"].ToString()+"";	
		
		
		
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







case 28: // Nueva Direccion Municipal
idP0=Request.QueryString["p0"]!="null" ? "'"+Request.QueryString["p0"]+"'" : "null";  //Direccion

        try{ //Para el ingreso de parametros de muestras
			 
			 dbManager.Open();
		 	 strSQL = "exec spReportes 14,null,null,'A',"+ idP0 +" ";
			 	//Response.Write(strSQL);	   
			     dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
              	Response.Write("Direcci&oacute;n Ingresada <img src='../___Images/estado_ok.gif'>");
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             
break;
case 29:
%>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="2"  >
  <tr>
    <td width="33%"><div align="right" class="detalleDisposicion">Nueva Direccion:</div></td>
    <td width="67%"><div align="center" style="float: left; width: 40%"><span class="Estilo7">
      <input name="txtNuevaDireccion" type="text" class="cajaFormulario" id="txtNuevaDireccion" size="10"  maxlength="100"  value=""/>
    </span></div></td>
  </tr>
  <tr>
    <td valign="top" align="right">&nbsp;</td>
    <td><button type='button' class="btn btn-primary" onclick="javascript: if (validateForm('frmMeta|txtNuevaDireccion;R')){generalJS('0','frmMeta|___sqlAjax1.aspx|txtNuevaDireccion;txtNuevaDireccion|idNuevaDir|GET|&typ=28'); }" >Guardar</button>
    <div id="idNuevaDir" style="float: right; width: 60%;"></div></td>
  </tr>
</table>
<div id="idDirMunicipio"></div>
<%
break;
case 30:

//idP0=Request.QueryString["p0"]!="null" ? "'" + Request.QueryString["p0"]+"'" : "null" ;  //

  try  {       
   			dbManager.Open();
		
			strSQL = "exec spNotificaciones 7 ";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1="";	  
	%>
<br />

	 <% while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	 
	 %>
<div style='width: 95%; height:320px; overflow:auto;border-left: solid 1px #CCCCCC; border-bottom: solid 1px #CCCCCC;'>
<table width="100%" border="0" cellpadding="0" cellspacing="0"  >
  <tr class="tituloGrid"  >
    <td width="3%" class="colorGrid" height="25" style="border-top:solid 1px #999999;" ><div align="center">No.</div></td>
    <td width="35%" class="colorGrid" style="border-top:solid 1px #999999;"><div align="center">Direcci&oacute;n</div></td>
    <td width="7%" class="colorGrid" style="border-top:solid 1px #999999;">&nbsp;</td>
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
    <td bgcolor="<%=bgColor%>" > <input name="txtNomDirecc<%=sec%>" type="text" class="cajaFormulario" id="txtNomDirecc<%=sec%>" size="10"  maxlength="100"  value="<%=dbManager.DataReader["nombre"].ToString()%>" /> </td>
    <td  bgcolor="<%=bgColor%>">
      <div align="center" style="float:left; width: 30%;"><a href="#" class='btn btn-danger btn-xs' onclick="javascript: if (confirm('Esta Seguro de Eliminar la Direcci&oacute;n?')){ generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;idTemp|idEliminarDirMuni|GET|&id=<%=dbManager.DataReader["id"].ToString()%>&typ=31');}">X</a></div><div align="center" style="float:left; width: 70%;"><a href="#" class='btn btn-success btn-xs' onclick="javascript: generalJS('0','frmMeta|___sqlAjax1.aspx|txtNomDirecc<%=sec%>;idTemp|idEliminarDirMuni|GET|&id=<%=dbManager.DataReader["id"].ToString()%>&typ=33');">Grabar</a></div></td>
    </tr>
 
  <%}
   }catch (Exception ex){
                 Response.Write(ex.Message.ToString());  
             }finally{
               dbManager.Dispose();
             }
  %>
   <tr class="detalleDisposicion" >
    <td  >&nbsp;</td>
    <td  ><div id="idEliminarDirMuni"></div></td>
    <td  >&nbsp;</td>
  </tr>
</table>
</div>

<%
break;
case 31:
idP0=Request.QueryString["id"];  // id_direccion

        try{ //Para el ingreso de parametros de muestras
			 
			 dbManager.Open();
		 	 strSQL = "delete from sg_Direcciones where id = "+ idP0 +"";
			 	//Response.Write(strSQL);	   
			     dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
             Response.Write("Direcci&oacute;n Ingresada <img src='../___Images/estado_ok.gif'>");
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             

break;
case 32:
idP0=Request.QueryString["col"];  // id_direccion

        try{ //Para el ingreso de parametros de muestras
			 
			 dbManager.Open();
		 	 strSQL = "update sg_Rrhh set IMG='"+ idP0 +"' where id = "+ Session["sysIdRrhh"] +"";
			 	//Response.Write(strSQL);	   
			     dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
             Session["sysTema"] = idP0; 
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             

break;

case 33:
idP0=Request.QueryString["p0"];  // id_direccion
idP1=Request.QueryString["id"];  // id_direccion

        try{ //Para el ingreso de parametros de muestras
			 
			 dbManager.Open();
		 	 strSQL = "update sg_Direcciones set nombre='"+ idP0 +"' where id = "+ idP1 +"";
			 	//Response.Write(strSQL);	   
			    dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
  
		  }catch (Exception ex){Response.Write(ex.Message.ToString());}              
           finally{ dbManager.Dispose(); }	             

break;

}  
%>
