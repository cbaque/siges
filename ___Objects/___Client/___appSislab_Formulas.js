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

/************************ Funciones para  Calendario *****************/
//Para el objeto calendario
var months = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var days = new Array("D", "L", "M", "M", "J", "V", "S");

today = new getToday();	
var element_id;


function getDays(month, year) 
{
	// Test for leap year when February is selected.
	if (1 == month)
		return ((0 == year % 4) && (0 != (year % 100))) ||
			(0 == year % 400) ? 29 : 28;
	else
		return daysInMonth[month];
}

function getToday()
{
	// Generate today's date.
	this.now = new Date();
	this.year = this.now.getFullYear() ; // Returned year XXXX
	this.month = this.now.getMonth();
	this.day = this.now.getDate();
}

 
function newCalendar() 
{
	var parseYear = parseInt(document.all.year  [document.all.year.selectedIndex].text);
 
	var newCal = new Date(parseYear , document.all.month.selectedIndex, 1);
	var day = -1;
	var startDay = newCal.getDay();
	var daily = 0; 

	today = new getToday(); // 1st call
	if ((today.year == newCal.getFullYear() ) &&  (today.month == newCal.getMonth()))
	   day = today.day;
	// Cache the calendar table's tBody section, dayList.
	var tableCal = document.all.calendar.tBodies.dayList;

	var intDaysInMonth =
	   getDays(newCal.getMonth(), newCal.getFullYear() );

	for (var intWeek = 0; intWeek < tableCal.rows.length;  intWeek++)
		   for (var intDay = 0;
			 intDay < tableCal.rows[intWeek].cells.length;
			 intDay++)
	 {
		  var cell = tableCal.rows[intWeek].cells[intDay];

		  // Start counting days.
		  if ((intDay == startDay) && (0 == daily))
			 daily = 1;

		  // Highlight the current day.
		  cell.style.color = (day == daily) ? "red" : "";
		  if(day == daily)
		  {
				document.all.todayday.innerText= "Hoy: " +  day + "/" + 
					(newCal.getMonth()+1) + "/" + newCal.getFullYear() ;
		  }
		  // Output the day number into the cell.
		  if ((daily > 0) && (daily <= intDaysInMonth))
			 cell.innerText = daily++;
		  else
			 cell.innerText = "";
	   }

}
	  
	 function getTodayDay()
	 {
			    var dia = today.day < 10 ? '0' + today.day : today.day;
				var mes = today.month < 9 ? '0' + (today.month+1) : (today.month +1);
				
				document.all[element_id].value = today.year+"/"+mes+"/"+dia; 
		        //document.all.calendar.style.visibility="hidden";
				document.all.calendar.style.display="none";
				document.all.year.selectedIndex =100;   
	            document.all.month.selectedIndex = today.month; 
	 }
 
        function getDate() 
		 {
            // This code executes when the user clicks on a day
            // in the calendar.
            if ("TD" == event.srcElement.tagName)
               // Test whether day is valid.
               if ("" != event.srcElement.innerText)
			   { 
				 var mn = document.all.month.selectedIndex < 9 ? '0'+ (document.all.month.selectedIndex+1) : (document.all.month.selectedIndex+1) ;
    			 var Year = document.all.year [document.all.year.selectedIndex].text;
				 var dia = event.srcElement.innerText < 10 ? '0' + event.srcElement.innerText : event.srcElement.innerText;
				// document.all[element_id].value= Year+"/"+mn+"/"+dia ;
				document.all[element_id].value= dia+"/"+mn+"/"+Year ;
		         //document.all.calendar.style.visibility="hidden";
				 document.all.calendar.style.display="none";
			 }
		 }
 
function GetBodyOffsetX(el_name, shift)
{
	var x;
	var y;
	x = 0;
	y = 0;

	var elem = document.all[el_name];
	do 
	{
		x += elem.offsetLeft;
		y += elem.offsetTop;
		if (elem.tagName == "BODY")
			break;
		elem = elem.offsetParent; 
	} while  (1 > 0);


	shift[0] = x;
	shift[1] = y;
	return  x;
}	

function SetCalendarOnElement(el_name)
{
	if (el_name=="") 
	el_name = element_id;
	var shift = new Array(2);
	GetBodyOffsetX(el_name, shift);
	document.all.calendar.style.pixelLeft  = shift[0]; //  - document.all.calendar.offsetLeft;
	document.all.calendar.style.pixelTop = shift[1] + 25 ;
}
	  
 	  
	           
