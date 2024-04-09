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
<% if (Session["sysTema"].ToString()=="Blue") { %>
<link href="../___css/tema1.css" rel="stylesheet" type="text/css">
<script src="../___Objects/___Client/___menu.js"></script>
<%}%>
 <% if (Session["sysTema"].ToString()=="Black") { %>
<link href="../___css/tema2.css" rel="stylesheet" type="text/css">
<script src="../___Objects/___Client/___menu1.js"></script>
<%}%>
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

string imprimir = Request.QueryString["pr"];
int tipo = Request.QueryString["typ"]!=null ? int.Parse(Request.QueryString["typ"]): -1;

//Response.Write(tipo);
//Response.End();
DateTime dt = DateTime.Now;
string strDate="";
strDate = dt.ToString("MM/dd/yyyy HH:mm:ss");  

switch (tipo){ case 3 : strDate ="Alcalde_"+strDate; break;  //Alcalde
               case 4 : strDate ="General_"+strDate; break;  //General
			   case 6 : strDate ="Disposicion_"+strDate; break;  //Pre-Contractuales
			   case 5 : strDate ="Estado_"+strDate; break;  //Pre-Contractuales
			   case 8 : strDate ="PreContractuales_"+strDate; break;  //Pre-Contractuales
		   }
	 
	 if (imprimir=="xls"){        
		Response.Clear();
		Response.Buffer = true;
		Response.ContentType = "application/vnd.ms-excel";
		Response.AddHeader("content-disposition", "attachment;filename="+strDate+".xls");
		Response.Charset = "UTF-8";
		Response.ContentEncoding = Encoding.Default;  
	} /*else {
		Response.Clear();
		Response.Buffer = true;
		Response.ContentType = "application/pdf";
		Response.AddHeader("content-disposition", "attachment;filename="+strDate+".pdf");
		Response.Charset = "UTF-8";
		Response.ContentEncoding = Encoding.Default;  	
	}*/
%>
<% if (imprimir=="pdf"){ %>
<body  onload="javascript: window.print();" >
<% }else{ %>
<body >
<% } %>
<% 
switch (tipo){
case 3:  /**************  EXPORT ALCALDE  ********************/
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
					case 17: idP2="style='width:18px;height:18px;border-radius:15px;background:#9595FF;margin-bottom:1px;'"; break; //En validacion
					case 9:  idP2="style='width:18px;height:18px;border-radius:15px;background:#9C9CFF;margin-bottom:1px;'"; break; //En espera					
					}
		  
		  cuerpo +="<tr ><td align='left' height='25' class='detalleDisposicion' >&nbsp;"+ dbManager.DataReader["nombre"].ToString() +"</td><td align='center' valign='middle' ><div "+ idP2 +" ><span style='margin-top:30%;color: #ffffff; font-size: 12px;font-family: Verdana, Arial, Helvetica, sans-serif;text-decoration: none;'>"+ dbManager.DataReader["N"].ToString() +"</span> </div></td><td align='center' class='detalleDisposicion' ><strong>"+ dbManager.DataReader["porcentaje"].ToString() +"%</strong></td></tr>";
		  
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
    <td align="center" class="detalleDisposicionTitulo">    Reporte Alcalde </td>
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
<%  if (strReportes.IndexOf('2')>=0){  %>
<span class="detalleDisposicionTitulo"  style=" float:left; width:100%;"  >Disposiciones por Responsables y Estados </span>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" ><iframe id="idDatos" scrolling="no" width="90%" height="250px" src="graficoGeneral2.aspx?val=<%=idP5%>&c=<%=idP6%>" style="border: 0px solid #cccccc;"  >
</iframe></td>
   
  </tr>
</table>

<%}%>
<br />
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

<table width="100%" border="0" cellpadding="1" cellspacing="1" align="right"  style='border-bottom:solid 1px #CCCCCC;' >
  <tr class="tituloGrid"  >
    <td width="4%"    height="25" align="center" >No.</td>
    <td width="30%"  align="center">Disposicion</td>
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

<table width="100%" border="0" cellpadding="1" cellspacing="1" align="right"  style='border-bottom:solid 1px #CCCCCC;' >
  <tr class="tituloGrid"  >
    <td width="4%"   height="25" align="center" >No.</td>
    <td width="30%"  align="center">Disposicion</td>
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

