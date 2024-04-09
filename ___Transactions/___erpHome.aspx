<%@ Register TagPrefix="MnA" TagName="MenuArriba" Src="../___Interface/___vsecure.ascx" %>
<%@ Register TagPrefix="MnL" TagName="Bloqueo" Src="../___Interface/___vlock.ascx" %>
<%@ Register TagPrefix="MnI" TagName="MenuIzquierdo" Src="../___Interface/___vLeft.ascx" %>
<MnL:Bloqueo ID="MLock" runat="server" />
<MnA:MenuArriba ID="MTop" runat="server" />
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="DataAccessLayer" %>
<script src="../bootstrap/jquery-3.2.1.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../___Objects/___Client/___appSislab_Ajax.js"></script>
<script src="../___Objects/___Client/___j.js"></script>
<script src="../___Objects/___Client/___usingMd5.js"></script>
<script src="../___Objects/___Client/___Md5.js"></script>
<script src="../___Objects/___Client/jquery-ui.min.js"></script>
<link href="../___Objects/___Client/themes/flick/jquery-ui.min.css" rel="stylesheet" type="text/css">


<% if (Session["sysTema"].ToString()=="Blue") { %>
<link href="../___css/tema1.css" rel="stylesheet" type="text/css">
<script src="../___Objects/___Client/___menu.js"></script>
<%}%>
<% if (Session["sysTema"].ToString()=="Black") { %>
<link href="../___css/tema2.css" rel="stylesheet" type="text/css">
<script src="../___Objects/___Client/___menu1.js"></script>
<%}%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" data-bs-theme="dark">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Tr4ckPlan</title>
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/dist/icon/bootstrap-icons.min.css">

    <script>

        function indice(parametros, divID) {

            var obj = eval("document.getElementById('" + divID + "')");

            lstParams = parametros.split('|');
            strOutput = "";

            if (parametros.indexOf('|') > 0) {
                for (i = 0; i <= lstParams.length - 1; i++) {
                    lstTags = lstParams[i].split(';');
                    strOutput += "<a href=\"" + lstTags[0] + "\">" + lstTags[1] + "</a>";
                }
            } else {
                lstTags = parametros.split(';');
                strOutput += "<a href=\"" + lstTags[0] + "\">" + lstTags[1] + "</a>";
            }
            obj.innerHTML = strOutput;
        }


        var patron = new Array(2, 2, 4)
        var patron2 = new Array(1, 3, 3, 3, 3)
        function mascara(d, sep, pat, nums) {
            if (d.valant != d.value) {
                val = d.value
                largo = val.length
                val = val.split(sep)
                val2 = ''
                for (r = 0; r < val.length; r++) {
                    val2 += val[r]
                }
                if (nums) {
                    for (z = 0; z < val2.length; z++) {
                        if (isNaN(val2.charAt(z))) {
                            letra = new RegExp(val2.charAt(z), "g")
                            val2 = val2.replace(letra, "")
                        }
                    }
                }
                val = ''
                val3 = new Array()
                for (s = 0; s < pat.length; s++) {
                    val3[s] = val2.substring(0, pat[s])
                    val2 = val2.substr(pat[s])
                }
                for (q = 0; q < val3.length; q++) {
                    if (q == 0) {
                        val = val3[q]
                    }
                    else {
                        if (val3[q] != "") {
                            val += sep + val3[q]
                        }
                    }
                }
                d.value = val
                d.valant = val
            }
        }


        function soloNumeros(e) {
            var key = window.Event ? e.which : e.keyCode
            return (key >= 46 && key <= 57)
        }

        function barraProgreso(valor, divContenedor, divValor) {

            var objAncho = document.getElementById(divContenedor);
            var objValor = document.getElementById(divValor);

            var valAncho = Number(objAncho.offsetWidth);

            if (Number(valor) <= 50) objValor.className = "progress-bar progress-bar-info";
            if (Number(valor) > 50 && Number(valor) < 80) objValor.className = "progress-bar progress-bar-info";
            if (Number(valor) >= 80) objValor.className = "progress-bar progress-bar-info";

            objValor.style.width = (Number(valor) * valAncho) / 100;
            objValor.innerHTML = valor + '%';

        }



        function leerEtiquetas(parametros) {
            var i, url, strURL, tipo, lstUrls, valores, id;
            if (confirm("¿Seguro de Eliminar/Habilitar la actividad?")) {
                lstParams = parametros.split('|');
                form = lstParams[0];
                url = lstParams[1];
                lstTags = lstParams[2].split(';');
                metodo = lstParams[3];
                tipo = lstParams[4];
                divId = lstParams[5];
                strURL = url + '?';
                id = '';
                valores = '';

                for (i = 0; i < lstTags.length; i++) {

                    if (typeof (eval(form + '.' + lstTags[i])) != 'undefined') {
                        e = eval(form + '.' + lstTags[i]).value != '' ? eval(form + '.' + lstTags[i]).value : 'null';
                    } else {
                        e = 'null';
                    }
                    strURL += 'p' + i + '=' + e + '&';
                }

                strURL = strURL.substr(0, (strURL.length - 1));
                //alert (strURL);

                for (var i = 0; i < document.forms[0].elements.length; i++) {
                    var e = document.forms[0].elements[i];
                    //alert ('tipo=' + e.type +'Name=' + e.name+'IndexOF=' + e.name.indexOf(idCajaTexto)+'Valor='+e.value+'caja='+idCajaTexto);
                    if (e.type == 'checkbox' && e.checked && e.name != 'chk_All') {//&& e.name.indexOf(idCajaTexto)>=0
                        mat = e.name.split('_');
                        id += mat[1] + '|';
                        valores += mat[2] + '|';

                    }
                }
                //Para la matriz de Valores	
                id = id.substr(0, (id.length - 1));
                strURL += '&mF=' + id;
                //alert (strURL);		

                valores = valores.substr(0, (valores.length - 1));
                strURL += '&mC=' + valores;
                //	alert (strURL);




                //strURL = strURL.substr(0,(strURL.length-1)) + tipo;
                strURL += tipo;

                //salert (strURL);


                /***********************************************************************************
                *             Para AJAX
                *************************************************************************************/

                var lo_container;
                lo_container = document.getElementById(divId);

                var lo_ajax = createAjaxObject();

                /********************************************
                   Create popup Message
                **********************************************/
                /* 
                 x=(event.screenX);
                 y=5;
             	
                 var popup = document.createElement('div');
                 popup.className = 'popup';
                 popup.id = 'idMensaje' + Math.random( ) * 3000;
                 popup.style.left= x+"px";
                 popup.style.top=y+"px";
                 popup.style.zindex=60;
             	
             	
                 var cancel = document.createElement('div');
                 cancel.className = 'cancel';
                 //cancel.innerHTML = 'close';
                 cancel.onclick = function (e) { popup.parentNode.removeChild(popup) };
                             	
                 var message = document.createElement('span');
                 message.innerHTML = "Guardando Registros<br>Por favor espere ...<br><img src='../___Images/orange.gif' align='center' >";
                 popup.appendChild(message);                                    
                 popup.appendChild(cancel);
                 document.body.appendChild(popup);*/

                // fin


                if (metodo == undefined) {
                    metodo = "GET";
                }

                lo_ajax.open(metodo, strURL, true);
                lo_ajax.onreadystatechange = function () {
                    if (lo_ajax.readyState == 4) {
                        lo_container.innerHTML = lo_ajax.responseText;
                        //	  alert ('xxx');				
                        //Mensaje Final de Ingreso
                        // popup.parentNode.removeChild(popup);
                        iniTab('___sqlAjax.aspx|idTrama;idTrama|idProgramacion|GET|10');
                        //generalJS("0","frmMeta|___sqlAjax.aspx|cmbEstanteria;cmbEstanteria|idArchivos|GET|&typ=2&tab=2");
                        //alert ('.:: Sistema Academico CEBI ::. \n\n El registro se \n completo correctamente \n ');
                        // window.location=lstUrls[1]+tipo;
                        // window.location.reload();



                    }
                }

                if (metodo == "GET") {
                    lo_ajax.send(null);
                } else {
                    lo_ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    lo_ajax.send(null);
                }

            } // End confirm;
        }


        function leerReportes(parametros) {
            var i, url, strURL, tipo, lstUrls, valores, id;

            lstParams = parametros.split('|');
            form = lstParams[0];
            url = lstParams[1];
            lstTags = lstParams[2].split(';');
            metodo = lstParams[3];
            tipo = lstParams[4];
            divId = lstParams[5];
            strURL = url + '?';
            id = '';
            valores = '';

            for (i = 0; i < lstTags.length; i++) {

                if (typeof (eval(form + '.' + lstTags[i])) != 'undefined') {
                    e = eval(form + '.' + lstTags[i]).value != '' ? eval(form + '.' + lstTags[i]).value : 'null';
                } else {
                    e = 'null';
                }
                strURL += 'p' + i + '=' + e + '&';
            }

            strURL = strURL.substr(0, (strURL.length - 1));
            //alert (strURL);

            for (var i = 0; i < document.forms[0].elements.length; i++) {
                var e = document.forms[0].elements[i];
                //alert ('tipo=' + e.type +'Name=' + e.name+'IndexOF=' + e.name.indexOf(idCajaTexto)+'Valor='+e.value+'caja='+idCajaTexto);
                if (e.type == 'checkbox' && e.checked) {//&& e.name.indexOf(idCajaTexto)>=0
                    mat = e.name.split('_');
                    id += mat[1] + '|';
                    valores += mat[2] + '|';

                }
            }


            //Para la matriz de Valores	
            id = id.substr(0, (id.length - 1));
            strURL += '&mF=' + id;
            //alert (strURL);		

            valores = valores.substr(0, (valores.length - 1));
            strURL += '&mC=' + valores;
            //	alert (strURL);

            //Para dejar los valores en la caja de texto
            var opcionesReporte = eval('document.forms[0].idParametros');
            opcionesReporte.value = valores;



            //strURL = strURL.substr(0,(strURL.length-1)) + tipo;
            strURL += tipo;

            //alert (strURL);


            /***********************************************************************************
            *             Para AJAX
            *************************************************************************************/

            var lo_container;
            lo_container = document.getElementById(divId);

            var lo_ajax = createAjaxObject();

            /********************************************
               Create popup Message
            **********************************************/
            /*
            x=(event.screenX);
            y=5;
        	
            var popup = document.createElement('div');
            popup.className = 'popup';
            popup.id = 'idMensaje' + Math.random( ) * 3000;
            popup.style.left= x+"px";
            popup.style.top=y+"px";
            popup.style.zindex=60;
        	
        	
            var cancel = document.createElement('div');
            cancel.className = 'cancel';
            //cancel.innerHTML = 'close';
            cancel.onclick = function (e) { popup.parentNode.removeChild(popup) };
                        	
            var message = document.createElement('span');
            message.innerHTML = "Guardando Registros<br>Por favor espere ...<br><img src='../___Images/orange.gif' align='center' >";
            popup.appendChild(message);                                    
            popup.appendChild(cancel);
            document.body.appendChild(popup);*/

            // fin


            if (metodo == undefined) {
                metodo = "GET";
            }

            lo_ajax.open(metodo, strURL, true);
            lo_ajax.onreadystatechange = function () {
                if (lo_ajax.readyState == 4) {
                    lo_container.innerHTML = lo_ajax.responseText;
                    //	  alert ('xxx');				
                    //Mensaje Final de Ingreso
                    // popup.parentNode.removeChild(popup);
                    //iniTab('___sqlAjax.aspx|idTrama;idTrama|idProgramacion|GET|10');
                    //generalJS("0","frmMeta|___sqlAjax.aspx|cmbEstanteria;cmbEstanteria|idArchivos|GET|&typ=2&tab=2");
                    //alert ('.:: Sistema Academico CEBI ::. \n\n El registro se \n completo correctamente \n ');
                    // window.location=lstUrls[1]+tipo;
                    // window.location.reload();



                }
            }

            if (metodo == "GET") {
                lo_ajax.send(null);
            } else {
                lo_ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                lo_ajax.send(null);
            }


        }

        function calenJquery(caja) {
            $("#" + caja).datepicker({
                showOn: 'button',
                buttonText: 'Show Date',
                buttonImageOnly: true,
                buttonImage: '../___Images/calenD.png',
                dateFormat: 'dd/mm/yy',
                theme: 'blitzer',
                changeMonth: true,
                changeYear: true
            });
        }

    </script>

    <style type="text/css">
        .ui-datepicker {
            font-size: 10pt !important
        }
    </style>
