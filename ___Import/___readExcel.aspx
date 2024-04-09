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


<link href="../___css/virtualcss.css" rel="stylesheet" type="text/css" />
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="../___Images/btn1.gif"  name="img"  hspace="1" class="clip" id="img" onClick="espacio();" title="Ocultar Menu Izquierdo"></td>
  </tr>
</table>
<form enctype="multipart/form-data" runat="server" method="post" id='frmUGC' name='frmUGC'>
  <%
	string titulo=".:: Archivo para Tema de Proyecto ::.";
%>
  <table width="75%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td style="border-bottom:solid 1 #CCCCCC"><table width="690" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr>
          <td width="46%" height="20" valign="bottom" bgcolor="#1C860E"><div align="center" class="titblanco">
            <div align="left"><strong>
              <% Response.Write("Subir Plan Semanal"); %>
            </strong></div>
          </div></td>
          <td width="3%" valign="top" bgcolor="#1C860E"><img src="../___Images/___login/as_esquinaAzulDerecha.gif" alt="" width="24" height="18" /></td>
          <td width="51%" >&nbsp;</td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="75%" border="0" align="center" cellpadding="0" cellspacing="0" class="gris">
    <tr>
      <td width="96%" ><table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
        <tr>
          <td width="12%"><div align="right" class="letra"><span class="style11">SEMANA:</span></div></td>
          <td width="83%">
          <asp:DropDownList id="cmbSemanas"
                    AutoPostBack="True"
                    runat="server" CssClass="letra">
                  <asp:ListItem Selected="True" Value="">No.</asp:ListItem>
               </asp:DropDownList></td>
          </tr>
        <tr>
          <td><div align="right" class="letra"><span class="style11">ARCHIVO:</span></div></td>
          <td valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="3%"><asp:FileUpload ID="SubirFile" runat="server" size="58"/></td>
              <td width="97%"><asp:ImageButton BorderStyle="none" BorderWidth="0" CssClass="link" Height="17" ID="Button_Subir" ImageUrl="../___Images/subir.jpg" runat="server" Width="75" OnClick="Button_Subir_Click" /></td>
            </tr>
          </table></td>
          </tr>
      </table></td>
      <td width="4%"><asp:ImageButton BorderStyle="none" BorderWidth="0" CssClass="link" Height="34" ID="Button_actualizar" ImageUrl="../___Images/refresh1.gif" runat="server" Width="34" OnClick="actualizar_Click" /></td>
      <td width="4%"><asp:ImageButton BorderStyle="none" BorderWidth="0" CssClass="link"  ID="Button_actualizar2" ImageUrl="../___Images/exce1.jpg" runat="server"  OnClick="export_Click" /></td>
    </tr>
  </table>
  <br />
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center" ><strong>
        <asp:Label ID="lblMensaje" runat="server" CssClass="letra"></asp:Label>
      </strong></td>
    </tr>
    <tr>
      <td align="center" ><strong>
        <asp:Label ID="lblTabla" runat="server" ></asp:Label>
      </strong></td>
    </tr>
  </table>
  <script runat="server">
  protected void Page_Load(object sender, EventArgs e)
        {
             for (int i=1;i<=60; i++){
				   cmbSemanas.Items.Add(new ListItem(i.ToString(),i.ToString()));
			   }
        }
  
  
  
  
  
  protected void export_Click(object sender, EventArgs e)
  {
 
 string semana="";
 semana = cmbSemanas.SelectedValue;
 // Response.Write("<script>window.open('___readExcel_export.aspx?semana="+semana+"','_blank')<script>");
 if  (semana!=""){
   lblTabla.Text = "";  
   
   Response.Redirect("___readExcel_export.aspx?semana="+semana);
  }else{
		  lblMensaje.Text = "Tiene que seleccionar una semana!";
		  lblTabla.Text = "";
		}	
  
  }
  
  
  
  protected void actualizar_Click(object sender, EventArgs e)
  {
 
 string strSQL="";  int i=0; string strReportes=""; string bgColor=""; string semana="";
 semana = cmbSemanas.SelectedValue; 
 
 if  (semana!=""){  		
  IDBManager dbManager = new DBManager(DataProvider.OleDb);
  dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();	
		
  try
   					{
					dbManager.Open();
  strSQL ="select *, case when (kg % tambatch) >0 then 'S' else 'N' end  as conDecimales , case when (kg % tambatch) >0 then 2 end as orden1 , case when tambatch is  null  then 1 end  as orden2, case when tambatch <=1 then 3 end  as orden3  from planes where semana = "+semana+" and prioridad=1 order by orden2 desc,orden1 desc,orden3 desc";
			   //Response.Write(strSQL);
			   
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
			   
			   
			                
			   strReportes +="<table width='90%' border='0' align='center' cellpadding='0' cellspacing='0' class='gris' >";
			   strReportes +="<tr><td height='20' valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>No.</strong>";
			   strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Codigo</strong>";
    
    strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'> <strong>Descripcion</strong></div></td>";
    strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong> Tam. Batch</strong></div></td>";
	    strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong> Kg.</strong></div></td>";
	 strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong> Batch</strong></div></td>";
	strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong> Fecha</strong></div></td>";
		strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Opcion</strong></div></td></tr>";
	// strTablaErrores +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Max. Batches</strong></div></td>";
	 
			   while(dbManager.DataReader.Read())
			   {
			   i++;			   
			   if ((i % 2)==0){
				  bgColor="#ffffff";
				}else{
				   bgColor="#E3FCE0";//"#CCF9C6";
			    } 
			   	
				if (dbManager.DataReader["tambatch"].ToString()=="") bgColor="#FFFF28";
				if (dbManager.DataReader["conDecimales"].ToString()=="S") bgColor="#00FF00";
				if (dbManager.DataReader["tambatch"].ToString()=="1.00") bgColor="#00FF00";
						  			   	
			   strReportes +="<tr><td bgcolor="+bgColor+" height='15'>&nbsp;"+i+"</td><td bgcolor="+bgColor+" height='15'>&nbsp;"+dbManager.DataReader["codigo"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["descripcion"].ToString()+"</td><td bgcolor="+bgColor+" align='right'>&nbsp;<input type='text' name='txtTamBatch"+i+"' id='txtTamBatch"+i+"' value='"+dbManager.DataReader["tambatch"].ToString()+"' size='7' class='Letra' /></td><td bgcolor="+bgColor+">&nbsp;<input type='text' name='txtKg"+i+"' id='txtKg"+i+"' value='"+dbManager.DataReader["kg"].ToString()+"' size='10' class='Letra' /></td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["batch"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["fechaPlan"].ToString()+"</td><td >&nbsp;<a href='#' onClick='javascript: var tamBatch=document.getElementById(\"txtTamBatch"+i+"\");var kG=document.getElementById(\"txtKg"+i+"\"); leerOpciones(\"../___Transactions/___sqlAjaxMrp.aspx;___readExcel.aspx?id=|idGrabar|GET|&typ=0&p1=\"+tamBatch.value.replace(\",\",\".\")+\"&p2=\"+kG.value.replace(\",\",\".\")+\"&p3="+dbManager.DataReader["id"].ToString()+"\"); '><img src='../___Images/as_registrarNota.gif' width='19' height='19' border='0'  title='Ingrese el Plan de Mejora del Estudiante'  /> </a><div id='idGrabar' ></div></td></tr>";
			   
			   }	       
			   strReportes +="</table>";
				
				
				
				//Response.Write(strTabla);
				dbManager.Dispose();
						  			  	  
         		}catch (Exception ex){
            		lblMensaje.Text = "ERROR: " + ex.Message.ToString();
         			}
	             
	 	
		
		lblTabla.Text = strReportes;
		lblMensaje.Text = "";
	
	 }else{
		  lblMensaje.Text = "Tiene que seleccionar una semana!";
		  lblTabla.Text = "";
		}	
  
  
  }
  
  protected void Button_Subir_Click(object sender, EventArgs e)
  {
 	string Extension= System.IO.Path.GetExtension (SubirFile.FileName);
	string strTabla =""; string strSQL="";  int i=0; string strBatches=""; string strTamBatches=""; string bgColor=""; string dias="";    string strTablaErrores =""; string nombrearch=""; string semana=""; string strReportes="";
	string[] matL;
	string[] matLineas;
	string[] matFechas={"","","","","","","",""};
	semana = cmbSemanas.SelectedValue;  
		
		if  (semana!=""){  			
		if (SubirFile.HasFile)
  			{		
  			if (Extension.ToUpper()== ".CSV")	
	  			{	
				//try
   					//{
          		//Para subir archivos
		  		SubirFile.SaveAs(MapPath(SubirFile.FileName));
		
		nombrearch = System.IO.Path.GetFileName(SubirFile.PostedFile.FileName);     
		//string[] lines = System.IO.File.ReadAllLines("C:\\inetpub\\wwwroot\\mrp\\___Import\\"+nombrearch);
		string[] lines = System.IO.File.ReadAllLines("C:\\inetpub\\wwwroot\\mrpPuembo\\___Import\\"+nombrearch);
        
		IDBManager dbManager = new DBManager(DataProvider.OleDb);
        dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();	
		int inicio=0;int w=0; double valor=0; double fin=0; 
       
		
	
		for (int z=0;z<lines.Length;z++){
		   matL = lines[z].Split(';');
		 
		   if (matL[0]=="C�digo"){
		      inicio=z+1; 
		       
			   matFechas = lines[z].Split(';');
		   } //break;
		   if (matL[0]=="Inventarios"){fin=z;} //break;
		   
		}
					
		w=inicio;
	       
		dbManager.Open();
		dbManager.ExecuteNonQuery(CommandType.Text,"delete from planes where semana="+semana+" and prioridad=1");
		
		//Response.Write(inicio+":"+fin+"<br>");
		//Response.Write(matFechas[12]+"<br>");
		for (int z=inicio;z<fin;z++){
		  //Response.Write(lines[z]+"Inicio"+z+"<br>");
		   matLineas = lines[z].Split(';');
		    strTamBatches = matLineas[5]!="" ? matLineas[5] : "null";
			   
			   //Para el dia viernes
				if (matLineas[12]!="" && matLineas[12]!="-"){
				if (double.Parse(matLineas[12])>0){
				valor = matLineas[5]!="" ? double.Parse(matLineas[12])/double.Parse(matLineas[5]): -1; 
				strBatches = valor.ToString().Replace(",",".");
				strSQL="insert into Planes ([CODIGO],[KG],[BATCH],[DIA],[ID_PLANTA],[codigoSecuencia],[prioridad],[fecha],[anio],[mes],[dias],[semana],[descripcion],tambatch, fechaPlan,secuencia,fecha_creacion,usuario,estado) VALUES ('"+matLineas[0]+"',"+matLineas[12]+","+strBatches+","+int.Parse(matFechas[12].Substring(matFechas[12].IndexOf(',')+1,2))+",1,null,1,getdate(),datepart(year, getdate()),datepart(month, getdate()),datepart(day, getdate()),'"+semana+"','"+matLineas[1]+"',"+strTamBatches+",'"+matFechas[12]+"',1,getdate(),'"+Session["sysNombreUsuario"].ToString()+"','A') ";
			 //Response.Write(strSQL+"<br>");
			 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 }
			 }
			
			 
			 //Para el sabado
			 if (matLineas[13]!="" && matLineas[13]!="-"){
			 if (double.Parse(matLineas[13])>0){
				valor = matLineas[5]!="" ? double.Parse(matLineas[13])/double.Parse(matLineas[5]): -1; 
				strBatches = valor.ToString().Replace(",",".");
				strSQL="insert into Planes ([CODIGO],[KG],[BATCH],[DIA],[ID_PLANTA],[codigoSecuencia],[prioridad],[fecha],[anio],[mes],[dias],[semana],[descripcion],tambatch, fechaPlan,secuencia,fecha_creacion,usuario,estado) VALUES ('"+matLineas[0]+"',"+matLineas[13]+","+strBatches+","+int.Parse(matFechas[13].Substring(matFechas[13].IndexOf(',')+1,2))+",1,null,1,getdate(),datepart(year, getdate()),datepart(month, getdate()),datepart(day, getdate()),'"+semana+"','"+matLineas[1]+"',"+strTamBatches+",'"+matFechas[13]+"',2,getdate(),'"+Session["sysNombreUsuario"].ToString()+"','A') ";
			 //Response.Write(strSQL+"<br>");
			 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 }
			 }
			
			//Para el Domingo
			 if (matLineas[14]!="" && matLineas[14]!="-"){
			 if (double.Parse(matLineas[14])>0){
				valor =matLineas[5]!=""? double.Parse(matLineas[14])/double.Parse(matLineas[5]):-1;
				strBatches = valor.ToString().Replace(",",".");
				strSQL="insert into Planes ([CODIGO],[KG],[BATCH],[DIA],[ID_PLANTA],[codigoSecuencia],[prioridad],[fecha],[anio],[mes],[dias],[semana],[descripcion],tambatch, fechaPlan,secuencia,fecha_creacion,usuario,estado) VALUES ('"+matLineas[0]+"',"+matLineas[14]+","+strBatches+","+int.Parse(matFechas[14].Substring(matFechas[14].IndexOf(',')+1,2))+",1,null,1,getdate(),datepart(year, getdate()),datepart(month, getdate()),datepart(day, getdate()),'"+semana+"','"+matLineas[1]+"',"+strTamBatches+",'"+matFechas[14]+"',3,getdate(),'"+Session["sysNombreUsuario"].ToString()+"','A') ";
			 //Response.Write(strSQL+"<br>");
			 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 }
			 }
			  
			//Para el Lunes
			if (matLineas[15]!="" && matLineas[15]!="-"){
			if (double.Parse(matLineas[15])>0){
				valor =matLineas[5]!="" ? double.Parse(matLineas[15])/double.Parse(matLineas[5]):-1;
				 strBatches = valor.ToString().Replace(",",".");
				strSQL="insert into Planes ([CODIGO],[KG],[BATCH],[DIA],[ID_PLANTA],[codigoSecuencia],[prioridad],[fecha],[anio],[mes],[dias],[semana],[descripcion],tambatch, fechaPlan,secuencia,fecha_creacion,usuario,estado) VALUES ('"+matLineas[0]+"',"+matLineas[15]+","+strBatches+","+int.Parse(matFechas[15].Substring(matFechas[15].IndexOf(',')+1,2))+",1,null,1,getdate(),datepart(year, getdate()),datepart(month, getdate()),datepart(day, getdate()),'"+semana+"','"+matLineas[1]+"',"+strTamBatches+",'"+matFechas[15]+"',4,getdate(),'"+Session["sysNombreUsuario"].ToString()+"','A') ";
			 //Response.Write(strSQL+"<br>");
			 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 }
			 }
			
			//Para el Martes
			if (matLineas[16]!="" && matLineas[16]!="-"){
			 if (double.Parse(matLineas[16])>0){
				valor =matLineas[5]!="" ? double.Parse(matLineas[16])/double.Parse(matLineas[5]):-1;
				strBatches = valor.ToString().Replace(",",".");
				strSQL="insert into Planes ([CODIGO],[KG],[BATCH],[DIA],[ID_PLANTA],[codigoSecuencia],[prioridad],[fecha],[anio],[mes],[dias],[semana],[descripcion],tambatch, fechaPlan,secuencia,fecha_creacion,usuario,estado) VALUES ('"+matLineas[0]+"',"+matLineas[16]+","+strBatches+","+int.Parse(matFechas[16].Substring(matFechas[16].IndexOf(',')+1,2))+",1,null,1,getdate(),datepart(year, getdate()),datepart(month, getdate()),datepart(day, getdate()),'"+semana+"','"+matLineas[1]+"',"+strTamBatches+",'"+matFechas[16]+"',5,getdate(),'"+Session["sysNombreUsuario"].ToString()+"','A') ";
			 //Response.Write(strSQL+"<br>");
			 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 }
			}
			
			//Para el Miercoles
			 if (matLineas[17]!="" && matLineas[17]!="-"){
			 if (double.Parse(matLineas[17])>0){
				valor =matLineas[5]!="" ? double.Parse(matLineas[17])/double.Parse(matLineas[5]): -1;
				strBatches = valor.ToString().Replace(",",".");
				strSQL="insert into Planes ([CODIGO],[KG],[BATCH],[DIA],[ID_PLANTA],[codigoSecuencia],[prioridad],[fecha],[anio],[mes],[dias],[semana],[descripcion],tambatch, fechaPlan,secuencia,fecha_creacion,usuario,estado) VALUES ('"+matLineas[0]+"',"+matLineas[17]+","+strBatches+","+int.Parse(matFechas[17].Substring(matFechas[17].IndexOf(',')+1,2))+",1,null,1,getdate(),datepart(year, getdate()),datepart(month, getdate()),datepart(day, getdate()),'"+semana+"','"+matLineas[1]+"',"+strTamBatches+",'"+matFechas[17]+"',6,getdate(),'"+Session["sysNombreUsuario"].ToString()+"','A') ";
			 //Response.Write(strSQL+"<br>");
			 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 }
			 }
		
		    //Para el Jueves
			if (matLineas[18]!="" && matLineas[18]!="-"){
			 if (double.Parse(matLineas[18])>0){
				valor =matLineas[5]!="" ? double.Parse(matLineas[18])/double.Parse(matLineas[5]): -1;
				strBatches = valor.ToString().Replace(",",".");
				strSQL="insert into Planes ([CODIGO],[KG],[BATCH],[DIA],[ID_PLANTA],[codigoSecuencia],[prioridad],[fecha],[anio],[mes],[dias],[semana],[descripcion],tambatch, fechaPlan,secuencia,fecha_creacion,usuario,estado) VALUES ('"+matLineas[0]+"',"+matLineas[18]+","+strBatches+","+int.Parse(matFechas[18].Substring(matFechas[18].IndexOf(',')+1,2))+",1,null,1,getdate(),datepart(year, getdate()),datepart(month, getdate()),datepart(day, getdate()),'"+semana+"','"+matLineas[1]+"',"+strTamBatches+",'"+matFechas[18]+"',7,getdate(),'"+Session["sysNombreUsuario"].ToString()+"','A') ";
			 //Response.Write(strSQL+"<br>");
			 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 }
		    }
		  
		    //Para el Viernes			
			if (matLineas[19]!="" && matLineas[19]!="-"){
			 if (double.Parse(matLineas[19])>0){
				valor =matLineas[5]!="" ? double.Parse(matLineas[19])/double.Parse(matLineas[5]): -1; 
				strBatches = valor.ToString().Replace(",",".");
				strSQL="insert into Planes ([CODIGO],[KG],[BATCH],[DIA],[ID_PLANTA],[codigoSecuencia],[prioridad],[fecha],[anio],[mes],[dias],[semana],[descripcion],tambatch, fechaPlan,secuencia,fecha_creacion,usuario,estado) VALUES ('"+matLineas[0]+"',"+matLineas[19]+","+strBatches+","+int.Parse(matFechas[19].Substring(matFechas[19].IndexOf(',')+1,2))+",1,null,1,getdate(),datepart(year, getdate()),datepart(month, getdate()),datepart(day, getdate()),'"+semana+"','"+matLineas[1]+"',"+strTamBatches+",'"+matFechas[19]+"',8,getdate(),'"+Session["sysNombreUsuario"].ToString()+"','A') ";
			 //Response.Write(strSQL+"<br>");
			 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
			 }
			}
			
		   
		}//end for lineas
            /*
               strSQL ="select dia,fechaPlan,count(*) as totalRegistros,min(batch) as minBatch,max(batch) as maxBatch  from Planes where batch>0  group by dia,fechaPLan  union all select 5000 as dia,null as fechaPlan,count(*) as totalRegistros,null as minBatch,null as maxBatch from Planes where batch>0 order by dia";
			  // Response.Write(strSQL);
			   
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
			                
			   strTabla +="<table width='90%' border='0' align='center' cellpadding='0' cellspacing='0' class='gris' >";
			   strTabla +="<tr><td height='20' width='25%' valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Dias</strong>";
    
    strTabla +="<td  valign='top' width='25%' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'> <strong>Registros</strong></div></td>";
    strTabla +="<td  valign='top' width='25%' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Min. Batches</strong></div></td>";
	 strTabla +="<td  valign='top' width='25%' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Max. Batches</strong></div></td>";
	 
		
			   
			   while(dbManager.DataReader.Read())
			   {
			   i++;
			   
			   if ((i % 2)==0){
				  bgColor="#ffffff";
				}else{
				   bgColor="#f1f1f1";
				  
			    } 
			   dias = dbManager.DataReader["fechaPlan"].ToString()!="" ?  dbManager.DataReader["fechaPlan"].ToString() : "Total Leidos"; 
			  			   	
			   strTabla +="<tr><td bgcolor="+bgColor+" height='15'>&nbsp;"+dias+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["totalRegistros"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["minBatch"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["maxBatch"].ToString()+"</td></tr>";
			   
			   }	       
			   strTabla +="</table>";
				
				//Para los Errores
				strSQL ="select T.codigo,T.dia, 'Batch con Decimales' as observacion from (select codigo,dia, (kg % tambatch) as conDecimales from planes ) as T where T.conDecimales>0 union all select codigo, dia,'Sin Tamaño de Batch' as observacion from Planes where tambatch is null";
			  // Response.Write(strSQL);
			   
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
			                
			   strTablaErrores +="<table width='90%' border='0' align='center' cellpadding='0' cellspacing='0' class='gris' >";
			   strTablaErrores +="<tr><td height='20' valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Codigo</strong>";
    
    strTablaErrores +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'> <strong>Dia</strong></div></td>";
    strTablaErrores +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong> Observacions</strong></div></td>";
	// strTablaErrores +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Max. Batches</strong></div></td>";
	 
		
			   
			   while(dbManager.DataReader.Read())
			   {
			   i++;
			   
			   if ((i % 2)==0){
				  bgColor="#ffffff";
				}else{
				   bgColor="#CCF9C6";
				  
			    } 
			   			  			   	
			   strTablaErrores +="<tr><td bgcolor="+bgColor+" height='15'>&nbsp;"+dbManager.DataReader["codigo"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["dia"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["observacion"].ToString()+"</td></tr>";
			   
			   }	       
			   strTablaErrores +="</table>";
				*/
				
				//Para Reporte
				strSQL ="select *, case when (kg % tambatch) >0 then 'S' else 'N' end  as conDecimales, case when (kg % tambatch) >0 then 2 end as orden1 , case when tambatch is  null  then 1 end  as orden2, case when tambatch <=1 then 3 end  as orden3 from planes where semana="+semana+" and prioridad=1 order by orden2 desc,orden1 desc,orden3 desc";
			  // Response.Write(strSQL);
			   
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
			   
			   
			                
			   strReportes +="<table width='90%' border='0' align='center' cellpadding='0' cellspacing='0' class='gris' >";
			   strReportes +="<tr><td height='20' valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>No.</strong>";
			   strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Codigo</strong>";
    
    strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'> <strong>Descripcion</strong></div></td>";
    strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong> Tam. Batch</strong></div></td>";
	    strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong> Kg.</strong></div></td>";
	 strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong> Batch</strong></div></td>";
	strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong> Fecha</strong></div></td>";
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
			   	
				if (dbManager.DataReader["tambatch"].ToString()=="") bgColor="#FFFF28";
				if (dbManager.DataReader["conDecimales"].ToString()=="S") bgColor="#00FF00";
				if (dbManager.DataReader["tambatch"].ToString()=="1.00") bgColor="#FFFF28";
				
						  			   	
			   strReportes +="<tr><td bgcolor="+bgColor+" height='15'>&nbsp;"+i+"</td><td bgcolor="+bgColor+" height='15'>&nbsp;"+dbManager.DataReader["codigo"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["descripcion"].ToString()+"</td><td bgcolor="+bgColor+" align='right'>&nbsp;<input type='text' name='txtTamBatch"+i+"' id='txtTamBatch"+i+"' value='"+dbManager.DataReader["tambatch"].ToString()+"' size='7' class='Letra' /></td><td bgcolor="+bgColor+">&nbsp;<input type='text' name='txtKg"+i+"' id='txtKg"+i+"' value='"+dbManager.DataReader["kg"].ToString()+"' size='10' class='Letra' /></td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["batch"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["fechaPlan"].ToString()+"</td><td >&nbsp;<a href='#' onClick='javascript: var tamBatch=document.getElementById(\"txtTamBatch"+i+"\");var kG=document.getElementById(\"txtKg"+i+"\"); leerOpciones(\"../___Transactions/___sqlAjaxMrp.aspx;___readExcel.aspx?id=|idGrabar|GET|&typ=0&p1=\"+tamBatch.value.replace(\",\",\".\")+\"&p2=\"+kG.value.replace(\",\",\".\")+\"&p3="+dbManager.DataReader["id"].ToString()+"\"); '><img src='../___Images/as_registrarNota.gif' width='19' height='19' border='0'  title='Ingrese el Plan de Mejora del Estudiante'  /> </a><div id='idGrabar' ></div></td></tr>";
			   
			   }	       
			   strReportes +="</table>";
				
				lblTabla.Text = strReportes;
		        lblMensaje.Text = "";
				
				//Response.Write(strTabla);
				dbManager.Dispose();
						  			  	  
         		/*}catch (Exception ex){
            		lblMensaje.Text = "ERROR: " + ex.Message.ToString();
         			}*/
	             
	 			}
   			else
     			{
      			lblMensaje.Text = "Solo se aceptan archivos Excel .CSV!! <br> Nombre del archivo: "+ SubirFile.FileName;
      			}
  			}	 
		else
  			{
    		lblMensaje.Text = "Tiene que subir un archivo, Es un campo obligatorio!";
   			}
	    }else{
		  lblMensaje.Text = "Tiene que seleccionar una semana!";
		  lblTabla.Text = "";
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
/*
string strReportes="";string strSQL=""; string bgColor="";
int i=0;
IDBManager dbManager = new DBManager(DataProvider.OleDb);
dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();	
		
try {
        dbManager.Open();
		strSQL ="select * from Planes ";
		dbManager.ExecuteReader(CommandType.Text,strSQL);
		
		strReportes +="<table width='90%' border='0' align='center' cellpadding='0' cellspacing='0' class='gris' >";
			   strReportes +="<tr><td height='20' valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Codigo</strong>";
    
    strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'> <strong>Dia</strong></div></td>";
    strReportes +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong> Observacions</strong></div></td>";
	// strTablaErrores +="<td  valign='top' background='../___Images/topGrid.gif'><div align='center' class='factLblIva'><strong>Max. Batches</strong></div></td>";
	 
		
			   
			   while(dbManager.DataReader.Read())
			   {
			   i++;
			   
			   if ((i % 2)==0){
				  bgColor="#ffffff";
				}else{
				   bgColor="#CCF9C6";
				  
			    } 
			   			  			   	
			   strReportes +="<tr><td bgcolor="+bgColor+" height='15'>&nbsp;"+dbManager.DataReader["codigo"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["dia"].ToString()+"</td><td bgcolor="+bgColor+">&nbsp;"+dbManager.DataReader["observacion"].ToString()+"</td></tr>";
			   
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
	             
	*/	
%>
</body>
</html>