<%}%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<%
 if (strReportes.IndexOf('5')>=0){ 
// Para Distribucion de Disposiciones x Estado
  try  { 
    int sumaN=0; int sumaE=0; int sumaA=0; int sumaD=0; int sumaEs=0;  int sumaRe=0;    
   			dbManager.Open();		
			strSQL = "exec spReportes 2, null,null,'A'";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1="";	  
 
  while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	 
	 %>
  
 <span class="detalleDisposicionTitulo" > Distribuci&oacute;n de las Disposiciones </span>
<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center"   >
  <tr class="tituloGrid"  >
    <td width="4%"  height="25" align="center" >No.</td>
    <td width="30%"  align="center">Responsables</td>
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

<%}

break;

case 4:  /*********** REPORTE GENERAL  ******************/
// Para los valores del grafico
idP0 = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "" ;
strReportes = Request.QueryString["mC"];
idP1 = Request.QueryString["idR"]!="" ? Request.QueryString["idR"]: "null";

idP5=""; idP6=""; idP7=""; cuerpo=""; estado=0; idP2="";
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
					case 17: idP2="style='width:20px;height:20px;border-radius:15px;background:#9595FF;margin-bottom:1px;'"; break; //En validacion
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
    <td align="center" class="detalleDisposicionTitulo">    Reporte General </td>
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

<%  if (strReportes.IndexOf('2')>=0){  %>
<br>

<span class="detalleDisposicionTitulo"  style=" float:left; width:100%;"  >Disposiciones por Responsables y Estados </span>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" ><iframe id="idDatos" scrolling="no" width="90%" height="250px" src="graficoGeneral2.aspx?val=<%=idP5%>&c=<%=idP6%>&id=<%=idP1%>" style="border: 0px solid #cccccc;"  >
</iframe></td>
   
  </tr>
</table>

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
    <td align="center"><span class="detalleDisposicionTitulo"  style=" float:left; width:100%;"  >Disposiciones Riesgo</span>
<br />

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
    <td    align="center"><%=dbManager.DataReader["id_disposicion"].ToString()%></td>
    <td  ><%=dbManager.DataReader["disposicion"].ToString()%></td>
    <td  ><%=dbManager.DataReader["responsable"].ToString()%></td>
    <td  align="left" ><%=dbManager.DataReader["fechaFinal"].ToString()%></td>
     <td align="left"  ><% if (int.Parse(dbManager.DataReader["transcurrido"].ToString())<10) {
	     Response.Write( "<span style='color: #CC0000;'> Vence: "+Math.Abs(int.Parse(dbManager.DataReader["transcurrido"].ToString()))+" d&iacute;a(s)</span>");
	}else{
	  Response.Write( " <span style='color: #FFCC00;'>Por Vencer</span>");
	} %></td>
 
    
  </tr>
  <%}}catch (Exception ex){ Response.Write(ex.Message.ToString());  
             }finally{ dbManager.Dispose(); } %>
</table>

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
    int sumaN=0; int sumaE=0; int sumaA=0; int sumaD=0; int sumaEs=0;   int sumaRe=0;     
   			dbManager.Open();		
			strSQL = "exec spReportes 2,null,"+ idP1 +",'A'";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1="";	  
 
  while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	 
	 %>

<span class="detalleDisposicionTitulo"  style=" float:left; width:100%;"  > Distribuci&oacute;n de las Diposiciones</span><br />

<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center"   >
  <tr class="tituloGrid"  >
    <td width="4%"  height="25" align="center" >No.</td>
    <td width="30%"  align="center">Responsables</td>
    <td width="5%" align="center">Nuevos</td>
    <td width="8%" align="center">En Ejecuci&oacute;n</td>
    <td width="7%"  align="center">Atrasados</td>
    <td width="7%" align="center">Detenidos</td>
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

<br />
<% } 
break;

