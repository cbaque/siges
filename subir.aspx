<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="DataAccessLayer" %>
<% Response.CacheControl = "no-cache"; %>
<script src="../___Objects/___Client/___j.js"></script>
<script src="../___Objects/___Client/___appSislab_Ajax.js"></script>
<script language="javascript">
function createAjaxObject() {
     
	 var http_request = false;
      if (window.XMLHttpRequest) { // Mozilla, Safari,...
         http_request = new XMLHttpRequest();
      } else if (window.ActiveXObject) { // IE
         try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
         } catch (e) {
            try {
               http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
         }
      }
      if (!http_request) {
         alert('Cannot create XMLHTTP instance');
         return false;
      }
	  if (http_request.overrideMimeType) {
            http_request.overrideMimeType('text/xml');
      }
      return http_request;
   }


function leerOpciones (parametros){
	var i,url,strURL,tipo,lstUrls,valores,id;
	         lstParams=parametros.split('|'); 
	 		lstUrls=lstParams[0].split(';')
			url =  lstUrls[0];
			divId = lstParams[1];
			metodo = lstParams[2];
			tipo = lstParams[3];
			strURL = url+'?';
			
			strURL += tipo;				
			//alert (strURL);
		
		
		   /***********************************************************************************
		   *             Para AJAX
		   *************************************************************************************/
						
			var lo_container;
			lo_container = document.getElementById(divId);			
			
			var lo_ajax=createAjaxObject();
			lo_container.innerHTML= "<img src='../___images/orange.gif' align='center' >Guardando...";
		     
			 /********************************************
			    Create popup Message
			 **********************************************/
		        
				x=(event.screenX)/2;
                y=5;
				/*var popup = document.createElement('div');
				popup.className = 'popup';
				var nombre = 'idMensaje' + Math.random( ) * 3000;
				popup.id = nombre;
				popup.style.left= x+"px";
                popup.style.top=y+"px";
								
				var cancel = document.createElement('div');
				cancel.className = 'cancel';
				//cancel.innerHTML = 'close';
				cancel.onclick = function (e) { popup.parentNode.removeChild(popup) };
								
				var message = document.createElement('span');
				message.innerHTML = "Guardando<br>Por favor espere ...<br><img src='../___images/orange.gif' align='center' >";
				popup.appendChild(message);                                    
				popup.appendChild(cancel);
				document.body.appendChild(popup);*/
		  
		  
			if(metodo==undefined){
				metodo="GET";
			}
	
			lo_ajax.open(metodo, strURL,true);
			lo_ajax.onreadystatechange = function() {
					if (lo_ajax.readyState==4) {
						     lo_container.innerHTML = lo_ajax.responseText;
						  	  //popup.parentNode.removeChild(popup);
							   //alert ('.:: Sistema Academico CEBI ::. \n\n El registro se \n completo correctamente \n ');
							  //setTimeout("",2000);
                              //window.location=lstUrls[1]+tipo; 
							  //window.location.reload();
					} 
			}
			
			if(metodo=="GET"){
				lo_ajax.send(null);
			} else {
				lo_ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				lo_ajax.send(null);
			}
		
	
}





</script>
<!--<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">-->


<link href="../___css/tema1.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin t&iacute;tulo</title>
</head>
<body>

<form enctype="multipart/form-data" runat="server" method="post" id='frmUGC' name='frmUGC' action="#" >
  <%
	string titulo=".:: Archivo para Tema de Proyecto ::.";
