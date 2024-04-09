<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<script src="../___Objects/___Client/___menu.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="DataAccessLayer" %>
<script src="../___Objects/___Client/___j.js"></script>
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
			//lo_container.innerHTML= "<img src='../../images/loading.gif' align='center' >Guardando...";
		     
			 /********************************************
			    Create popup Message
			 **********************************************/
		        
				x=(event.screenX)/2;
                y=5;
				var popup = document.createElement('div');
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
				document.body.appendChild(popup);
		  
		  
			if(metodo==undefined){
				metodo="GET";
			}
	
			lo_ajax.open(metodo, strURL,true);
			lo_ajax.onreadystatechange = function() {
					if (lo_ajax.readyState==4) {
						     lo_container.innerHTML = lo_ajax.responseText;
						  	  popup.parentNode.removeChild(popup);
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


<style type="text/css">
<!--
.popup{
	position:absolute;
	/*top:50px;
    left:200px; */
    margin:100px auto;
	width:150px;
	height:50px;
	font-family:verdana;
	font-size:13px;
	padding:10px;
	background-color:#FFFFFF;
	border: 1px solid grey;
	z-index:100000000000000000;
    }
    
.cancel{
    display:relative;
    cursor:pointer;
    margin:0;
    float:right;
    height:10px;
    width:14px;
    padding:0 0 5px 0;
    text-align:center;
    font-weight:bold;
    font-size:11px;
    color:white;
    border-radius:3px;
    z-index:100000000000000000;
    }

.cancel:hover{
    background:rgb(255,20,20);
    }
.plan:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #333333;
	text-decoration: none;
	height: 50px;
	width: 300px;
}

.detalleDisposicion{
	color: #666666;
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

.tituloGrid {color: #ffffff;
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	text-decoration: none;}


.btn{display:inline-block;padding:6px 12px;margin-bottom:0;font-size:14px;font-weight:400;line-height:1.42857143;text-align:center;white-space:nowrap;vertical-align:middle;-ms-touch-action:manipulation;touch-action:manipulation;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-image:none;border:1px solid transparent;border-radius:4px}.btn.active.focus,.btn.active:focus,.btn.focus,.btn:active.focus,.btn:active:focus,.btn:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}.btn.focus,.btn:focus,.btn:hover{color:#333;text-decoration:none}.btn.active,.btn:active{background-image:none;outline:0;-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);box-shadow:inset 0 3px 5px rgba(0,0,0,.125)}.btn.disabled,.btn[disabled],fieldset[disabled] .btn{pointer-events:none;cursor:not-allowed;filter:alpha(opacity=65);-webkit-box-shadow:none;box-shadow:none;opacity:.65}.btn-default{color:#333;background-color:#fff;border-color:#ccc}.btn-default.active,.btn-default.focus,.btn-default:active,.btn-default:focus,.btn-default:hover,.open>.dropdown-toggle.btn-default{color:#333;background-color:#e6e6e6;border-color:#adadad}.btn-default.active,.btn-default:active,.open>.dropdown-toggle.btn-default{background-image:none}.btn-default.disabled,.btn-default.disabled.active,.btn-default.disabled.focus,.btn-default.disabled:active,.btn-default.disabled:focus,.btn-default.disabled:hover,.btn-default[disabled],.btn-default[disabled].active,.btn-default[disabled].focus,.btn-default[disabled]:active,.btn-default[disabled]:focus,.btn-default[disabled]:hover,fieldset[disabled] .btn-default,fieldset[disabled] .btn-default.active,fieldset[disabled] .btn-default.focus,fieldset[disabled] .btn-default:active,fieldset[disabled] .btn-default:focus,fieldset[disabled] .btn-default:hover{background-color:#fff;border-color:#ccc}.btn-default .badge{color:#fff;background-color:#333}.btn-primary{color:#fff;background-color:#337ab7;border-color:#2e6da4}.btn-primary.active,.btn-primary.focus,.btn-primary:active,.btn-primary:focus,.btn-primary:hover,.open>.dropdown-toggle.btn-primary{color:#fff;background-color:#286090;border-color:#204d74}.btn-primary.active,.btn-primary:active,.open>.dropdown-toggle.btn-primary{background-image:none}.btn-primary.disabled,.btn-primary.disabled.active,.btn-primary.disabled.focus,.btn-primary.disabled:active,.btn-primary.disabled:focus,.btn-primary.disabled:hover,.btn-primary[disabled],.btn-primary[disabled].active,.btn-primary[disabled].focus,.btn-primary[disabled]:active,.btn-primary[disabled]:focus,.btn-primary[disabled]:hover,fieldset[disabled] .btn-primary,fieldset[disabled] .btn-primary.active,fieldset[disabled] .btn-primary.focus,fieldset[disabled] .btn-primary:active,fieldset[disabled] .btn-primary:focus,fieldset[disabled] .btn-primary:hover{background-color:#337ab7;border-color:#2e6da4}.btn-primary .badge{color:#337ab7;background-color:#fff}.btn-success{color:#fff;background-color:#5cb85c;border-color:#4cae4c}.btn-success.active,.btn-success.focus,.btn-success:active,.btn-success:focus,.btn-success:hover,.open>.dropdown-toggle.btn-success{color:#fff;background-color:#449d44;border-color:#398439}.btn-success.active,.btn-success:active,.open>.dropdown-toggle.btn-success{background-image:none}.btn-success.disabled,.btn-success.disabled.active,.btn-success.disabled.focus,.btn-success.disabled:active,.btn-success.disabled:focus,.btn-success.disabled:hover,.btn-success[disabled],.btn-success[disabled].active,.btn-success[disabled].focus,.btn-success[disabled]:active,.btn-success[disabled]:focus,.btn-success[disabled]:hover,fieldset[disabled] .btn-success,fieldset[disabled] .btn-success.active,fieldset[disabled] .btn-success.focus,fieldset[disabled] .btn-success:active,fieldset[disabled] .btn-success:focus,fieldset[disabled] .btn-success:hover{background-color:#5cb85c;border-color:#4cae4c}.btn-success .badge{color:#5cb85c;background-color:#fff}.btn-info{color:#fff;background-color:#5bc0de;border-color:#46b8da}.btn-info.active,.btn-info.focus,.btn-info:active,.btn-info:focus,.btn-info:hover,.open>.dropdown-toggle.btn-info{color:#fff;background-color:#31b0d5;border-color:#269abc}.btn-info.active,.btn-info:active,.open>.dropdown-toggle.btn-info{background-image:none}.btn-info.disabled,.btn-info.disabled.active,.btn-info.disabled.focus,.btn-info.disabled:active,.btn-info.disabled:focus,.btn-info.disabled:hover,.btn-info[disabled],.btn-info[disabled].active,.btn-info[disabled].focus,.btn-info[disabled]:active,.btn-info[disabled]:focus,.btn-info[disabled]:hover,fieldset[disabled] .btn-info,fieldset[disabled] .btn-info.active,fieldset[disabled] .btn-info.focus,fieldset[disabled] .btn-info:active,fieldset[disabled] .btn-info:focus,fieldset[disabled] .btn-info:hover{background-color:#5bc0de;border-color:#46b8da}.btn-info .badge{color:#5bc0de;background-color:#fff}.btn-warning{color:#fff;background-color:#f0ad4e;border-color:#eea236}.btn-warning.active,.btn-warning.focus,.btn-warning:active,.btn-warning:focus,.btn-warning:hover,.open>.dropdown-toggle.btn-warning{color:#fff;background-color:#ec971f;border-color:#d58512}.btn-warning.active,.btn-warning:active,.open>.dropdown-toggle.btn-warning{background-image:none}.btn-warning.disabled,.btn-warning.disabled.active,.btn-warning.disabled.focus,.btn-warning.disabled:active,.btn-warning.disabled:focus,.btn-warning.disabled:hover,.btn-warning[disabled],.btn-warning[disabled].active,.btn-warning[disabled].focus,.btn-warning[disabled]:active,.btn-warning[disabled]:focus,.btn-warning[disabled]:hover,fieldset[disabled] .btn-warning,fieldset[disabled] .btn-warning.active,fieldset[disabled] .btn-warning.focus,fieldset[disabled] .btn-warning:active,fieldset[disabled] .btn-warning:focus,fieldset[disabled] .btn-warning:hover{background-color:#f0ad4e;border-color:#eea236}.btn-warning .badge{color:#f0ad4e;background-color:#fff}.btn-danger{color:#fff;background-color:#d9534f;border-color:#d43f3a}.btn-danger.active,.btn-danger.focus,.btn-danger:active,.btn-danger:focus,.btn-danger:hover,.open>.dropdown-toggle.btn-danger{color:#fff;background-color:#c9302c;border-color:#ac2925}.btn-danger.active,.btn-danger:active,.open>.dropdown-toggle.btn-danger{background-image:none}.btn-danger.disabled,.btn-danger.disabled.active,.btn-danger.disabled.focus,.btn-danger.disabled:active,.btn-danger.disabled:focus,.btn-danger.disabled:hover,.btn-danger[disabled],.btn-danger[disabled].active,.btn-danger[disabled].focus,.btn-danger[disabled]:active,.btn-danger[disabled]:focus,.btn-danger[disabled]:hover,fieldset[disabled] .btn-danger,fieldset[disabled] .btn-danger.active,fieldset[disabled] .btn-danger.focus,fieldset[disabled] .btn-danger:active,fieldset[disabled] .btn-danger:focus,fieldset[disabled] .btn-danger:hover{background-color:#d9534f;border-color:#d43f3a}.btn-danger .badge{color:#d9534f;background-color:#fff}.btn-link{font-weight:400;color:#337ab7;border-radius:0}.btn-link,.btn-link.active,.btn-link:active,.btn-link[disabled],fieldset[disabled] .btn-link{background-color:transparent;-webkit-box-shadow:none;box-shadow:none}.btn-link,.btn-link:active,.btn-link:focus,.btn-link:hover{border-color:transparent}.btn-link:focus,.btn-link:hover{color:#23527c;text-decoration:underline;background-color:transparent}.btn-link[disabled]:focus,.btn-link[disabled]:hover,fieldset[disabled] .btn-link:focus,fieldset[disabled] .btn-link:hover{color:#777;text-decoration:none}.btn-group-lg>.btn,.btn-lg{padding:10px 16px;font-size:18px;line-height:1.3333333;border-radius:6px}.btn-group-sm>.btn,.btn-sm{padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}.btn-group-xs>.btn,.btn-xs{padding:1px 5px;font-size:12px;line-height:1.5;border-radius:3px}.btn-block{display:block;width:100%}.btn-block+.btn-block{margin-top:5px}input[type=button].btn-block,input[type=reset].btn-block,input[type=submit].btn-block{width:100%}

-->
</style>

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

<form enctype="multipart/form-data" runat="server" method="post" id='frmUGC' name='frmUGC'>
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
            <td width="3%"><asp:FileUpload ID="SubirFile" runat="server" size="58"/></td>
            <td width="97%"><asp:ImageButton BorderStyle="none" Width="50"  Height="25" BorderWidth="0"  ID="Button_Subir"  runat="server" OnClick="Button_Subir_Click" CssClass="btn btn-success btn-xs" BorderColor="#FFFFFF"   /></td>
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
 	string Extension= System.IO.Path.GetExtension (SubirFile.FileName);
	string strTabla =""; string strSQL="";  int i=0; string strBatches=""; string strTamBatches=""; string bgColor=""; string dias="";    string strTablaErrores =""; string nombrearch=""; string edicion=""; string strReportes="";
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
		
		nombrearch = System.IO.Path.GetFileName(SubirFile.PostedFile.FileName);     
		
		IDBManager dbManager = new DBManager(DataProvider.OleDb);
        dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();	
		int inicio=0;int w=0; double valor=0; double fin=0; 
         edicion= Session["sysEdicion"]=="0" ? "N" :"R";
		   
		dbManager.Open();
		strSQL = "SP_DISPOSICIONES  14,"+Session["sysIdTipoRrhh"]+","+Session["sysIdPlanta"].ToString()+",'A','"+edicion+"',"+lblID.Value+",null,null,null,"+Session["sysIdRrhh"].ToString()+",null,null,null,'"+Extension.ToUpper()+"','"+nombrearch+"',null,null,null,null,null,null,null,"+Session["sysIdRrhhAsociado"].ToString()+"";
		
		
		
		dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
		//lblTabla.Text = "Archivo Subido !!";
		
			
			/*
				
				//Para Reporte
				strSQL = "select * from dbo.sg_Archivos";
			  // Response.Write(strSQL);
			   
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
			   
			   
			                
			   strReportes +="<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0' class='gris' >";
			   strReportes +="<tr><td height='20' valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>No.</strong>";
			   strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Fecha</strong>";
    
    strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'> <strong>Archivo</strong></div></td>";
    strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong> Usuario</strong></div></td>";
	strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Opcion</strong></div></td></tr>";
	// strTablaErrores +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Max. Batches</strong></div></td>";
	 
			   while(dbManager.DataReader.Read())
			   {
			   i++;			   
			   if ((i % 2)==0){
				  bgColor="#ffffff";
				}else{
				   bgColor="#E3FCE0"; //"#CCF9C6";
			    } 
			   	
							
						  			   	
			   strReportes +="<tr class='detalleDisposicion'><td bgcolor="+bgColor+" height='15'>&nbsp;"+i+"</td><td bgcolor="+bgColor+" height='15'>&nbsp;"+dbManager.DataReader["fecha"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["nombre"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+Session["sysNombreUsuario"].ToString()+"</td><td >&nbsp;<a href='#' onClick='javascript: var tamBatch=document.getElementById(\"txtTamBatch"+i+"\");var kG=document.getElementById(\"txtKg"+i+"\"); leerOpciones(\"../___Transactions/___sqlAjaxMrp.aspx;___readExcel.aspx?id=|idGrabar|GET|&typ=0&p1=\"+tamBatch.value.replace(\",\",\".\")+\"&p2=\"+kG.value.replace(\",\",\".\")+\"&p3="+dbManager.DataReader["id"].ToString()+"\"); '><img src='../___Images/estado_ok.gif' width='19' height='19' border='0'  title='Ingrese el Plan de Mejora del Estudiante'  /> </a><div id='idGrabar' ></div></td></tr>";
			   
			   }	       
			   strReportes +="</table>";
				
				lblTabla.Text = strReportes;
		        lblMensaje.Text = "";
				
				//Response.Write(strTabla);
				dbManager.Dispose();
						  			  	  
         		//}catch (Exception ex){
            	//	lblMensaje.Text = "ERROR: " + ex.Message.ToString();
         		//	}
	             */
	 			}
   			else
     			{
      			lblMensaje.Text = "Solo Archivos PDF <br> Nombre del archivo: "+ SubirFile.FileName;
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
  <!--img id="imagen" src="http://www.karlankas.net/chufa2.jpg" onerror="this.src='http://www.karlankas.net/chufa2.jpg'" name="juan"-->
</form>
<%

string strReportes="";string strSQL=""; string bgColor=""; string idDisposicion = "";
int i=0;
idDisposicion=Request.QueryString["id"];
 
IDBManager dbManager = new DBManager(DataProvider.OleDb);
dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();	
		
try {
        dbManager.Open();
		strSQL ="exec spNotificaciones 5, "+Session["sysIdRrhh"].ToString()+", null,'A',"+idDisposicion+" ";
		dbManager.ExecuteReader(CommandType.Text,strSQL);
		
		strReportes +="<table width='99%' border='0' align='center' cellpadding='0' cellspacing='0' >";
			   strReportes +="<tr class='tituloGrid'><td height='22' width='3%' valign='top' bgcolor='#38A0FE'><div align='center' ><strong>No.</strong></div></td><td valign='top' bgcolor='#38A0FE' width='15%'><div align='center' ><strong>Fecha</strong></div></td>";
    
    strReportes +="<td  valign='top' bgcolor='#38A0FE' width='40%'><div align='center' > <strong>Archivo</strong></div></td>";
	strReportes +="<td  valign='top' bgcolor='#38A0FE' width='27%'><div align='center' > <strong>Usuario</strong></div></td>";
    strReportes +="<td  valign='top' bgcolor='#38A0FE' width='7%'><div align='center' > <strong>Tipo</strong></div></td>";
	strReportes +="<td  valign='top' bgcolor='#38A0FE' width='3%'><div align='center' ><strong></strong></div></td></tr>";
	// strTablaErrores +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Max. Batches</strong></div></td>";
	 
		
			   
			   while(dbManager.DataReader.Read())
			   {
			   i++;
			   
			   if ((i % 2)==0){
				  bgColor="#F0F0FF";
				}else{
				   bgColor="#ffffff";
				  
			    } 
			   			  			   	
			   strReportes +="<tr class='detalleDisposicion'><td bgcolor="+bgColor+" height='20'>&nbsp;"+i+"</td><td bgcolor="+bgColor+" height='20'>&nbsp;"+dbManager.DataReader["fecha"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["archivo"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["usuario"].ToString()+"</td><td bgcolor="+bgColor+" align='center'>&nbsp;"+dbManager.DataReader["tipo"].ToString()+"</td><td bgcolor="+bgColor+" align='center'><a href='#' onClick='MM_openBrWindow(\""+dbManager.DataReader["archivo"].ToString()+"\",\"hijoSIGES\",\"status=yes,width=950,height=700\");'> Ver </a></td></tr>";
			   
			   }	       
			   strReportes +="</table>";
				
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
</body>
</html>