case 5: /*************  REPORTE POR ESTADOS  *****************************/
idP0 = Request.QueryString["idR"]!="" ? Request.QueryString["idR"]: "null";
strReportes = Request.QueryString["mC"]!="" ? "'"+Request.QueryString["mC"]+"'": "null"; 
idP7 = Request.QueryString["idR1"]!="" ? Request.QueryString["idR1"]: "-1";
 
 
 
 if (imprimir =="xls"){ 
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
<span style="float:left;"><img src="http://pruebas.siges.ec/___Images/logoMuniReporte.gif"   /></span>
<div align="center" style="float:left; width: 80%"><strong>MUNICIPALIDAD DE GUAYAQUIL</strong></div>
<div align="center" style="float:left; width: 80%"><strong>UNIDAD DE GESTION Y CALIDAD DE LOS SERVICIOS</strong></div>
<div align="center" style="float:left; width: 80%"><strong>REPORTE POR ESTADOS</strong></div>
<div align="center" style="float:left; width: 80%"><span class="subTitulo"><strong><%=Request.QueryString["t"]%></strong></span></div>
<br />
 <div style="float:left; width: 50%"><span class="subTitulo" ><strong>Usuario:</strong> <%=(Session["sysNombreUsuario"]+" "+Session["sysLABORATORIO"])%> </span></div><div style="float:left; width: 50%"><span class="subTitulo"><strong>Fecha:</strong> <% Response.Write(DateTime.Now.ToString());%></span></div>
<table width="960" border="0" cellpadding="0" cellspacing="0" align="right"  >
  <tr class="titulo"  >
<td width="10"   height="25" align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" ></td>    
<td width="90"  align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;">Estado</td>
<td width="50"  align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;">Numero</td>  
  <td width="130"  align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;">Disposicion</td>
   <% if (strReportes.IndexOf("-1")>=0){  %>
    <td width="100"  align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;">Responsable</td>
    <%}%>
     <% if (strReportes.IndexOf("-2")>=0){  %>
    <td width="110"  align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;">Corresponsable</td>
    <%}%>
     <% if (strReportes.IndexOf("-3")>=0){  %>
    <td width="100"  align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;">Asociado</td>
    
    <%}%>
    <td width="75"  align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;">F. Inicio</td>
    <td width="75"  align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;">F. Final</td>
    <% if (strReportes.IndexOf("-4")>=0){  %>
   <td width="90"  align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;">Avance</td> 
    <%}%>
    
    <% if (strReportes.IndexOf("-5")>=0){  %>
        <td width="90"  align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;">Mensaje</td>
    <%}%>  
    
     <% if (strReportes.IndexOf("-6")>=0){  %> 
    <td width="90"  align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;">Usuario</td>
    <%}%>  
    </tr>
	 <% } 
	 
	            estado = int.Parse(dbManager.DataReader["id_estadoDisposicion"].ToString());
				 switch (estado){
					case 2: idP2="style='background:#0033CC;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //Nuevos
					case 4:	idP2="style='background:#CC0000; color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break;  //Detenidos
					case 11: idP2="style='background:#FF6600;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //Incumpplidos
					case 7:  idP2="style='background:#FFCC00;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //atrasados
					case 6: idP2="style='background:#AE8B00;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //Sin reporte
					case 5:  idP2="style='background:#009900;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //En ejecucion
					case 17: idP2="style='background:#9595FF;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //En validacion
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
  
  <% if (strReportes.IndexOf("-5")>=0){  %>
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
<%}%>


<%  if (imprimir =="pdf"){   //Solo para PDF

idP0 = Request.QueryString["idR"]!="" ? Request.QueryString["idR"]: "null";
strReportes = Request.QueryString["mC"]!="" ? "'"+Request.QueryString["mC"]+"'": "null"; 
idP7 = Request.QueryString["idR1"]!="" ? Request.QueryString["idR1"]: "-1";

idP2=""; idP3="";	idP5=""; idP6=""; cuerpo="";
try { 
dbManager.Open();  if (Session["sysEdicion"].ToString()=="1"){ strSQL="exec spReportes null, 1, "+ idP0 +" ,'A'";} else { strSQL="exec spReportes null, 1, "+ Session["sysIdRrhh"].ToString() +" ,'A'"; }
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
					case 6: idP2="style='width:20px;height:20px;border-radius:15px;background:#AE8B00;margin-bottom:1px;'"; break; //Sin reporte
					case 5:  idP2="style='width:20px;height:20px;border-radius:15px;background:#009900;margin-bottom:1px;'"; break; //En ejecucion
					case 17: idP2="style='width:20px;height:20px;border-radius:15px;background:#9595FF;margin-bottom:1px;'"; break; //En validacion
					case 9:  idP2="style='width:20px;height:20px;border-radius:15px;background:#9C9CFF;margin-bottom:1px;'"; break; //En espera				
					}
		  
		  cuerpo +="<tr ><td align='left' height='25' class='detalleDisposicion' >&nbsp;"+ dbManager.DataReader["nombre"].ToString() +"</td><td align='center' valign='middle' ><div "+ idP2 +" ><span style='margin-top:30% ;color: #ffffff; font-size: 12px;font-family: Verdana, Arial, Helvetica, sans-serif;text-decoration: none;'>"+ dbManager.DataReader["N"].ToString() +"</span> </div></td><td align='center' class='detalleDisposicion' ><strong>"+ dbManager.DataReader["porcentaje"].ToString() +"%</strong></td></tr>";
		  
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
    <td align="center" class="detalleDisposicionTitulo">    Reporte por Estado </td>
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
    <td width="9%" align="center">F. Inicio</td>
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
					case 6: idP2="style='background: #AE8B00;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //Sin reporte
					case 5:  idP2="style='background:#009900;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //En ejecucion
					case 17: idP2="style='background:#9595FF;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //En validacion
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
      
      
   <% if (strReportes.IndexOf("-5")>=0){  %>
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

<% } %>

<%
break;

case 6:  //POR DISPOSICION

idP0 = Request.QueryString["idR"]!="" ? Request.QueryString["idR"]: "null";
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
    <td align="center" class="detalleDisposicionTitulo">    Reporte por Disposici&oacute;n</td>
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
                       <td><div style="width: 75px; float:left;">   </div>
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
<span class="detalleDisposicionTitulo" > Reportes </span>                      
<table width="100%" border="0" cellpadding="0" cellspacing="1"  >
<tr class="tituloGrid" >
                <td width="15%" height="25"  ><div align="center">Fecha</div></td>
                <td width="28%" ><div align="center">Avance-Acci&oacute;n</div></td>
                <td width="26%"><div align="left">Usuario</div></td>
                <td width="9%" ><div align="center">Tipo</div></td>
                <td width="22%"  ><div style="float:left; width: 50%;">
                  <div align="center">Observaci&oacute;n</div>
                </div><div style="float:right; width: 50%;" >
      </td>
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
                <td valign="top"  bgcolor="<%=bgColor%>"><%
				if (dbManager.DataReader["delegado"].ToString()!=""){
      Response.Write(dbManager.DataReader["rrhh"].ToString() + "<br> "+dbManager.DataReader["delegado"].ToString());
   }else{
   Response.Write(dbManager.DataReader["rrhh"].ToString());
   }%></td>
                <td valign="top"  bgcolor="<%=bgColor%>"><div align="center"><%=dbManager.DataReader["tipo_rrhh"].ToString()%></div></td>
                <td valign="top"  bgcolor="<%=bgColor%>">
				<a href="#" class="tooltip"  style="font-family:Arial, Helvetica, sans-serif; color:#666666; text-decoration: none;" >
				<%
	 Response.Write(dbManager.DataReader["observacion"].ToString().Length > 50 ? dbManager.DataReader["observacion"].ToString().Substring(0,50)+"..." : dbManager.DataReader["observacion"].ToString());
	 %>   <span ><%=dbManager.DataReader["observacion"].ToString()%></span></a>				</td>
    </tr>
              <%} %>
              <tr>
               <td  style="border-radius: 0px 0px 0px 10px;">&nbsp;</td>
               <td  >&nbsp;</td>
               <td  >&nbsp;</td>
               <td  >&nbsp;</td>
               <td  >&nbsp;</td>
              </tr>
   </table>

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
           <span class="detalleDisposicionTitulo" > Observaciones </span>   
              <table width="100%" border="0" cellpadding="0" cellspacing="1"  >
              <tr class="tituloGrid" >
                <td width="16%" height="20" ><div align="center">Fecha</div></td>
                <td width="50%"  ><div align="center">Mensaje</div></td>
                <td width="25%" ><div align="left">Usuario</div></td>
                <td width="9%"  ><div align="center">Tipo</div></td>
               
             
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
                
                <td valign="top"  bgcolor="<%=bgColor%>"><%=dbManager.DataReader["nombre"].ToString()%></td>
                <td valign="top"  bgcolor="<%=bgColor%>"><div align="center"><%=dbManager.DataReader["tipo"].ToString()%></div></td>
              </tr>
              <%} %>