%>
  <table width="75%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td style="border-bottom:solid 1 #CCCCCC">&nbsp;</td>
    </tr>
  </table>
  <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
    <tr>
      <td width="12%"><div align="right" ><span class='detalleDisposicion'>ARCHIVO:</span></div></td>
      <td width="83%" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="3%"><asp:FileUpload ID="SubirFile" runat="server"  /></td>
            <td width="97%"><asp:Button BorderStyle="none" Width="80"  Height="30" BorderWidth="0"  ID="Button_Subir"  runat="server" OnClick="Button_Subir_Click" CssClass="btn btn-success btn-ms"  Text="Subir " /></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center" ><strong>
        <asp:Label ID="lblMensaje" runat="server" CssClass="letra"></asp:Label>
      </strong></td>
    </tr>
    <tr>
      <td align="center" ><strong>
        <asp:Label ID="lblTabla" runat="server" ></asp:Label>
        <asp:hiddenfield id="lblID"
              
              value="" 
              runat="server"/>
        
     
      </strong></td>
    </tr>
  </table>
  <script runat="server">
  
 
  
  protected void Page_Load(object sender, EventArgs e)
        {
           string idDisposicion = Request.QueryString["id"];
          // string  idRrhh = Request.QueryString["idR"];  
		   lblID.Value = idDisposicion;
        }
  
  
  
  protected void Button_Subir_Click(object sender, EventArgs e)
  {
 	string Extension="";
	string strSQL="";  string nombrearch="";double filesize=-1; string edicion="";
	IDBManager dbManager = new DBManager(DataProvider.OleDb);
    dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();	
	try{		
		Extension= System.IO.Path.GetExtension (SubirFile.FileName);
		if (SubirFile.HasFile){		
  			if (Extension.ToUpper()== ".PDF"){					  
				   filesize = SubirFile.FileBytes.Length;
				   lblMensaje.Text=filesize.ToString();
				   if (filesize < 3670016){
				
				
          		//Para subir archivos
		  		SubirFile.SaveAs(MapPath(SubirFile.FileName));
		
		nombrearch = System.IO.Path.GetFileName(SubirFile.PostedFile.FileName);     
		
		
		edicion= "R";
       		   
		dbManager.Open();
		strSQL = "SP_DISPOSICIONES  14,"+Session["sysIdTipoRrhh"]+","+Session["sysIdPlanta"].ToString()+",'A','"+edicion+"',"+lblID.Value+",null,null,null,"+Session["sysIdRrhh"].ToString()+",null,null,null,'"+Extension.ToUpper()+"','"+nombrearch+"',null,null,null,null,null,null,null,"+Session["sysIdRrhhAsociado"].ToString()+"";
		
		 //Response.Write(strSQL);
		
		dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
		
	             
	 	}else{lblMensaje.Text = "El Tamanio Maximo del Archivo es 3 Megas: "+ filesize.ToString();}	
		}else{lblMensaje.Text = "Solo Archivos PDF <br> Nombre del archivo: "+ SubirFile.FileName;}
		}else{lblMensaje.Text = "Tiene que subir un archivo, Es un campo obligatorio!";}	
	
	}catch (Exception ex){lblMensaje.Text = "ERROR: " + ex.Message.ToString();}
	finally{dbManager.Dispose(); SubirFile.Dispose();}	
}
	
	
	
</script>
  <!--img id="imagen" src="http://www.karlankas.net/chufa2.jpg" onerror="this.src='http://www.karlankas.net/chufa2.jpg'" name="juan"-->

<%

string strReportes="";string strSQL=""; string bgColor=""; string idDisposicion = ""; 
int i=0;
idDisposicion=Request.QueryString["id"];
 
IDBManager dbManager = new DBManager(DataProvider.OleDb);
dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();	

try {
        dbManager.Open();
		strSQL ="exec spNotificaciones 5,102, null,'A',"+idDisposicion+" ";
		//Response.Write(strSQL);
		//dbManager.ExecuteReader(CommandType.Text,strSQL);
		
		strReportes +="<table width='99%' border='0' align='center' cellpadding='0' cellspacing='1' >";
			   strReportes +="<tr class='tituloGrid'><td height='22' width='3%' valign='top' class='colorGrid' ><div align='center' ><strong>No.</strong></div></td><td valign='top' class='colorGrid' width='15%'><div align='center' ><strong>Fecha</strong></div></td>";
    
    strReportes +="<td  valign='top' class='colorGrid' width='40%'><div align='center' > <strong>Archivo</strong></div></td>";
	strReportes +="<td  valign='top' class='colorGrid' width='27%'><div align='center' > <strong>Usuario</strong></div></td>";
    strReportes +="<td  valign='top' class='colorGrid' width='7%'><div align='center' > <strong>Tipo</strong></div></td>";
	strReportes +="<td  valign='top' class='colorGrid' width='5%'><div align='center' ><strong></strong></div></td><td valign='top' class='colorGrid' width='4%' align='center' ></td></tr>";
	// strTablaErrores +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Max. Batches</strong></div></td>";
	 
		 
			   
			   while(dbManager.DataReader.Read())
			   {
			   i++;
			   
			   if ((i % 2)==0){
				  bgColor="#F0F0FF";
				}else{
				   bgColor="#ffffff";
				  
			    } 
			   			  			   	
			   strReportes +="<tr class='detalleDisposicion'><td bgcolor="+bgColor+" height='25'>&nbsp;"+i+"</td><td bgcolor="+bgColor+" height='20'>&nbsp;"+dbManager.DataReader["fecha"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["archivo"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["usuario"].ToString()+"</td><td bgcolor="+bgColor+" align='center'>&nbsp;"+dbManager.DataReader["tipo"].ToString()+"</td><td bgcolor="+bgColor+" align='center'><a href='#' onClick='MM_openBrWindow(\""+dbManager.DataReader["archivo"].ToString()+"\",\"hijoSIGES\",\"status=yes,width=950,height=700\");' class='btn btn-primary btn-xs'> Ver </a></td><td align='center'><input type='hidden' id='idTempArc"+i+"' value='"+ dbManager.DataReader["id"].ToString() +"' /><a href='#' class='btn btn-warning btn-xs' onclick='javascript: if (confirm(\"Esta Seguro de eliminar el archivo?\")){ generalJS(\"0\",\"frmUGC|../___Transactions/___sqlAjax2.aspx|idTempArc"+i+";idTempArc"+i+"|eliminarArchivo|GET|&id="+idDisposicion+"&typ=10\");}' >X</a></td></tr>";
			   
			   }	       
			   strReportes +="</table><div id='eliminarArchivo' align='center' ></div>";
				
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
	             
		
%>
</form>
</body>
</html>
