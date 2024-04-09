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
<style type="text/css">

.titulo {color: #ffffff;
	font-size: 13px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	text-decoration: none; background-color: #4848FF ;
	
	}

.subTitulo{color: #666666;
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	text-decoration: none;}
		
.detalleDisposicion{
	color: #666666;
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

.encabezado{
	color: #000000;
	font-size: 17px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

</style>
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
string  imprimir = Request.QueryString["print"]!=null ? Request.QueryString["print"] : "";

if (imprimir!=""){
DateTime dt = DateTime.Now;
string strDate="";
strDate = dt.ToString("MM/dd/yyyy");  
	
	Response.Clear();
	Response.Buffer = true;
	Response.ContentType = "application/vnd.ms-excel";
	Response.AddHeader("content-disposition", "attachment;filename=Cronograma_"+strDate+".xls");
    Response.Charset = "UTF-8";
    Response.ContentEncoding = Encoding.Default;
}



//Response.Write(tipo);
//Response.End();
Response.Write("<img src='https://www.siges.ec/___Images/logoMuniReporte.gif' />");
%>

<div align="center" style="float:left; width: 80%"><strong>M.I. MUNICIPALIDAD DE GUAYAQUIL</strong></div>
<div align="center" style="float:left; width: 80%"><strong>UNIDAD DE GESTION Y CALIDAD DE LOS SERVICIOS</strong></div>
<div align="center" style="float:left; width: 80%"><span class="subTitulo"><strong><%=Request.QueryString["t"]%></strong></span></div>

<br />
 <div style="float:left; width: 50%"><span class="subTitulo" ><strong>Usuario:</strong> <%=(Session["sysNombreUsuario"]+" "+Session["sysLABORATORIO"])%> </span></div><div style="float:left; width: 50%"><span class="subTitulo"><strong>Fecha:</strong> <% Response.Write(DateTime.Now.ToString());%></span></div>

<%
switch (tipo){
case 0:

idP0=Request.QueryString["id"];  //


try  {       
   			dbManager.Open();
			strSQL = "exec spNotificaciones 1, null,"+Session["sysEdicion"].ToString()+",'A',"+idP0+"";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;		 

     while(dbManager.DataReader.Read())
			   {			       
				sec++;
				
				if (sec<2){
				%>
<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr class="detalleDisposicion"><td height="25"><strong>Disposici&oacute;n:</strong> <%=dbManager.DataReader["nombre"].ToString()%></td>
                 </tr></table>
			

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  >
  <tr class="titulo" >
    <td width="15%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" height="30" align="center" ><strong>Fecha</strong></td>
    <td width="22%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Acci&oacute;n</strong></td>
    <td width="42%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Usuario</strong></td>
    <td width="9%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Tipo</strong></td>
    <td width="12%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Observaci&oacute;n</strong></td>
    
  </tr>	<%
           }
  
                if ((sec % 2)==0){
				  bgColor="#f1f1f1";
				}else{
				   bgColor="#ffffff";				  
			    } 
		%>
 
  <tr class="detalleDisposicion" >
    <td   height="25" style="border-bottom: 1px solid #f1f1f1;"><div align="left"><%=dbManager.DataReader["fecha"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="left"><%=dbManager.DataReader["accion"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="left"><%=dbManager.DataReader["rrhh"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="left"><%=dbManager.DataReader["tipo_rrhh"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><%=dbManager.DataReader["observacion"].ToString()%></td>
    
  </tr>
  <%}
   }catch (Exception ex){
                 Response.Write(ex.Message.ToString()+"<br>Sesion Caducada: Por favor Cierre el Navegador y <br>Vuelva a Iniciar Sesion.<br><br> <a href='#' onClick='javascript: window.close();' > Cerrar Ventana</a>");  
             }finally{
               dbManager.Dispose();
             }
  %>
</table>
<%

break;
case 1:
%>

<iframex id="idDatos" scrolling="no" width="100%" height="550px" src="reporteGrafico.aspx" style="border: 0px solid #cccccc;"  ></iframe>

<%
break;

case 2:

try  {       
   			dbManager.Open();
			strSQL = "exec spReportes 3";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;		 

     while(dbManager.DataReader.Read())
			   {			       
				sec++;
				
				if (sec<2){
				%>
			

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  >
  <tr class="titulo" >
    <td width="11%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" height="30" align="center" ><strong>Fecha</strong></td>
    <td width="34%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Disposici&oacute;n</strong></td>
    <td width="20%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Direcci&oacute;n</strong></td>
    <td width="11%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Estado</strong></td>
    <td width="17%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Responsable</strong></td>
    <td width="7%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Trans/dias</strong></td>
    
  </tr>	<%
           }
  
                if ((sec % 2)==0){
				  bgColor="#f1f1f1";
				}else{
				   bgColor="#ffffff";				  
			    } 
		%>
 
  <tr class="detalleDisposicion" >
    <td   height="25" style="border-bottom: 1px solid #f1f1f1;"><div align="left"><%=dbManager.DataReader["fechaFinal"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="left"><%=dbManager.DataReader["disposicion"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="left"><%=dbManager.DataReader["direccion"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="left"><%=dbManager.DataReader["estado"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><%=dbManager.DataReader["responsable"].ToString()%></td>
        <td  style="border-bottom: 1px solid #f1f1f1;"><div align="center"><%=dbManager.DataReader["transcurrido"].ToString()%></div></td>
  </tr>
  <%}
   }catch (Exception ex){
                 Response.Write(ex.Message.ToString()+"<br>Sesion Caducada: Por favor Cierre el Navegador y <br>Vuelva a Iniciar Sesion.<br><br> <a href='#' onClick='javascript: window.close();' > Cerrar Ventana</a>");  
             }finally{
               dbManager.Dispose();
             }
  %>
</table>
<%

break;

case 3:

idP0=Request.QueryString["id"];  //
try  {       
   			dbManager.Open();
			strSQL = "SP_DISPOSICIONES 8,"+Session["sysEdicion"].ToString()+",null,'A',null,"+idP0+",null,null,null,"+Session["sysIdRrhh"].ToString()+"";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;		 

     while(dbManager.DataReader.Read())
			   {			       
				sec++;
				
				if (sec<2){
				%>
			
<div style="float:left; width: 80%"><span class="subTitulo"><strong>Disposici&oacute;n: <%=dbManager.DataReader["nombre"].ToString()%></strong></span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  >
  <tr class="titulo" >
    <td width="4%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" height="30" align="center" ><strong>No.</strong></td>
    <td width="61%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Actividad</strong></td>
    <td width="13%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Fecha Inicio</strong></td>
    <td width="11%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Fecha Fin</strong></td>
    <td width="11%" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"><strong>Estado</strong></td>
 
    
  </tr>	<%
           }
  
                if ((sec % 2)==0){
				  bgColor="#f1f1f1";
				}else{
				   bgColor="#ffffff";				  
			    } 
		%>
 
  <tr class="detalleDisposicion" >
    <td   height="25" style="border-bottom: 1px solid #f1f1f1;"><div align="left"><%=sec%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="left"><%=dbManager.DataReader["detalle"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="center"><%=dbManager.DataReader["fechaInicio"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="center"><%=dbManager.DataReader["fechaFinal"].ToString()%></div></td>
    <td  style="border-bottom: 1px solid #f1f1f1;"><div align="center"><%=dbManager.DataReader["estadoEjecucion"].ToString()%></div></td>
  
  </tr>
  <%}
   }catch (Exception ex){
                 Response.Write(ex.Message.ToString()+"<br>Sesion Caducada: Por favor Cierre el Navegador y <br>Vuelva a Iniciar Sesion.<br><br> <a href='#' onClick='javascript: window.close();' > Cerrar Ventana</a>");  
             }finally{
               dbManager.Dispose();
             }
  %>
</table>
<%

break;


}  
%>