</table>

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
			   strReportes +="<tr class='tituloGrid'><td height='22' width='3%' valign='top' ><div align='center' ><strong>No.</strong></div></td><td valign='top'  width='15%'><div align='center' ><strong>Fecha</strong></div></td>";
    
    strReportes +="<td  valign='top' width='40%'><div align='center' > <strong>Archivo</strong></div></td>";
	strReportes +="<td  valign='top'  width='27%'><div align='center' > <strong>Usuario</strong></div></td>";
    strReportes +="<td  valign='top'  width='7%'><div align='center' > <strong>Tipo</strong></div></td>";
	strReportes +="<td  valign='top'  width='3%'><div align='center' ><strong></strong></div></td></tr>";
	// strTablaErrores +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Max. Batches</strong></div></td>";
	 
		
			   
			   while(dbManager.DataReader.Read())
			   {
			   sec++;
			   
			   if ((sec % 2)==0){
				  bgColor="#F0F0FF";
				}else{
				   bgColor="#ffffff";
				  
			    } 
			   			  			   	
			   strReportes +="<tr class='detalleDisposicion'><td bgcolor="+bgColor+" height='20'>&nbsp;"+sec+"</td><td bgcolor="+bgColor+" height='20'>&nbsp;"+dbManager.DataReader["fecha"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["archivo"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["usuario"].ToString()+"</td><td bgcolor="+bgColor+" align='center'>&nbsp;"+dbManager.DataReader["tipo"].ToString()+"</td></tr>";
			   
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

case 7:  //POR estados PDF

break;

case 8: /*************  REPORTE PRE-CONTRACTUALES  *****************************/
%>
<div align="center" style="float:left; width: 20%"><img src="http://pruebas.siges.ec/___Images/logoMuniReporte.gif"   /></div>
<div align="center" style="float:left; width: 80%"><strong>MUNICIPALIDAD DE GUAYAQUIL</strong></div>
<div align="center" style="float:left; width: 80%"><strong>UNIDAD DE GESTION Y CALIDAD DE LOS SERVICIOS</strong></div>
<div align="center" style="float:left; width: 80%"><strong>REPORTE CADENAS</strong></div>
<div align="center" style="float:left; width: 80%"><span class="subTitulo"><strong><%=Request.QueryString["t"]%></strong></span></div>
<br />
 <div style="float:left; width: 50%"><span class="subTitulo" ><strong>Usuario:</strong> <%=(Session["sysNombreUsuario"]+" "+Session["sysLABORATORIO"])%> </span></div><div style="float:left; width: 50%"><span class="subTitulo"><strong>Fecha:</strong> <% Response.Write(DateTime.Now.ToString());%></span></div>
<%
// Para Distribucion de Disposiciones x Estado
 idP0=Request.QueryString["idR1"]!="" ? Request.QueryString["idR1"]: "null";
 idP1=Request.QueryString["idR"]!="" ? Request.QueryString["idR"]: "null";
 strReportes = Request.QueryString["mC"];
idP4 = Request.QueryString["mF"]!=""? "'"+Request.QueryString["mF"]+"'": "null";

  try  { 
    //int sumaN=0; int sumaE=0; int sumaA=0; int sumaD=0; int sumaEs=0;      
   			dbManager.Open();		
			strSQL = "exec spReportes 9, "+ idP0 +","+ idP1 +",'A',"+ idP4 +"";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;	idP1=""; idP2=""; idP3="";	   
 
  while(dbManager.DataReader.Read()) {
	 if (sec < 1){
	
	 %>
<table  border="0" cellpadding="0" cellspacing="0" align="right"  width="960"  >
  <tr class="tituloGrid"  >
    <td width="15"   height="25" align="center" style="border-top:2px solid #333333; border-bottom:2px solid #333333;"></td>
    <td width="90" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center">Estado Actual</td>
    <td width="150" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center">Disposicion</td>
    <td width="150" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center">Responsable</td>
    <td width="100" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center">F. Inicio</td>
    <td width="100" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center">F. Final</td>
    <%if (strReportes.IndexOf("-1")>=0){ %>
    <td width="120" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center"> Avance</td> 
    <% } %>  
    <%if (strReportes.IndexOf("-2")>=0){ %>
    <td width="120" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center">Mensaje</td>
   <% } %> 
    <%if (strReportes.IndexOf("-3")>=0){ %>
    <td width="115" style="border-top:2px solid #333333; border-bottom:2px solid #333333;" align="center">Report&oacute;</td> 
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
					case 17: idP2="style='background:#9595FF;color: #ffffff;'";  idP3="style='border-bottom:solid 1px #f1f1f1;'"; break; //En validacion
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

<%

break;


}  
%>

</body>