</head>
<body onload="generalJS('0','frmMeta|graficoCentro.aspx|idTemp;idTemp|idHome|GET|&j0=<%=Request.QueryString["j0"]%>&j1=<%=Request.QueryString["j1"]%>');">
    <!--generalJS('0','frmMeta|___sqlAjax.aspx|idTemp;idTemp|idHome|GET|&typ=8')-->

    <form action="#" name="frmMeta">
        <div class='modal fade' id='validador' tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel' aria-hidden='true' data-backdrop="static" data-keyboard="false">
            <div class='modal-dialog' id='modalValidador'>
                <div class='modal-content' id='contenidoValidador'>
                    <div class='modal-header' id='headerValidador'>
                        <button type='button' class='close' data-dismiss='modal' aria-label='Close' onclick="javascript: window.location.reload();">
                            <span aria-hidden='true'>&times;</span>
                        </button>
                        <div class='modal-title' id='exampleModalLabel'></div>
                    </div>
                    <div id='idValidador' style="height: 500px;"></div>
                </div>
            </div>
        </div>
        <%
string tipoEdicion = Session["sysEdicion"]!=null ? Session["sysEdicion"].ToString() :"-1";
        %>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tbHome" style="margin-top: 10px !important">

            <tr>
                <td>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="75%" height="24" align="left">&nbsp; &nbsp;
                            <%
		                        switch (tipoEdicion){
                                case "0":
		                        Response.Write("<a href='#' class='tooltip1'> Gestor: " +Session["sysNombreUsuario"]+ " ( "+ Session["sysDireccion"] +" )"  +"<span>Delegado: "+Session["sysUsuarioAsociado"]+"</span></a>");
		                        break;
		                        case "1":
		                        Response.Write("<a href='#' class='tooltip1' > Analista: " + Session["sysNombreUsuario"]+ " ( "+ Session["sysDireccion"] +" )" +"<span>Delegado: "+Session["sysUsuarioAsociado"]+"</span></a>");
		                        break;
		                        case "2":
		                        Response.Write("Admin: " + Session["sysNombreUsuario"]);
		                        break;
		                        }
                            %> 
                            </td>


                            <td width="5%" height="24" align="left">
                                <a href="#" onclick="javascript: window.location='../___Transactions/___erpHome.aspx?j0=0&j1=';" title="Ir a la Pagina Principal">
                                    <i class="bi bi-house-door-fill fs-5 text-white"></i>
                                </a>
                            </td>

                            <td width="5%" height="24" align="left">
                                <div class="dropdownM" id="drop1" style="z-index: 10">
                                    <%--<button class="dropbtn" id="btn1" type="button">Herramientas</button>--%>
                                    <a href="#">
                                        <i class="bi bi-list fs-5 text-white" id="btn1"></i>
                                    </a>
                                    <div class="dropdownM-content" id="listaID1">

                                        <a href="#" data-toggle='modal' data-target='#validador' data-whatever='@getbootstrap' onclick="javascript: exampleModalLabel.innerHTML='Buscar Disposiciones'; generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;idTemp|idValidador|GET|&q=t&typ=15');">Buscar</a>

                                        <a href="#" onclick="javascript: generalJS('0','frmMeta|___sqlAjax2.aspx|idTemp;idTemp|idHome|GET|&typ=0'); ">Gestionar Reportes</a>
                                        <!-- abrirVentana('reporteGrafico.aspx?typ=19','hijo123','status=yes,width=1250,height=600'); -->

                                        <% if (tipoEdicion=="1"){ %>

                                        <!--<a href="#" onClick="javascript: abrirVentana('reporteGrafico.aspx?typ=19','hijo123','status=yes,width=1250,height=600');" > Reporte Resum.</a>-->


                                        <a href="#" onclick="javascript:  generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;idTemp|idHome|GET|&typ=17');">Gestionar Usuarios</a>
                                        <a href="#" onclick="javascript: generalJS('0','frmMeta|___sqlAjax3.aspx|idTemp;idTemp|idHome|GET|&typ=41');">Gestionar Cadenas</a>
                                        <a href="#" data-toggle='modal' data-target='#validador' data-whatever='@getbootstrap' onclick="javascript: exampleModalLabel.innerHTML='Nueva Disposici&oacute;n'; generalJS('0','frmMeta|___disposiciones.aspx|idTemp;idTemp|idValidador|GET|&typ=');">Nueva Disposicion</a>

                                        <a href="#" data-toggle='modal' data-target='#validador' data-whatever='@getbootstrap' onclick="javascript: exampleModalLabel.innerHTML='Descartar Disposici&oacute;n';  generalJS('0','frmMeta|___sqlAjax1.aspx|idTemp;idTemp|idValidador|GET|&typ=2');">Descartar Disposicion</a>
                                        <% } %>
                                    </div>
                                </div>
                            </td>
                            <td width="5%" height="24" align="left">
                                <div class="dropdownM" id="drop2" style="z-index: 10">
                                    <a href="#">
                                        <i class="bi bi-gear-fill fs-5 text-white" id="btn1"></i>
                                    </a>
                                    <div class="dropdownM-content" id="listaID2">
                                        <a href="#" data-toggle='modal' data-target='#validador' data-whatever='@getbootstrap' onclick="javascript: exampleModalLabel.innerHTML='Cambio de Clave'; generalJS('0','frmMeta|___cambioClave.aspx|idTemp;idTemp|idValidador|GET|&typ=');">Cambio de Clave</a>

                                        <a href="#" data-toggle='modal' data-target='#validador' data-whatever='@getbootstrap' onclick="javascript: exampleModalLabel.innerHTML='Registro de Correos'; generalJS('0','frmMeta|___registrarCorreo.aspx|idTemp;idTemp|idValidador|GET|&typ=R'); ">Registrar Correo</a>

                                    </div>
                                </div>
                            </td>

                            <td width="5%" height="24" align="left">

                                <a href="#" onclick="javascript: window.location='../___Interface/___destroyApp.aspx?p=true';" title="Salir">
                                    <i class="bi bi-box-arrow-right fs-5 text-white"></i>
                                </a>

                            </td>
                            
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="250px" valign="top">
                    <br>

                    <div id='idMenuIzquierdo' style='width: 200; height: 590px; overflow: auto;'>
                        <MnI:MenuIzquierdo ID="MIzquierdo" runat="server" />
                    </div>
                </td>
                <td width="84%" valign="top">


                    <br>

                    <input type="hidden" id="idTemp" />
                    <div id='idHome' style="position: relative; left: 50px; top: 10px; width: 95%;"></div>
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
