/******************************************************************************
EMPRESA: I-SOLUTIONS
AUTOR: SERGIO BAUZ O. 
VERSION: 1.0 
FECHA: NOVIEMBRE DE 2009
PROYECTO: SISLAB 
Descripcion:
Creacion de funciones javascript para el manejo de objetos en AJAX
funcion generica para lecturar datos de un formulario, pasar parametros via URL

********************************************************************************/

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


//function sendUrls(url,po_method,po_div){
  function generalJS(opcion,parametros){
	
	/*	 enviar datos	
    - opcion 0 = tomar valors que vienen desde un formuario	
	- opcion 1 = buscador generalizado en una nueva ventana
	*/
	switch (opcion){
		case '0': //Parametros 0=formulario,1=url,2=etiquetas separados por | luego por ; 
			var i,lstParams,lstTags,form,url,strURL,tipo;
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			url =  lstParams[1];
			lstTags=lstParams[2].split(';');
			divId = lstParams[3];
			metodo = lstParams[4];
			tipo = lstParams[5]
			strURL = url+'?';
			
		
			for (i=0;i<lstTags.length;i++){	
									
				if (typeof( eval(form+'.'+lstTags[i]) ) != 'undefined') {
					e = eval(form+'.'+lstTags[i]).value!='' ? eval(form+'.'+lstTags[i]).value : 'null' ;
				   }else{
					e='null';
				   }
				strURL += 'p'+i+'='+ e +'&';
					
				}
			
			strURL = strURL.substr(0,(strURL.length-1)) + tipo;
				
			//alert (strURL+'hhhh');
		
		
		   /***********************************************************************************
		   *             Para AJAX
		   *************************************************************************************/
							
			var lo_container;
			lo_container = document.getElementById(divId);			
			
			var lo_ajax=createAjaxObject();
			lo_container.innerHTML= '<img src="../___Images/cargando.gif" align="center" > Por Favor Espere<br> Estamos Trabajando..';
		  
			if(metodo==undefined){
				metodo="GET";
			}
	
			lo_ajax.open(metodo, strURL,true);
			lo_ajax.onreadystatechange = function() {
					if (lo_ajax.readyState==4) {
						  lo_container.innerHTML = lo_ajax.responseText;
						  //Despues de ingresar la muestra blanquear el numero para que no se repitan 
						  // debe ser unico, OJO solo para el caso de guardar porque esta misma opcion usa buscar numero de muestra
						 if (tipo=='&typ=1'){
							var numeroMuestra = eval(form+'.nMuestra');
						 	var txtNumeroMuestra=eval(form+'.txtI1');
						 	numeroMuestra.value='';
						 	txtNumeroMuestra.value='';
						 }
					} 
			}
			
			if(metodo=="GET"){
				lo_ajax.send(null);
			} else {
				lo_ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				lo_ajax.send(null);
			}
			
			
		/*	alert ('ok');
	    var objDiv=document.createElement("div");
		objDiv.id='loading';
		objDiv.className="ct";
		objDiv.innerHTML="Cargando por favor espere...";
		var parentEl=document.body;
            parentEl.append(objDiv);
			
			window.onload=function(){
console=document.getElementById('console');
sendRequest("data.txt");
}
			loading();*/
			
		//return (false);
		break;

        case '1': //para un buscador generalizado
		
		var i,lstParams,form,url,tag,tagId;
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			url =  lstParams[1];
			tag=lstParams[2];
			tagId = lstParams[3];
			frmDestino = lstParams[4];
			var e = eval(form+'.'+tag);
			var f = eval(form+'.'+tagId);
			
		   if (e.value.length>3) {
			abrirVentana(url+'&q='+ e.value+'&tId='+ tag +'&nId='+ tagId +'&frm='+frmDestino+'','win','status=0,width=300,height=150')
		//alert(this.name);		
	}
		
		break;
	
	case '2': //Para pasar parametros de una pagina a otra en un buscador
			
		var i,lstParams,formInicio,formFin,tag,tagId,nameId;
     		lstParams=parametros.split('|');
	 		formInicio = lstParams[0];
			formFin =  lstParams[1];
			tag=lstParams[2];
			tagId = lstParams[3];
			nameId = lstParams[4];
			var e = eval(formInicio+'.'+tag);
			   
		var SelectedIndex = e.options.selectedIndex; 
		var f=eval('opener.parent.mainFrame.'+formFin+'.'+tagId);
		var name = e.options[SelectedIndex].text;
		var nombreArray = name.split(';');
		f.value=nombreArray[0];
		
		g=eval('opener.parent.mainFrame.'+formFin+'.'+nameId);
		g.value = e.value
		window.close();
		//alert (opener.parent.display.frmRegister.txt.value);

	break;
	
	
	case '3': //Para manejo de cajas de listas  y paso de valores entre ellas
	
	var delimiter = ":"; 
	var i,lstParams,SelectFrom,SelectTo,SelectedIndex,container;
    lstParams=parametros.split('|');
	 		
	var SelectFrom = eval('document.'+lstParams[0]+'.'+lstParams[1]); 
	var SelectTo = eval('document.'+lstParams[0]+'.'+lstParams[2]); 
	var SelectedIndex = SelectFrom.options.selectedIndex; 
	var container; var proximal = false; var proximalCalcio = false;
	
	if (lstParams[3]=='Add') { 
      //Proximal solo en caso de Agregar y debe existir dos elementos en la lista	
		if (SelectFrom.options.length > 1) { 
		proximal = SelectFrom.options[0].selected ? true : false;
		proximalCalcio = SelectFrom.options[1].selected ? true : false;
		}
	container=eval('document.'+lstParams[0]+'.'+lstParams[3]+lstParams[2]); 
	//alert(lstParams);
	} 
	if (lstParams[3]=='Remove') { 
	
	container=eval('document.'+lstParams[0]+'.'+lstParams[3]+lstParams[1]); 
	
	} 
	/*if (lstParams[3]=='Proximal') { 
	//alert('document.'+lstParams[2]+'.value');
	//container=eval('document.'+lstParams[0]+'.'+lstParams[3]+lstParams[1]); 
	
	} */
	
	
	if (SelectedIndex == -1) { 
	alert("Por favor, seleccione una categoría antes de agregar ó Remover."); 
	} else { 
	
	
	
	
	for (i=0; i<SelectFrom.options.length; i++) { 
	var name = SelectFrom.options[i].text; 
	var ID = SelectFrom.options[i].value; 
	
	   if (proximal){
		var o = SelectFrom.options[i];
		switch(ID){
		case '4':
			o.selected=true;
		break;
		case '5':
		o.selected=true;
		  break;
		case '6':
		o.selected=true;
		  break;
		  case '20':
		o.selected=true;
		  break;
		   case '86':
		o.selected=true;
		  break;
	    case '111':
		o.selected=false;
		  break;
		}
		   }
	
	
	
	 if (proximalCalcio){
		var o = SelectFrom.options[i];
		switch(ID){
		case '4':
			o.selected=true;
		break;
		case '5':
		o.selected=true;
		  break;
		case '6':
		o.selected=true;
		  break;
		   case '13':
		o.selected=true;
		  break;
		   case '14':
		o.selected=true;
		  break;
		  case '20':
		o.selected=true;
		  break;
		   case '86':
		o.selected=true;
		  break;
	    case '112':
		o.selected=false;
		  break;
		}
		   }
	
	if(SelectFrom.options[i].selected) { 
			
	SelectFrom.options[i] = null; 
	SelectTo.options[SelectTo.options.length]=new Option (name,ID,true); 
	i=i-1; 
	
	} 
	}
	} 
	
	/* Para seleccionar todos los elementos de la lista de opciones*/
for (var i=0; i<SelectTo.options.length; i++) {
		var o = SelectTo.options[i];
			o.selected=true;
		}

/* fín de seleccionar*/
	
	
	break;
	
	case '4': //pendiente funcion generalizada para deshabilitar

			for ( i = 1; i <=3; i++ ){
					x = document.frmConsultas["radio"+i];
					t = document.frmConsultas["textfield"+i];
					t.style.backgroundColor='#FFFFCC';
				if(x.checked==true){ t.disabled=false}
					else{ t.disabled=true; t.style.backgroundColor='#FFFFFF'; t.value="";	}
		        }
	
	break;
	
	
	case '5': //Para el ingreso de los analisis y sus resultados 
			var i,lstIDs,lstValues,lstResults,form,url,strURL,tipo,lstUrls,valores;
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			//alert(lstParams);
			lstUrls=lstParams[1].split(';')
			url =  lstUrls[0];
					
			lstIDs=lstParams[2].split(';');
			lstValues=lstParams[3].split(';');
			lstResults=lstParams[4].split(';');
			divId = lstParams[5];
			metodo = lstParams[6];
			tipo = lstParams[7]
			strURL = url+'?';
		   
			//para string de ID
			 valores='';
			 for (i=0;i<lstIDs.length;i++){	
				var e = eval(form+'.'+lstIDs[i]);
				valores += e.value +'|'; 
				}
				valores = valores.substr(0,(valores.length-1));
				strURL +='mID='+valores;
				
				//alert ('fffffff'+strURL);
				
			//para string de Values
			 valores='';
			 for (i=0;i<lstIDs.length;i++){	
				//TAMBIEN SE CONTROLA SI NO EXISTE EL VALOR DEL RESULTADO DEL ANALISIS SE ENVIA NULL
				//Tambien se controla la separacion decimal se quita coma y poner . en los valores
				var e = eval(form+'.'+lstValues[i]).value!='' ? eval(form+'.'+lstValues[i]).value.replace(',','.') : 'null';
				valores += e +'|'; 
				}
				valores = valores.substr(0,(valores.length-1));
				strURL +='&mVal='+valores;
				
			 	
				
			  //088554569
			  //para string de Results
			  valores='';
			 
			 for (i=0;i<lstResults.length;i++){	
			   // SE CONTROLA SI NO EXISTE LA CAJA DE ESPi QUE ES LA BANDERA DE ESPECIFICACION QUE SE CREA EN SQLAJAX EN OCULTA	
				if (typeof( eval(form+'.'+lstResults[i]) ) != 'undefined') {
					e = eval(form+'.'+lstResults[i]).value!='' ? eval(form+'.'+lstResults[i]).value : 'null' ;
				   }else{
					e='null';
				   }
				valores += e +'|'; 
				}
			   	strURL +='&mRes='+valores;
			 			 		
			strURL = strURL.substr(0,(strURL.length-1)) + tipo;
				
			//alert (strURL);
		
		
		   /***********************************************************************************
		   *             Para AJAX
		   *************************************************************************************/
							
			var lo_container;
			lo_container = document.getElementById(divId);			
			
			var lo_ajax=createAjaxObject();
			lo_container.innerHTML= '<img src="../___Images/loading.gif" align="center" >';
		  
			if(metodo==undefined){
				metodo="GET";
			}
	
			lo_ajax.open(metodo, strURL,true);
			lo_ajax.onreadystatechange = function() {
					if (lo_ajax.readyState==4) {
						  lo_container.innerHTML = lo_ajax.responseText;
					} 
			}
			
			if(metodo=="GET"){
				lo_ajax.send(null);
			} else {
				lo_ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				lo_ajax.send(null);
			}
			
			//Redireccion despues de grabar a la misma pagina
		//alert (lstUrls[1]+tipo);
		window.location=lstUrls[1]+tipo;
		
		break;

	
	case '6': //Para el ingreso de datos parciales de la muestra; 
		//	alert (parametros);
	 if (parametros!='') {
			var i,lstParams,lstTags,form,url,strURL,tipo;
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			
			lstUrls=lstParams[1].split(';')
			url =  lstUrls[0];
			
			
			lstTags=lstParams[2]
			divId = lstParams[3];
			metodo = lstParams[4];
			tipo = lstParams[5]
			strURL = url+'?';
		
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags);
				strURL += 'p'+i+'='+ e.value +'&'; 
			//alert(strURL);
				}
			strURL = strURL.substr(0,(strURL.length-1)) + tipo;
				
		//	alert (strURL);
		
		
		   /***********************************************************************************
		   *             Para AJAX
		   *************************************************************************************/
							
			var lo_container;
			lo_container = document.getElementById(divId);			
			
			var lo_ajax=createAjaxObject();
			lo_container.innerHTML= '<img src="../___Images/loading.gif" align="center" >';
		  
			if(metodo==undefined){
				metodo="GET";
			}
	
			lo_ajax.open(metodo, strURL,true);
			lo_ajax.onreadystatechange = function() {
					if (lo_ajax.readyState==4) {
						  lo_container.innerHTML = lo_ajax.responseText;
					} 
			}
			
			if(metodo=="GET"){
				lo_ajax.send(null);
			} else {
				lo_ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				lo_ajax.send(null);
			}
			
	  
	  } //fin de if de parametros
		
		//Redireccion despues de grabar a la misma pagina
		
		//window.location=lstUrls[1]+tipo;
		
		
		//return (false);
		break;

	
	
	case '7' : //Para Registrar el vector de muestras y analisis  
	
	        var lstParams=parametros.split('|');
	 		var form = lstParams[0];
     		var url =  lstParams[1];
			var lstTags=lstParams[2].split(';');
			var divId = lstParams[3];
			var metodo = lstParams[4];
			var tipo = lstParams[5]
	
	
	var form=document.getElementById(form);
	var analisis=form.elements[lstTags[0]];
	var muestras=form.elements[lstTags[1]];
	var strMuestras='';var strAnalisis='';
		
	for (var i=0; i<analisis.options.length; i++) {
	   strAnalisis +=analisis.options[i].value + ",";
	   }
	
	strAnalisis = strAnalisis.substr(0,(strAnalisis.length-1));
	
	for (var i=0; i<muestras.options.length; i++){
	   strMuestras +=muestras.options[i].value + "," ;
	   }
	
	strMuestras = strMuestras.substr(0,(strMuestras.length-1));
	
     		
			
			strURL = url+'?idA='+strAnalisis+'&idM='+strMuestras+tipo;
		
			//	alert (strURL);
		
		
		   /***********************************************************************************
		   *             Para AJAX
		   *************************************************************************************/
							
			var lo_container;
			lo_container = document.getElementById(divId);			
			
			var lo_ajax=createAjaxObject();
			lo_container.innerHTML= '<img src="../___Images/loading.gif" align="center" >';
		  
			if(metodo==undefined){
				metodo="GET";
			}
	
			lo_ajax.open(metodo, strURL,true);
			lo_ajax.onreadystatechange = function() {
					if (lo_ajax.readyState==4) {
						  lo_container.innerHTML = lo_ajax.responseText;
					      
						   
						
						  setTimeout("generalJS('0','frmMuestras|___sqlAjax.aspx|txtI3;IDI2;idLaboratorio;idRrhh;cmbRRHH;IDI5;txtI1;txtI1;txtI6;txtFechaRecepcion;txtFechaEntrega;cmbPrioridad;txtObservacion;txtEstado;txtUsuarioRegistro;txtTipo;txtI5|idMuestras|GET|&typ=2');generalJS('0','frmMuestras|___sqlAjax.aspx|txtI3;txtI5|idAnalisis|GET|&typ=4');",1000);
						  
							//Para limpiar las listas de muestras y analisis
							    var i;
								for(i=analisis.options.length-1;i>=0;i--){	
								analisis.remove(i);	}
							
							   for(i=muestras.options.length-1;i>=0;i--){
										muestras.remove(i);	}
							
							  //Mensaje Final de Ingreso
							  
							  alert ('.:: Sistema SISLAB ::. \n\n El registro se \n completo correctamente \n ');
							 //lo_container.innerHTML="<img src='../___Images/as_accesando.gif' width='32' height='32' /><br>El registro se completo Correctamete";
							
							//alert ('recargo las funciones');
					} 
			}
			
			if(metodo=="GET"){
				lo_ajax.send(null);
			} else {
				lo_ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				lo_ajax.send(null);
			}
			
			
			/*
			onLoaded: function(){ generalJS('0','frmMuestras|___sqlAjax.aspx|txtI3;IDI2;idLaboratorio;idRrhh;cmbRRHH;IDI5;txtI1;txtI1;txtI6;txtFechaRecepcion;txtFechaEntrega;cmbPrioridad;txtObservacion;txtEstado;txtUsuarioRegistro;txtTipo;txtI5|idMuestras|GET|&typ=2'); }
			
			
			
			generalJS('0','frmMuestras|___sqlAjax.aspx|txtI3;txtI5|idAnalisis|GET|&typ=4');
	
	
	//alert ('El registro se completo correctamente');	
	
	
	if (user && user.length>0 && pwd && pwd.length>0){
	form.action='myFormHandlerURL.php';
	form.submit();
	}else{
	alert("please fill in your credentials before logging in");
	}
	*/

	
	break;
	
	


