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

function generalGraphics(opcion,parametros){
switch (opcion)
{
case '0': //Para el ingreso de los analisis y sus resultados 
			var i,lstIDs,lstValues,lstResults,form,url,strURL,tipo,lstUrls,valores;
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			
			lstUrls=lstParams[1].split(';')
			url =  lstUrls[0];
						
			lstIDs=lstParams[2].split(';');
			//lstValues=lstParams[3].split(';');
			//lstResults=lstParams[4].split(';');
			
			divId = lstParams[5];
			metodo = lstParams[6];
			tipo = lstParams[7]
			strURL = url+'?id=0';
   						
			
			//para string de ID
			 valores='';
			/* for (i=0;i<lstIDs.length;i++){	
				var e = eval(form+'.'+lstIDs[i]);
				valores += e.value +'|'; 
			//alert(strURL);
				}
				valores = valores.substr(0,(strURL.length-1));
				strURL +='mID='+valores
				//alert (strURL);
				*/
				strURL += tipo;
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
		
		//window.location=lstUrls[1]+tipo;
		
		break;
		}
		
}		