function ShowCalendar(elem_name)
{
		if (elem_name=="")
		elem_name = element_id;

		element_id	= elem_name; // element_id is global variable
		newCalendar();
		SetCalendarOnElement(element_id);
		//document.all.calendar.style.visibility = "visible";
		document.all.calendar.style.display="inline";
}

function HideCalendar()
{
	//document.all.calendar.style.visibility="hidden";
	document.all.calendar.style.display="none";
}

function toggleCalendar(elem_name)
{
	//alert ();
	//if (document.all.calendar.style.visibility == "hidden")
	if(document.all.calendar.style.display=="none")
		ShowCalendar(elem_name);
	
	else 
		HideCalendar();
}

/*
function escribirCalendario(caja){
	var strCalendario = "";
	
	strCalendario += "<TABLE bgcolor='#FFCC00'  border=0 cellPadding=1 cellSpacing=1 id=calendar style='DISPLAY: none; POSITION: absolute; Z-INDEX: 4' class='gris'>
          <TBODY class='caja' bgcolor='#FFCC00'>
            <TR>
              <TD colSpan=7 vAlign=center>
           
                <SELECT name='month' id=month onchange=newCalendar() class='letra'>";
		// Output months into the document.
		// Select current month.
		for (var intLoop = 0; intLoop < months.length; intLoop++)
			document.write("<OPTION " +	(today.month == intLoop ? "Selected" : "") + ">" + months[intLoop]);
		
             strCalendario += "</SELECT>         
                <SELECT name='year' id=year onchange=newCalendar() class='letra'>";

		// Output years into the document.
		// Select current year.
		for (var intLoop = 1900; intLoop < 2028; intLoop++)
			document.write("<OPTION " + (today.year == intLoop ? "Selected" : "") + ">" + intLoop);
		
               strCalendario += " </SELECT>              </TD>
            </TR>
            <TR class=days>";
	// Output days.
	for (var intLoop = 0; intLoop < days.length; intLoop++)
		document.write("<TD class=letra>" + days[intLoop] + "</TD>");
	 
            strCalendario += "</TR>
          <TBODY class=dates id=dayList onClick="getDate('')" vAlign=center bgcolor='#FFCC00'>";
          
	for (var intWeeks = 0; intWeeks < 6; intWeeks++)
	{
		document.write("<TR>");
		for (var intDays = 0; intDays < days.length; intDays++)
			document.write("<TD></TD>");
		document.write("</TR>");
	}
       strCalendario += "</TBODY>
          <TBODY bgcolor='#FFCC00'>
            <TR>
              <TD class=today colSpan=5 id=todayday onclick=getTodayDay()></TD>
              <TD align=right colSpan=2><A href='javascript:HideCalendar();'><SPAN style='COLOR: black; FONT-SIZE: 10px'><B>Ocultar</B></SPAN></A></TD>
            </TR>
          </TBODY>
      </TABLE>";

alert (strCalendario);
	}

*/

/*********************Fin de funciones para calendario******************/