case '8' : //Para Eliminar un item del listado de muestras  
	
	        var lstParams=parametros.split('|');
	 		var form = lstParams[0];
     		var url =  lstParams[1];
			var lstTags=lstParams[2];
			var divId = lstParams[3];
			var metodo = lstParams[4];
			var tipo = lstParams[5]
	
	
	var form=document.getElementById(form);
	var muestras=form.elements[lstTags];
	var strMuestras='';
		
	//Para seleccionar todos los elemntos de la lista	
		for (i=0; i<muestras.options.length; i++) { 
			if(muestras.options[i].selected) { 
			     strMuestras +=muestras.options[i].value + "," ;
				} 
			} 
		
	      strMuestras = strMuestras.substr(0,(strMuestras.length-1));
		  strURL = url+'?idM='+strMuestras+tipo;
		
				//alert (strURL);
		
		
		   /***********************************************************************************
		   *             Para AJAX
		   *************************************************************************************/
							
			var lo_container;
			lo_container = document.getElementById(divId);			
			
			var lo_ajax=createAjaxObject();
			lo_container.innerHTML= '<img src="../___Images/loading.gif" align="center" >';
		  
			if(metodo==undefined){
				metodo="GET";
			}
	
			lo_ajax.open(metodo, strURL,true);
			lo_ajax.onreadystatechange = function() {
					if (lo_ajax.readyState==4) {
						  lo_container.innerHTML = lo_ajax.responseText;
					      
						   						
						  setTimeout("generalJS('0','frmMuestras|___sqlAjax.aspx|txtI3;IDI2;idLaboratorio;idRrhh;cmbRRHH;IDI5;txtI1;txtI1;txtI6;txtFechaRecepcion;txtFechaEntrega;cmbPrioridad;txtObservacion;txtEstado;txtUsuarioRegistro;txtTipo;txtI5|idMuestras|GET|&typ=2')",1000);
						 //alert ('recargo las funciones');
					} 
			}
			
			if(metodo=="GET"){
				lo_ajax.send(null);
			} else {
				lo_ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				lo_ajax.send(null);
			}
			
	
	break;
	
	



	
	} //End switch 
		
		
		
} //end Function



  function irURL (parametros)
  {
	var i,lstParams,lstTags,form,url,strURL;
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			url =  lstParams[1];
			lstTags=lstParams[2].split(';');
			tipo = lstParams[3];
			strURL = url+'?';
			for (i=0;i<lstTags.length;i++){
				
				var e = eval(form+'.'+lstTags[i]);
				strURL += 'p'+i+'='+ e.value +'&'; 
				}
			
			strURL = strURL.substr(0,(strURL.length-1))
			//alert (strURL);
			location.href = strURL+tipo;
	  
	}


