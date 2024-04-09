<%@ Register TagPrefix="MnA" TagName="MenuArriba" Src="../___Interface/___vsecure.ascx" %>
<%@ Register TagPrefix="MnL" TagName="Bloqueo" Src="../___Interface/___vlock.ascx" %>
<%@ Register TagPrefix="MnI" TagName="MenuIzquierdo" Src="../___Interface/___vLeft.ascx" %>

<MnL:Bloqueo id="MLock" runat="server"/>
<MnA:MenuArriba id="MTop" runat="server"/>


<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="DataAccessLayer" %>
<script src="../___Objects/___Client/___menu.js"></script>

<script src="../bootstrap/jquery-2.1.3.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../___Objects/___Client/___appSislab_Ajax.js"></script>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.css" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.Estilo6 {color: #999999}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sistema de Gestion Contable - SWC</title>

<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}


.gris{
display:block;width:100%;height:27px;padding:6px 12px;font-size:12px;line-height:1.42857143;color:#555;background-color:#fff;background-image:none;border:1px solid #ccc;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075);-webkit-transition:border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;-o-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s}


/* Para cambiar la decoracion de los tabuladores*/
.badge{display:inline-block;min-width:0px;padding:0px 0px;font-size:12px; font-family: Arial, Helvetica, sans-serif;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;background-color:#009900;border-radius:10px}.badge:empty{display:none}.btn .badge{position:relative;top:-1px}.btn-xs .badge{top:0;padding:0px 0px}a.badge:focus,a.badge:hover{color:#fff;text-decoration:none;cursor:pointer}.list-group-item.active>.badge,.nav-pills>.active>a>.badge{color:#337ab7;background-color:#fff}.list-group-item>.badge{float:right}.list-group-item>.badge+.badge{margin-right:5px}.nav-pills>li>a>.badge{margin-left:3px}


/* Para cambiar la barra de navegacion*/
.nav{padding-left:0;margin-bottom:0;list-style:none}.nav>li{position:relative;display:block}.nav>li>a{position:relative;display:block;padding:7px 13px}.nav>li>a:focus,.nav>li>a:hover{text-decoration:none;background-color:#5cb85c}.nav>li.disabled>a{color:#777}.nav>li.disabled>a:focus,.nav>li.disabled>a:hover{color:#777;text-decoration:none;cursor:not-allowed;background-color:transparent}.nav .open>a,.nav .open>a:focus,.nav .open>a:hover{background-color:#eee;border-color:#337ab7}.nav .nav-divider{height:1px;margin:9px 0;overflow:hidden;background-color:#e5e5e5}.nav>li>a>img{max-width:none}.nav-tabs{border-bottom:1px solid #ddd}.nav-tabs>li{float:left;margin-bottom:-1px}.nav-tabs>li>a{margin-right:3px;line-height:1.42857143;border: 1px solid transparent;border-radius:10px 10px 0 0}.nav-tabs>li>a:hover{border-color:#eee #eee #ddd}.nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover{color:#555;cursor:default;background-color:#fff;border:1px solid #ddd;border-bottom-color:transparent}.nav-tabs.nav-justified{width:100%;border-bottom:0}.nav-tabs.nav-justified>li{float:none}.nav-tabs.nav-justified>li>a{margin-bottom:5px;text-align:center}.nav-tabs.nav-justified>.dropdown .dropdown-menu{top:auto;left:auto}@media (min-width:768px){.nav-tabs.nav-justified>li{display:table-cell;width:1%}.nav-tabs.nav-justified>li>a{margin-bottom:0}}

.titulo {color: #ffffff;
	font-size: 15px;
	font-family: Verdana, Arial, Helvetica, sans-serif;}
	
.Estilo2 {
	color: #FFFFFF;
	font-size: 15px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}


.button_example{
border:1px solid #25729a; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;font-size:12px;font-family:arial, helvetica, sans-serif; padding: 1px 1px 1px 1px; text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF;
 background-color: #3093c7; background-image: -webkit-gradient(linear, left top, left bottom, from(#3093c7), to(#1c5a85));
 background-image: -webkit-linear-gradient(top, #3093c7, #1c5a85);
 background-image: -moz-linear-gradient(top, #3093c7, #1c5a85);
 background-image: -ms-linear-gradient(top, #3093c7, #1c5a85);
 background-image: -o-linear-gradient(top, #3093c7, #1c5a85);
 background-image: linear-gradient(to bottom, #3093c7, #1c5a85);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#3093c7, endColorstr=#1c5a85);
}

.modal-open{overflow:hidden}.modal{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;display:none;overflow:hidden;-webkit-overflow-scrolling:touch;outline:0}.modal.fade .modal-dialog{-webkit-transition:-webkit-transform .3s ease-out;-o-transition:-o-transform .3s ease-out;transition:transform .3s ease-out;-webkit-transform:translate(0,-25%);-ms-transform:translate(0,-25%);-o-transform:translate(0,-25%);transform:translate(0,-25%);}.modal.in .modal-dialog{-webkit-transform:translate(0,0);-ms-transform:translate(0,0);-o-transform:translate(0,0);transform:translate(0,0)}.modal-open .modal{overflow-x:hidden;overflow-y:auto}.modal-dialog{position:relative;width:auto;margin:10px}.modal-content{position:relative;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,.2);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,.5);box-shadow:0 3px 9px rgba(0,0,0,.5)}.modal-backdrop{position:absolute;top:0;right:0;left:0;background-color:#000}.modal-backdrop.fade{filter:alpha(opacity=0);opacity:0}.modal-backdrop.in{filter:alpha(opacity=50);opacity:.5}.modal-header{min-height:16.43px;padding:15px;border-bottom:1px solid #e5e5e5 }.modal-header .close{margin-top:-2px}.modal-title{margin:0;line-height:1.42857143}.modal-body{position:relative;padding:15px}.modal-footer{padding:15px;text-align:right;border-top:1px solid #e5e5e5}.modal-footer .btn+.btn{margin-bottom:0;margin-left:5px}.modal-footer .btn-group .btn+.btn{margin-left:-1px}.modal-footer .btn-block+.btn-block{margin-left:0}.modal-scrollbar-measure{position:absolute;top:-9999px;width:50px;height:50px;overflow:scroll}@media (min-width:768px){.modal-dialog{width: 60% ;margin:30px auto}.modal-content{-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}.modal-sm{width:300px}}@media (min-width:600px){.modal-lg{width:600px}


.close{float:right;font-size:21px;font-weight:700;line-height:1;color:#000;text-shadow:0 1px 0 #fff;filter:alpha(opacity=20);opacity:.2}.close:focus,.close:hover{color:#000;text-decoration:none;cursor:pointer;filter:alpha(opacity=50);opacity:.5}button.close{-webkit-appearance:none;padding:0;cursor:pointer;background:0 0;border:0}



</style>

<style>
/* Style The Dropdown Button */
.dropbtn {
    background-color: #3366FF;
    color: white;
    padding: 6px;
    font-size: 15px;
    border: none;
    cursor: pointer;
	
	
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
	background-color: #FFFFFF;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 150px;
    box-shadow:  0px 8px 16px 0px rgba(0,0,0,0.2);
	font-size: 14px;
	font-family:  Arial, Helvetica, sans-serif;
    line-height: normal;
	text-shadow: none;
	
 
	
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 8px 12px;
    text-decoration: none;
    display: block;
	font-size: 14px;
	font-family:  Arial, Helvetica, sans-serif;
    line-height: normal;
	text-shadow: none;
	text-align:left;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}


.bordeTabla{
	font-family: Arial, Helvetica, sans-serif;
	color:#333333;
	font-size:10pt;
	background-color: #FFFFFF;
	border-top: 1px none #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 1px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
	font-weight: bold;


}



</style>





<script>

function indice(parametros, divID){

var obj = eval("document.getElementById('"+divID+"')");

lstParams=parametros.split('|');
strOutput="";

if (parametros.indexOf ('|')>0){
for ( i = 0; i <= lstParams.length-1 ; i++ ) {
		 lstTags=lstParams[i].split(';');
		  strOutput+="<a href=\"" + lstTags[0] + "\">" + lstTags[1] + "</a>";							
	} 
}else{
  lstTags=parametros.split(';');
  strOutput+="<a href=\"" + lstTags[0] + "\">" + lstTags[1] + "</a>";
}
 
  obj.innerHTML = strOutput;

}

</script>
</head>
<%
string tipo = Request.QueryString["p"]!="" ? Request.QueryString["p"]: "";
if (tipo==""){ 
%>
<body >
<%
}else{
string id = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";
string pID = Request.QueryString["pID"]!="" ? Request.QueryString["pID"]: "";
%>
<body  onLoad="generalJS('0','frmMeta|___doMain.aspx|idTemp;idTemp|idHome|GET|&id=<%=id%>&pID=<%=pID%>');" >
<%
}


%>
<form action="#" name="frmMeta" >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#000E4D"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="75%" height="25" align="left" bgcolor="#000E4D"><span class="Estilo2">&nbsp; &nbsp;Analista: <%=Session["sysNombres"]%> <%=Session["sysApellidos"]%>  
        </span></td>
        <td width="100" align="right" bgcolor="#000E4D"><div class="dropdown" id="drop1" style="z-index: 10">
          <button class="dropbtn" id="btn1" onMouseMove="javascript: indice('#;Por Numero|#;Por Nombre|#;Por Estado','listaID1');"   >Buscar</button>
          <div class="dropdown-content" id="listaID1" ></div>
       </div>       
        </td>     
      <td width="150"> <div class="dropdown"  id="drop2" style="z-index: 10">
          <button class="dropbtn" id="btn2" onMouseMove="javascript: indice('#;Cambiar clave|#;Registrar correo','listaID2');"   >Herramientas</button>
          <div class="dropdown-content" id="listaID2" ></div>
     </div></td>
            <td width="50"><div class="dropdown"  id="drop3" style="z-index: 10">
          <button class="dropbtn" id="btn3" onMouseMove="javascript: indice('#;Informe resumido|#;Informe detallado','listaID3');"  >Imprimir</button>
          <div class="dropdown-content" id="listaID3" ></div>
      </div> </td>    
     <td width="50"><div class="dropdown"  id="drop4" style="z-index: 10">
          <button class="dropbtn" id="btn4" onMouseMove="javascript: indice('#;Descarga manual|#;Contactenos','listaID4');"  >Ayuda</button>
          <div class="dropdown-content" id="listaID4" ></div>
      </div> </td>
       <td width="50"><div class="dropdown"  id="drop5" style="z-index: 10">
          <button class="dropbtn" id="btn5" onMouseMove="javascript: indice('#;Cerrar sesion','listaID5');"  >Salir</button>
          <div class="dropdown-content" id="listaID5" ></div>
      </div> </td>
        <td width="5%" align="right" bgcolor="#000E4D">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="25%"><br>
	
     <div class='modal fade' id='validador' tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel' aria-hidden='true'><div class='modal-dialog' id='modalValidador'><div class='modal-content' id='contenidoValidador'><div class='modal-header' id='headerValidador' ><button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
        <div id='idValidador' style="height:370px;" ></div></div></div></div></div>
    
    
    
    <div id='idMenuIzquierdo' style='width: 200; height:600px; overflow: auto;'><MnI:MenuIzquierdo id="MIzquierdo" runat="server"/></div></td>
    <td width="84%" valign="top">    
      <br>
      <br>
      <input type="hidden" id="idTemp" />
      <div id='idHome' style=" position:relative ; left:5px; top:10px; width:100%;" ></div>
    </td>
  </tr>
</table>
</form>

</body>
</html>