//function sendUrls(url,po_method,po_div){
  function generalFormulas(opcion,parametros){
	/*	 enviar datos	
    - opcion 0 = tomar valors que vienen desde un formuario	
	- parametros para las formulas de analisis de laboratorio
	*/
	var i,lstParams,form,lstTags;
	
	switch (opcion){
		
	case '0': //Para el analisis de humedad
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			/*for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						//alert ('Ingrese los datos correctamente');
					    e.style.backgroundColor='#FF9999';
					    //e.focus();
				        return (false);
								
					  }
				  }
			*/
			
			
			//Solo se ejecuta el calculo si hay un valor en las cajas de textos			    
  if ((eval(form+'.'+lstTags[1]).value!='') && (eval(form+'.'+lstTags[2]).value!='') && (eval(form+'.'+lstTags[3]).value!='')){
		
			//Para tomar los valores de los parametros de la formula
			var pesoCaja = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var pesoMuestra = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var pesoCajaMuestraSeca = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			
			//Para mostrar el resultado de la formula
			var pjeHumedad = eval(form+'.'+lstParams[2]);
			 
			//Para formatear el resultado en la caja de texto			
			pjeHumedad.size=5; 
			pjeHumedad.style.backgroundColor='#FFFF00';
			var resultado = (pesoMuestra-(pesoCajaMuestraSeca-pesoCaja))*100/pesoMuestra;

			//------------Para formatear a 2 decimales sin condiderar redondeos-------------
			//var indice = resultado.toString().indexOf('.');
			//pjeHumedad.value = indice > 0 ? resultado.toString().substring(0,(indice + 3)) : resultado;
			
			//Para cortar a 2 decimales con redondeo
			pjeHumedad.value = resultado.toFixed(2);
			 
						
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjeHumedad.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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

		
				  
 } // fin validacion cajas de texto
			
			   

	break;
	
	case '1': //Para el analisis de Grasa
			
	   		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			/*for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
				*/
				
						
			//Solo se ejecuta el calculo si hay un valor en las cajas de textos			    
  if ((eval(form+'.'+lstTags[1]).value!='') && (eval(form+'.'+lstTags[2]).value!='') && (eval(form+'.'+lstTags[3]).value!='')){
	
				
			//Para tomar los valores de los parametros de la formula
			var pesoVaso = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var pesoMuestra = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var pesoVasoGrasa = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			
			//Para mostrar el resultado de la formula
			var pjeGrasa = eval(form+'.'+lstParams[2]);
			  			    
			//Para formatear el resultado en la caja de texto			
			pjeGrasa.size=5; 
			pjeGrasa.style.backgroundColor='#FFFF00'
						
			var resultado = ((pesoVasoGrasa-pesoVaso)/pesoMuestra)*100;
			
			//Para formatear a 2 decimales sin condiderar redondeos
			//var indice = resultado.toString().indexOf('.');
			//pjeGrasa.value = indice > 0 ? resultado.toString().substring(0,(indice + 3)) : resultado;
			
			
			//para cortar a 2 decimales con redondeo
			pjeGrasa.value = resultado.toFixed(2);
			
			
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjeGrasa.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   
  } // fin validacion cajas de textos
  
	break;
	
	case '2': //Para el analisis de Ceniza
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			/*for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
			*/
			
					
			//Solo se ejecuta el calculo si hay un valor en las cajas de textos			    
  if ((eval(form+'.'+lstTags[1]).value!='') && (eval(form+'.'+lstTags[2]).value!='') && (eval(form+'.'+lstTags[3]).value!='')){
	
			//Para tomar los valores de los parametros de la formula
			var pesoCrisol = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var pesoMuestra = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var pesoCeniza = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			
			//Para mostrar el resultado de la formula
			var pjeCeniza = eval(form+'.'+lstParams[2]);
			  			    
			//Para formatear el resultado en la caja de texto			
			pjeCeniza.size=5; 
			pjeCeniza.style.backgroundColor='#FFFF00';
			
			
			var resultado = ((pesoCeniza-pesoCrisol)/pesoMuestra)*100;

			//Para formatear a 2 decimales sin condiderar redondeos
			//var indice = resultado.toString().indexOf('.');
			//pjeCeniza.value = indice > 0 ? resultado.toString().substring(0,(indice + 3)) : resultado;
			
			
			//para cortar a 2 decimales con redondeo
			pjeCeniza.value = resultado.toFixed(2);
						
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjeCeniza.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

  }// fin validacion cajas de textos
  
	break;


	case '3': //Para el Actividad Ureasica Cuantitativa
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var phMs = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var phBlanco = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var resultado =  (phMs-phBlanco);
			
			//Para mostrar el resultado de la formula
			var dPh = eval(form+'.'+lstParams[2]);
			dPh.size=5; 
			dPh.style.backgroundColor='#FFFF00';
			
			//para cortar a 2 decimales con redondeo
			dPh.value = resultado.toFixed(2);
			
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+dPh.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;

case '4': //Para el Actividad Ureasica Cualitativa
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						//alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
										
			//Para tomar los valores de los parametros de la formula
			var nParticulas = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
					
			//Para mostrar el resultado de la formula
			var resultado = eval(form+'.'+lstParams[2]);
			
			//Para formatear el resultado en la caja de texto			
			resultado.size=5; 
			resultado.style.backgroundColor='#FFFF00';
			resultado.value = nParticulas;
			
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+resultado.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			
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
	       
			lo_ajax.open(metodo, url,true);
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
			   

	break;

case '5': //SOLUBILIDAD EN KOH METODO KJELDAHL
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
			//alert(lstTags);
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
					//Para tomar los valores de los parametros de la formula
			var solPm = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var solNormal = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var solVol = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var re=(solVol*solNormal*0.01407*6.25*100*5)/solPm;
			//Para mostrar el resultado de la formula
			var sumPS = eval(form+'.'+lstParams[2]);
			
			//Para formatear el resultado en la caja de texto			
			sumPS.size=5; 
			sumPS.style.backgroundColor='#FFFF00';
			sumPS.value = re.toFixed(2);
			
			 


				break;
case '6': //SOLUBILIDAD EN KOH METODO KJELDAHL O HACH
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
					//	alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var solPro = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var solCru = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var resultado = (solPro/solCru)*100;

			//Para mostrar el resultado de la formula
			var pjeSolub = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjeSolub.size=5; 
			pjeSolub.style.backgroundColor='#FFFF00';
			pjeSolub.value = resultado.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjeSolub.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;

case '7': //FOSFORO METODO HACH
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
					//	alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			
			
			//Para tomar los valores de los parametros de la formula
			var PMFosforo = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var LPROTFosforo = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var resultado =((LPROTFosforo/PMFosforo )*0.25);

			
			//Para mostrar el resultado de la formula
			var pjeFosforo = eval(form+'.'+lstParams[2]);
			  			    
			//Para formatear el resultado en la caja de texto			
			pjeFosforo.size=5; 
			pjeFosforo.style.backgroundColor='#FFFF00';
			pjeFosforo.value = resultado.toFixed(2);
			
					
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjeFosforo.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;
case '8': //PROTEINA CRUDA METODO HACH
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var pesoMuestra = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var lecturaProteina = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var resultado = (lecturaProteina/pesoMuestra)*0.25;
			//Para tomar los valores de los parametros de la formula
			//var resPROT = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			
			
			
			//Para mostrar el resultado de la formula
			var pjePROT = eval(form+'.'+lstParams[2]);
			  			    
			//Para formatear el resultado en la caja de texto			
			pjePROT.size=5; 
			pjePROT.style.backgroundColor='#FFFF00';
			pjePROT.value = resultado.toFixed(2);  
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjePROT.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;
case '9': //CALCIO METODO HACH
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
					//	alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			
			//Para tomar los valores de los parametros de la formula
			var calPM = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var calINT = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var calTG = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			var calCAMG = Number(eval(form+'.'+lstTags[4]).value.replace(',','.'));
			var calAMG = Number(eval(form+'.'+lstTags[5]).value.replace(',','.'));
			var calACA = Number(eval(form+'.'+lstTags[6]).value.replace(',','.'));
			var calFD = Number(eval(form+'.'+lstTags[7]).value.replace(',','.'));
			
			var res1 =(calCAMG-calAMG);
			var res2 = res1-calINT;
			var res3= (res2/calTG)
			var resultado = (res3/calPM)*0.2500;
			//si hay algun factor de dilucion se multiplica si es mayor que cero
			if (calFD > 0) { resultado = resultado * calFD ; }
			//Para mostrar el resultado de la formula
			var sumCAL = eval(form+'.'+lstParams[2]);
			
				 	//alert(lstParams);
			//Para formatear el resultado en la caja de texto			
			sumCAL.size=5; 
			sumCAL.style.backgroundColor='#FFFF00';
			sumCAL.value = resultado.toFixed(2); 
			
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+sumCAL.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;

case '10': //FIBRA CRUDA1
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
			//alert(lstTags);
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						//alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
										
			//Para tomar los valores de los parametros de la formula
			var fibPCRISV= Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var fibPCRISM = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			var resultado = (fibPCRISV-fibPCRISM);
			
			//Para mostrar el resultado de la formula
			var sumFIB = eval(form+'.'+lstParams[2]);
			
			//Para formatear el resultado en la caja de texto			
			sumFIB.size=5; 
			sumFIB.style.backgroundColor='#FFFF00';
			sumFIB.value = resultado.toFixed(4);
			
			//alert(lstParams);

	break;
case '11': //FIBRA CRUDA2
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						//alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var fibPDIF = Number(eval(form+'.'+lstTags[4]).value.replace(',','.'));
			var fibPHU = Number(eval(form+'.'+lstTags[5]).value.replace(',','.'));
			var fibPGR = Number(eval(form+'.'+lstTags[6]).value.replace(',','.'));
			var resultado = fibPDIF*(100-fibPHU-fibPGR);
			
			//Para mostrar el resultado de la formula
			var sumFIB = eval(form+'.'+lstParams[2]);
			  			    
			//Para formatear el resultado en la caja de texto			
			sumFIB.size=5; 
			sumFIB.style.backgroundColor='#FFFF00';
			sumFIB.value = resultado.toFixed(2);
			
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+sumFIB.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

			 

	break;
	
	
	case '12': //PROTEINA CRUDA
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						//alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var protPM = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var protLECTURA = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var protNORMAL = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			var protFP = Number(eval(form+'.'+lstTags[4]).value.replace(',','.'));
			var sumPROT = eval(form+'.'+lstParams[2]);
			  			    
			//Para formatear el resultado en la caja de texto			
			sumPROT.size=5; 
			sumPROT.style.backgroundColor='#FFFF00';
			var resultado = ((protLECTURA*protNORMAL*0.014007*protFP)/(protPM))*100; 
			sumPROT.value = resultado.toFixed(2);  
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+sumPROT.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

			 

	break;
	
	
	case '13': //CLORUROS
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var clPM = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var clVAG= Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var clNOR = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
            var resultado = ((clVAG*clNOR*0.03545*10)/(clPM))*100;

			var sumCL = eval(form+'.'+lstParams[2]);
			  			    
			//Para formatear el resultado en la caja de texto			
			sumCL.size=5; 
			sumCL.style.backgroundColor='#FFFF00';
			sumCL.value = resultado.toFixed(2);
			
			
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+sumCL.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

			 

	break;
	
	
	
	case '14': //HUMEDAD EN ACEITES
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
					//	alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var hPV = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var hPM= Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var hPVMS = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
            var resultado= (((hPV+hPM)-hPVMS)/(hPM))*100;
			
			var sumHUM = eval(form+'.'+lstParams[2]);
			  			    
			//Para formatear el resultado en la caja de texto			
			sumHUM.size=5; 
			sumHUM.style.backgroundColor='#FFFF00';
			sumHUM.value = resultado.toFixed(2);
			
				
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+sumHUM.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

			 

	break;
	
	
	case '15': //IMPURESAS EN ACEITES
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
								//alert(lstParams);	
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			
			var imPAPEL = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var imPM= Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var imPAIM = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
            var resultado = 100-((((imPAPEL+imPM)- imPAIM)/imPM)*100) ;
			
			
			var sumIMP = eval(form+'.'+lstParams[2]);
			 				
			sumIMP.size=5; 
			sumIMP.style.backgroundColor='#FFFF00';
			sumIMP.value = resultado.toFixed(2);
					
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+sumIMP.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			
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
	
			lo_ajax.open(metodo, url,true);
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
			   

			 

	break;
	
	case '16': //CLORO HACH
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
			//alert(lstTags);
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						//alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
										
			//Para tomar los valores de los parametros de la formula

			var clCL = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			//Para mostrar el resultado de la formula
			var sumCL = eval(form+'.'+lstParams[2]);
			
			//Para formatear el resultado en la caja de texto			
			sumCL.size=5; 
			sumCL.style.backgroundColor='#FFFF00';
			sumCL.value = clCL.toFixed(2);;
			
			 

	break;
	
	case '17': //ENERGIA BRUTA
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			//alert(lstParams);
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
					//	alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var EBPM = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var EBMA = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var EBTI = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			var EBTF = Number(eval(form+'.'+lstTags[4]).value.replace(',','.'));
			var EBCA = Number(eval(form+'.'+lstTags[5]).value.replace(',','.'));
			var EBBENZ = Number(eval(form+'.'+lstTags[6]).value.replace(',','.'));
			var EBVNAZ = Number(eval(form+'.'+lstTags[7]).value.replace(',','.'));
			var res1=EBBENZ*(EBTF-EBTI)
			var res2=(EBCA*0.23)+EBVNAZ
			var res = (res1-res2)/EBPM
//		alert(EBRES);
			//Para mostrar el resultado de la formula
			var EBRES = eval(form+'.'+lstParams[2]);
				    
			//Para formatear el resultado en la caja de texto			
			EBRES.size=5; 
			EBRES.style.backgroundColor='#FFFF00';
			EBRES.value = res.toFixed(2);
			//alert(EBRES.value);
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+EBRES.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;
case '18': //DIGESTIBILIDAD KJEDAL  1
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
			//alert(lstTags);
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						//alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
					//Para tomar los valores de los parametros de la formula
			var DIGPm = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var DIGVol = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var DIGNormal= Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var DIGFP = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			var DIGGRASA= Number(eval(form+'.'+lstTags[4]).value.replace(',','.'));
			var res1=((DIGVol*DIGNormal*0.014007*DIGFP)/DIGPm);
			var res2=(100-DIGGRASA);
			var res=res1*res2;
			
			
			
			//Para mostrar el resultado de la formula
			var sumDig = eval(form+'.'+lstParams[2]);
			
			//Para formatear el resultado en la caja de texto			
			sumDig.size=5; 
			sumDig.style.backgroundColor='#FFFF00';
			sumDig.value=res.toFixed(2);
			//sumDig.value = ((DIGVol*DIGNormal*0.014007*DIGFP)/DIGPm)*(100-DIGGRASA);
			//alert (sumDig.value);
			
			 				break;
case '19': //DIGESTIBILIDAD KJEDAL      2
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						//alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var DIGProc = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var DIGProi = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var resultado = ((DIGProc-DIGProi)/DIGProc)*100;

			//Para mostrar el resultado de la formula
			var pjeDig = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjeDig.size=5; 
			pjeDig.style.backgroundColor='#FFFF00';
			pjeDig.value = resultado.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjeDig.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;
	


	
	case '20': //DIGESTIBILIDAD HACH
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
			//alert(lstTags);
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
					//	alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
					//Para tomar los valores de los parametros de la formula
			var DIGPm = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var DIGgra = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var DIGlec= Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var res1=(DIGlec/(DIGPm*100))*0.25;
			var res2=100-DIGgra;
			var res =res1*res2;
			//Para mostrar el resultado de la formula
			var sumDig = eval(form+'.'+lstParams[2]);
			
			//Para formatear el resultado en la caja de texto			
			sumDig.size=5; 
			sumDig.style.backgroundColor='#FFFF00';
			sumDig.value = res.toFixed(2);
			//alert (sumDig.value);
			
			 				break;
case '21': //DIGESTIBILIDAD HACH      2
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						//alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var DIGProc = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var DIGProi = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var resultado = ((DIGProc-DIGProi)/DIGProc)*100;

			//Para mostrar el resultado de la formula
			var pjeDig = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjeDig.size=5; 
			pjeDig.style.backgroundColor='#FFFF00';
			pjeDig.value = resultado.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjeDig.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;
	
		
case '22': //INSPECCION DE MATERIAL DE EMPAQUE E IDENTIFICACION 
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			//alert(lstParams);
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
					//	alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var IMElargo = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var IMEancho = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var IMEpeso = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var res1= IMEancho*IMElargo;
			var res2= IMEpeso/res1;
			//var res3=res2.toFixed(4);
			var res= res2*10000;
						
			//Para mostrar el resultado de la formula
			var IMESUM = eval(form+'.'+lstParams[2]);
				    
			//Para formatear el resultado en la caja de texto			
			IMESUM.size=5; 
			IMESUM.style.backgroundColor='#FFFF00';
			IMESUM.value = res.toFixed(2);
			//alert(EBRES.value);
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+IMESUM.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
		//	alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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

case '23': //Para los analisis que tienen un solo dato Toxicologicos,ph,cloro hach,hierro hach,gelatinizacion 
			//y escore Biotoxicologico
					
     			
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			var pje = eval(form+'.'+lstParams[2]);
									
							
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pje.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
  


	break;


case '24': //SOLUBILIDAD EN KOH METODO HACH 1
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
			//alert(lstTags);
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
					//	alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
					//Para tomar los valores de los parametros de la formula
			var solPm = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var solLect = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var res =(solLect*0.25*7.5)/solPm;
			//Para mostrar el resultado de la formula
			var sumPS = eval(form+'.'+lstParams[2]);
			
			//Para formatear el resultado en la caja de texto			
			sumPS.size=5; 
			sumPS.style.backgroundColor='#FFFF00';
			sumPS.value = res.toFixed(2);
			 


				break;

case '25': //SOLUBILIDAD EN KOH METODO KJELDAHL 
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var solPro = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var solCru = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var resultado = (solCru/solPro)*100;

			//Para mostrar el resultado de la formula
			var pjeSolub = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjeSolub.size=5; 
			pjeSolub.style.backgroundColor='#FFFF00';
			pjeSolub.value = resultado.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjeSolub.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;
	

case '26': //ALCALINIDAD 1 (ALCALINIDAD F)
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
			//alert(lstTags);
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
					//Para tomar los valores de los parametros de la formula
			var AlVolm = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var AlVolf = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var AlNor = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var res =(AlVolf*AlNor*50.04)/AlVolm;
			//Para mostrar el resultado de la formula
			var sumPS = eval(form+'.'+lstParams[2]);
			
			//Para formatear el resultado en la caja de texto			
			sumPS.size=5; 
			sumPS.style.backgroundColor='#FFFF00';
			sumPS.value = res.toFixed(2);
			 


				break;

case '27': //ALCALINIDAD 2 (ALCALINIDAD T)
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var AlVolm = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var AlVolt = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var AlNor = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var res =(AlVolt*AlNor*50.04)/AlVolm;
			//Para mostrar el resultado de la formula
			var pjeSolub = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjeSolub.size=5; 
			pjeSolub.style.backgroundColor='#FFFF00';
			pjeSolub.value = res.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjeSolub.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;
	

case '28': //DUREZA 1
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
			//alert(lstTags);
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
					//	alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
					//Para tomar los valores de los parametros de la formula
			var durVol1 = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var durMol = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var durVolm = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var res =(durVol1*durMol*100.08)/durVolm;
			//Para mostrar el resultado de la formula
			var sumPS = eval(form+'.'+lstParams[2]);
			
			//Para formatear el resultado en la caja de texto			
			sumPS.size=5; 
			sumPS.style.backgroundColor='#FFFF00';
			sumPS.value = res.toFixed(2);
			 


				break;

case '29': //DUREZA 2
			lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
			//alert(lstTags);
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
					//Para tomar los valores de los parametros de la formula
			var durVol2 = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var durMol = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var durVolm = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var res =(durVol2*durMol*100.08)/durVolm;
			//Para mostrar el resultado de la formula
			var sumPS = eval(form+'.'+lstParams[2]);
			
			//Para formatear el resultado en la caja de texto			
			sumPS.size=5; 
			sumPS.style.backgroundColor='#FFFF00';
			sumPS.value = res.toFixed(2);
			 


				break;


case '30': //DUREZA 2
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
					//	alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var durTot = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var durCal = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var res =durTot-durCal;
			//Para mostrar el resultado de la formula
			var pjeSolub = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjeSolub.size=5; 
			pjeSolub.style.backgroundColor='#FFFF00';
			pjeSolub.value = res.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjeSolub.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;
	





case '31': //DETERGENTE ACIDO
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var pfvacia = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var pm = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var blanco = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			var pf = Number(eval(form+'.'+lstTags[4]).value.replace(',','.'));
			
			
			var resultado = ((pf-(pfvacia*blanco))*100)/pm;

			//Para mostrar el resultado de la formula
			var pjedeta = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjedeta.size=5; 
			pjedeta.style.backgroundColor='#FFFF00';
			pjedeta.value = resultado.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjedeta.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;


	case '32': //DETERGENTE NEUTRO
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			//Para tomar los valores de los parametros de la formula
			var pfvacia = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var pm = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var blanco = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			var pf = Number(eval(form+'.'+lstTags[4]).value.replace(',','.'));
		
			
			var resultado = ((pf-(pfvacia*blanco))*100)/pm;

			//Para mostrar el resultado de la formula
			var pjedeta = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjedeta.size=5; 
			pjedeta.style.backgroundColor='#FFFF00';
			pjedeta.value = resultado.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjedeta.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;
	
	
	case '33': //INDICE DE YODO
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			
		 //Para tomar los valores de los parametros de la formula
			var volMuestra = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var tiosul = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var blanco = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			var cons = Number(eval(form+'.'+lstTags[4]).value.replace(',','.'));
			var pm = Number(eval(form+'.'+lstTags[5]).value.replace(',','.'));
			
		//var resultado = blanco/pm;
			var resultado = ((blanco-volMuestra)*tiosul*cons)/pm;

			//Para mostrar el resultado de la formula
			var pjedeta = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjedeta.size=5; 
			pjedeta.style.backgroundColor='#FFFF00';
			pjedeta.value = resultado.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjedeta.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;






	case '34': //ALDEHIDO MALONICO
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			
		 //Para tomar los valores de los parametros de la formula
			var ncaja = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var medi = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			
		//var resultado = blanco/pm;
			var resultado = 7.8 * medi;

			//Para mostrar el resultado de la formula
			var pjealm = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjealm.size=5; 
			pjealm.style.backgroundColor='#FFFF00';
			pjealm.value = resultado.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjealm.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;
	
	
	

case '35': //INDICE DE PEROXIDOS
	
	/*
	Índice  de peróxido ( mili equivalentes de peróxido / Kg de muestra) = 
	S  x    N  x  1000
		  PM
      en donde:
 
      S 	Volumen  de tiosulfato de sodio consumido por la muestra menos
            el volumen de tiosulfato de sodio  consumido por el blanco.
      N  	Normalidad  exacta  del  tiosulfato  de  sodio  usado  en  la
            determinación.
      PM	Peso de muestra en g
	1000	Factor para convertir gramos a kilogramos de muestra.
	
	*/
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			
		 //Para tomar los valores de los parametros de la formula
			var volMuestra = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var tiosul = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var blanco = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			var cons = Number(eval(form+'.'+lstTags[4]).value.replace(',','.'));
			var pm = Number(eval(form+'.'+lstTags[5]).value.replace(',','.'));
			
		//var resultado = blanco/pm;
			var resultado = ((volMuestra-blanco)*tiosul*cons)/pm;

			//Para mostrar el resultado de la formula
			var pjedeta = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjedeta.size=5; 
			pjedeta.style.backgroundColor='#FFFF00';
			pjedeta.value = resultado.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjedeta.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;



case '37': //INDICE DE FLOTABILIDAD
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			
		 //Para tomar los valores de los parametros de la formula
			var ncaja = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var pellets = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			
		//var resultado = blanco/pm;
			var resultado =(100 - pellets) * 100 / 100 ;

			//Para mostrar el resultado de la formula
			var pjealm = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjealm.size=5; 
			pjealm.style.backgroundColor='#FFFF00';
			pjealm.value = resultado.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjealm.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;
	
	case '38': //NITROGENO NO PROTEICO
					
     		lstParams=parametros.split('|');
	 		form = lstParams[0];
			lstTags=lstParams[1].split(';');
									
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				  if (e.value.length==0){
					    
						alert ('Ingrese los datos correctamente' );
					    e.style.backgroundColor='#FF9999';
					    e.focus();
				        return (false);
								
					  }
				  }
											
			
		 //Para tomar los valores de los parametros de la formula
			var peso = Number(eval(form+'.'+lstTags[0]).value.replace(',','.'));
			var normalidad = Number(eval(form+'.'+lstTags[1]).value.replace(',','.'));
			var factor = Number(eval(form+'.'+lstTags[2]).value.replace(',','.'));
			var aforo = Number(eval(form+'.'+lstTags[3]).value.replace(',','.'));
			var alicuota = Number(eval(form+'.'+lstTags[4]).value.replace(',','.'));
			var volumen = Number(eval(form+'.'+lstTags[5]).value.replace(',','.'));
			
			
		//var resultado = blanco/pm;
			var resultado =volumen * normalidad * factor * (aforo / (alicuota * peso)) * 100 ;

			//Para mostrar el resultado de la formula
			var pjealm = eval(form+'.'+lstParams[2]);		    
			//Para formatear el resultado en la caja de texto			
			pjealm.size=5; 
			pjealm.style.backgroundColor='#FFFF00';
			pjealm.value = resultado.toFixed(2);
			
			//Para enviar los parametros y resultado a AJAX y validar su resultado en la tabla de especificacion
			var url = lstParams[3];
			url += '&vA='+pjealm.value;
			var divId = lstParams[4];
			var metodo = lstParams[5];
			
			//alert (url);
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
	
			lo_ajax.open(metodo, url,true);
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
			   

	break;



	
}
	return (true);
}
