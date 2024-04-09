<%
    Session["lockpage"] = "ulock";
%>

<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<%@ Import Namespace="System.Configuration" %>

<html xmlns="http://www.w3.org/1999/xhtml" data-bs-theme="dark">

<%--<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/jquery-2.1.3.min.js"></script>d
<script src="bootstrap/js/bootstrap.min.js"></script>--%>

<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

<script language="JavaScript" src="___Objects/___Client/___j.js"></script>
<script language="JavaScript" src="___Objects/___Client/___Md5.js"></script>
<script language="JavaScript" src="___Objects/___Client/___usingMd5.js"></script>

<!--<script src='https://www.google.com/recaptcha/api.js'></script>-->

<script>
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
                } catch (e) { }
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



    function generalJS1(opcion, parametros) {

        /*	 enviar datos	
        - opcion 0 = tomar valors que vienen desde un formuario	
        - opcion 1 = buscador generalizado en una nueva ventana
        */

        switch (opcion) {
            case '0': //Parametros 0=formulario,1=url,2=etiquetas separados por | luego por ; 

                //Control de Sesion en el Sistema
                var objAjax = createAjaxObject();
                objAjax.open("GET", "estadoSesion.aspx", true);
                objAjax.send();
                objAjax.onreadystatechange = function () {
                    if (objAjax.readyState == 4) {
                        if (objAjax.responseText != "1") { window.location.reload(); }
                    }
                }
                // Fin de Control de Session

                var i, lstParams, lstTags, form, url, strURL, tipo;
                lstParams = parametros.split('|');
                form = lstParams[0];
                url = lstParams[1];
                lstTags = lstParams[2].split(';');
                divId = lstParams[3];
                metodo = lstParams[4];
                tipo = lstParams[5]
                strURL = url + '?';


                for (i = 0; i < lstTags.length; i++) {

                    if (typeof (eval(form + '.' + lstTags[i])) != 'undefined') {
                        e = eval(form + '.' + lstTags[i]).value != '' ? eval(form + '.' + lstTags[i]).value : 'null';
                    } else {
                        e = 'null';
                    }
                    strURL += 'p' + i + '=' + e + '&';

                }

                strURL = strURL.substr(0, (strURL.length - 1)) + tipo;

                //alert (strURL + ':' +tipo.substr(tipo.length-7,tipo.length));


                /***********************************************************************************
                *             Para AJAX
                *************************************************************************************/

                var lo_container;
                lo_container = document.getElementById(divId);

                var lo_ajax = createAjaxObject();
                lo_container.innerHTML = '<img src="../___Images/cargando.gif" align="center" >&nbsp;Por favor Espere..';

                if (metodo == undefined) {
                    metodo = "GET";
                }




                lo_ajax.open(metodo, strURL, true);
                lo_ajax.onreadystatechange = function () {
                    if (lo_ajax.readyState == 4) {
                        lo_container.innerHTML = lo_ajax.responseText;

                    }
                }

                if (metodo == "GET") {
                    lo_ajax.send(null);
                } else {
                    lo_ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    lo_ajax.send(null);
                }



                break;



        } //End switch 



    } //end Function





</script>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>
        <% 
            string systemName = ConfigurationManager.AppSettings["NAME_SYSTEM"];
            Response.Write(systemName);
        %>
    </title>
</head>
<%
    string word_1 = ""; string word_2 = "";
    Random rnd1 = new Random();
    string cadena = "";

    for (int i = 0; i < 4; i++)
    {
        word_1 += (char)rnd1.Next(97, 122);
    }
    for (int i = 0; i < 4; i++)
    {
        word_2 += (char)rnd1.Next(97, 122);
    }
    cadena = word_1 + word_2;
    Session["sysCapt"] = cadena;
%>

<style>
    html,
    body {
      height: 100%;
    }

    .form-signin {
      max-width: 330px;
      padding: 1rem;
    }

    .form-signin .form-floating:focus-within {
      z-index: 2;
    }

    .form-signin input[type="email"] {
      margin-bottom: -1px;
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }

    .form-signin input[type="password"] {
      margin-bottom: 10px;
      border-top-left-radius: 0;
      border-top-right-radius: 0;
    }
</style>
<body class="d-flex align-items-center py-4 bg-body-tertiary" oncontextmenu="return false;">


    <main class="form-signin w-100 m-auto">


        <form action="javascript:checkAndPass('frm_signIn')" 
        method="post" 
        name="frm_signIn" 
        id="frm_signIn" 
        onsubmit="javascript:  
        if(validateForm('frm_signIn|username;R|password;R')){ if (tt!=cod.value){alert('Codigo Incorrecto!!'); return(false);}else{ return(true); }}else { return(false); }">

            <img class="mb-4" src="assets/brand/logo.png" alt="" width="100%" height="40%">
            <h1 class="h3 mb-3 fw-normal">Iniciar Sesi&oacute;n</h1>


            <div class="form-floating">
                <input type="email" class="form-control" id="username"  name="username" placeholder="name@example.com">
                <label for="floatingInput">Email</label>
            </div>

            <div class="form-floating">
                <input type="password" class="form-control" id="password"  name="password" placeholder="Password">
                <label for="floatingPassword">Password</label>
            </div>

            <button class="btn btn-primary w-100 py-2" type="submit">Iniciar</button>


        </form>



    </main>



</body>


</html>
