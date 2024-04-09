/* *************************************************************************************************
                         FUNCION PARA VALIDAR FORMULARIOS DE INGRESOS DE RRHH
******************************************************************************************************/

function validate_rrhh(formulario)

{
  var checkOKIsAlpha = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzáéíóú %${}¨*[]?¡_'¿,.:";
  var checkOKIsNumeric = "0123456789"
  var checkOKIsE_mail = "@"
  var checkStr 
  var allValid
  var ch
  var i

    for (var i=0; i<formulario.list_CentroEstudios_selected.options.length; i++)
	{
		var o = formulario.list_CentroEstudios_selected.options[i];
		o.selected=true;
    }	
	
	for (var i=0; i<formulario.list_materias_selected.options.length; i++)
	{
	var o = formulario.list_materias_selected.options[i];
		o.selected=true;
    }	
	
		
	if (formulario.AS_tipo_rrhh.value.length == 0 )
		  {
			alert("Seleccione el tipo de usuario.");
			formulario.AS_tipo_rrhh.focus();
			return (false);
		  }
    
	if (formulario.AS_tipo_identificacion.value.length == 0 )
		  {
			alert("Seleccione el tipo de identificacion.");
			formulario.AS_tipo_identificacion.focus();
			return (false);
		  }
   
  if (formulario.num_identification.value.length == 0 )
		  {
			alert("Debe ingresar el número de identificación.");
			formulario.num_identification.focus();
			return (false);
		  }

  checkStr = formulario.num_identification.value;
  allValid = true;
		  for (i = 0;  i < checkStr.length;  i++)
		  { 		   
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOKIsAlpha.length;  j++)
			  if (ch == checkOKIsAlpha.charAt(j)) {
				   allValid = false//hay un numero
				   break
				}
		  }
 
   if (!allValid)
  {
    alert("El número de Identificación no debe tener letras ni carácteres especiales.");
    formulario.num_identification.focus();
	return (false)
  }



  if (formulario.NAMES.value.length == 0 )
		  {
			alert("Debe ingresar los nombres.");
			formulario.NAMES.focus();
			return (false);
		  }

 if (formulario.LAST_NAME.value.length == 0 )
		  {
			alert("Debe ingresar los apellidos.");
			formulario.LAST_NAME.focus();
			return (false);
		  }

  if (formulario.BDAY.value.length == 0 )
		  {
			alert("Debe seleccionar el día.");
			formulario.BDAY.focus();
			return (false);
		  }

 if (formulario.BMONTH.value.length == 0 )
		  {
			alert("Debe seleccionar el mes.");
			formulario.BMONTH.focus();
			return (false);
		  }

if (formulario.BYEAR.value.length == 0 )
		  {
			alert("Debe seleccionar el año.");
			formulario.BYEAR.focus();
			return (false);
		  }

  checkStr = formulario.BYEAR.value;
  allValid = true;
		  for (i = 0;  i < checkStr.length;  i++)
		  { 		   
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOKIsAlpha.length;  j++)
			  if (ch == checkOKIsAlpha.charAt(j)) {
				   allValid = false//hay un numero
				   break
				}
		  }
 
   if (!allValid)
  {
    alert("El año no debe tener letras ni carácteres especiales.");
    formulario.BYEAR.focus();
	return (false)
  }


if (formulario.YEARSOLD.value.length == 0 )
		  {
			alert("Debe ingresar la edad.");
			formulario.YEARSOLD.focus();
			return (false);
		  }
  checkStr = formulario.YEARSOLD.value;
  allValid = true;
		  for (i = 0;  i < checkStr.length;  i++)
		  { 		   
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOKIsAlpha.length;  j++)
			  if (ch == checkOKIsAlpha.charAt(j)) {
				   allValid = false//hay un numero
				   break
				}
		  }
 
   if (!allValid)
  {
    alert("La edad no debe tener letras ni carácteres especiales.");
    formulario.YEARSOLD.focus();
	return (false)
  }


if (formulario.CUSTOMSEX[0].checked){
   rdSelected=formulario.CUSTOMSEX[0].value;
	}else{
     if (formulario.CUSTOMSEX[1].checked){
	    rdSelected=formulario.CUSTOMSEX[1].value;
	 }else{
		 rdSelected=0;
		 }
      }
 
if (rdSelected==0){
  alert ('Debe seleccionar el sexo');
  return (false);   
 } 
 
 if (formulario.CIVILSTATE.value.length == 0 )
		  {
			alert("Debe seleccionar el estado civil.");
			formulario.CIVILSTATE.focus();
			return (false);
		  }
  checkStr = formulario.NUM_CHILD.value;
  allValid = true;
		  for (i = 0;  i < checkStr.length;  i++)
		  { 		   
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOKIsAlpha.length;  j++)
			  if (ch == checkOKIsAlpha.charAt(j)) {
				   allValid = false//hay un numero
				   break
				}
		  }
 
   if (!allValid)
  {
    alert("El número de hijos no debe tener letras ni carácteres especiales.");
    formulario.NUM_CHILD.focus();
	return (false)
  }

 checkStr = formulario.PHONEH.value;
  allValid = true;
		  for (i = 0;  i < checkStr.length;  i++)
		  { 		   
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOKIsAlpha.length;  j++)
			  if (ch == checkOKIsAlpha.charAt(j)) {
				   allValid = false//hay un numero
				   break
				}
		  }
 
   if (!allValid)
  {
    alert("El número de telefónico no debe tener letras ni carácteres especiales.");
    formulario.PHONEH.focus();
	return (false)
  }

checkStr = formulario.WPHONE.value;
  allValid = true;
		  for (i = 0;  i < checkStr.length;  i++)
		  { 		   
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOKIsAlpha.length;  j++)
			  if (ch == checkOKIsAlpha.charAt(j)) {
				   allValid = false//hay un numero
				   break
				}
		  }
 
   if (!allValid)
  {
    alert("El número de telefónico no debe tener letras ni carácteres especiales.");
    formulario.WPHONE.focus();
	return (false)
  }



if (formulario.ADDRESH.value.length == 0 )
		  {
			alert("Debe ingresar la dirección.");
			formulario.ADDRESH.focus();
			return (false);
		  }


if (formulario.PHONEH.value.length == 0 )
		  {
			alert("Debe ingresar el número telefono.");
			formulario.PHONEH.focus();
			return (false);
		  }

if (formulario.UNIVERSITY.value.length == 0 )
		  {
			alert("Debe ingresar la universidad.");
			formulario.UNIVERSITY.focus();
			return (false);
		  }
  
  if (formulario.DEGREE.value.length == 0 )
		  {
			alert("Debe ingresar el grado académico.");
			formulario.DEGREE.focus();
			return (false);
		  }
  
  if (formulario.username.value.length == 0 )
		  {
			alert("Debe ingresar un nombre de usuario.");
			formulario.username.focus();
			return (false);
		  }
  
  
  if (formulario.password.value.length == 0 )
		  {
			alert("Debe ingresar una contraseña.");
			formulario.password.focus();
			return (false);
		  }
  
  if (formulario.SAFIQRY.value.length == 0 )
		  {
			alert("Debe seleccionar una pregunta de seguridad.");
			formulario.SAFIQRY.focus();
			return (false);
		  }

 if (formulario.ANSWER.value.length == 0 )
		  {
			alert("Debe ingresar una respuesta.");
			formulario.ANSWER.focus();
			return (false);
		  }

if (formulario.list_CentroEstudios_selected.selectedIndex==-1)
	 {
	  alert ('Debe seleccionar los centros de Estudios');
	  formulario.list_CentroEstudios_selected.focus();
	  return (false);
	 }
	 
 if (formulario.list_materias_selected.selectedIndex==-1)
	 {
	  alert ('Debe seleccionar las Materias a Dictar');
	  formulario.list_materias_selected.focus();
	  return (false);
	 }
CE.value=formulario.list_CentroEstudios_selected.value;
MAT.value=formulario.list_materias_selected.value;





  return (true);
}


/* *************************************************************************************************
                         FORMULARIO DE LOGIN
******************************************************************************************************/


function validar_login(formulario)

{
  var checkOKIsAlpha = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzáéíóú %${}¨*[]?¡_'¿,.:";
  var checkOKIsNumeric = "0123456789"
  var checkOKIsE_mail = "@"
  var checkStr 
  var allValid
  var ch
  var i

  //Que no contenga vacio en el año 
  if (formulario.username.value.length == 0 )
  {
    texto="============ Validación de Login! ============\n";
    texto+="Por favor, ingrese el nombre del usuario.\n";

	alert(texto);
    formulario.username.focus();
    return (false);
  }

if (formulario.password.value.length == 0 )
  {
    texto="============ Validación de Login! ============\n";
    texto+="Por favor, ingrese la contraseña.\n";

	alert(texto);
    formulario.password.focus();
    return (false);
  }
  

   
  return (true);
  
 }

/* *************************************************************************************************
                         validar el estado civil
******************************************************************************************************/


function validar_civilstate(formulario)
{
  //Que no contenga vacio en el año 
  if ((formulario.CIVILSTATE.value == 'C') || (formulario.CIVILSTATE.value == 'U'))
  {
    formulario.NAMEC.value='';
	formulario.NAMEC.readOnly=false;
    formulario.NAMEC.width=320;
	formulario.NAMEC.style.backgroundColor="#FFFFCC";
	formulario.NAMEC.focus();
   }else{ 
    formulario.NAMEC.value='';
	formulario.NAMEC.readOnly=true;
    formulario.NAMEC.width=20;
    formulario.NAMEC.style.backgroundColor="#cccccc";
 }
}

/*
----------------------------------------------------------------------
 Validar el ingreso de estudiantes al sistema
----------------------------------------------------------------------
*/
function validate_Students(formulario)

{
  var checkOKIsAlpha = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzáéíóú %${}¨*[]?¡_'¿,.:";
  var checkOKIsNumeric = "0123456789"
  var checkOKIsE_mail = "@"
  var checkStr 
  var allValid
  var ch
  var i

    if (formulario.CA_CE_MOD.value.length == 0 )
  {
    alert("Seleccione el Centro de Estudios del estudiante.");
    formulario.CA_CE_MOD.focus();
    return (false);
  }

    if (formulario.AS_tipo_rrhh.value.length == 0 )
  {
    alert("Seleccione el tipo de usuario.");
    formulario.AS_tipo_rrhh.focus();
    return (false);
  }

  
  //Que no contenga vacio en el Ciclo 
  if (formulario.AS_tipo_identificacion.value.length == 0 )
  {
    alert("Debe seleccionar el tipo de identificación.");
    formulario.AS_tipo_identificacion.focus();
    return (false);
  }


 //Que no contenga vacio en el Ciclo 
  if (formulario.num_identification.value.length == 0 )
	  {
		alert("Debe ingresar el número de identificación.");
		formulario.num_identification.focus();
		return (false);
	  } 
  
  if (formulario.num_identification.value.length !== 10 )
	  {
		alert("El numero de Identificación debe tener 10 números.");
		formulario.num_identification.focus();
		return (false);
	  } 
  
  
  checkStr = formulario.num_identification.value;
  allValid = true;
		  for (i = 0;  i < checkStr.length;  i++)
		  { 		   
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOKIsAlpha.length;  j++)
			  if (ch == checkOKIsAlpha.charAt(j)) {
				   allValid = false//hay un numero
				   break
				}
		  }
 
   if (!allValid)
  {
    alert("El número de Identificación no debe tener letras ni carácteres especiales.");
    formulario.num_identification.focus();
	return (false)
  }
  
  
  
  if (formulario.NAMES.value.length == 0 )
  {
    alert("Debe ingresar los nombres.");
    formulario.NAMES.focus();
    return (false);
  }

  //Que no contenga vacio en la fecha Final
  if (formulario.LAST_NAME.value.length == 0 )
  {
    alert("Debe ingresar los apellidos.");
    formulario.LAST_NAME.focus();
    return (false);
  }

if (formulario.YEARSOLD.value.length == 0 )
  {
    alert("Debe ingresar la edad.");
    formulario.YEARSOLD.focus();
    return (false);
  }
 
checkStr = formulario.YEARSOLD.value;
  allValid = true;
		  for (i = 0;  i < checkStr.length;  i++)
		  { 		   
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOKIsAlpha.length;  j++)
			  if (ch == checkOKIsAlpha.charAt(j)) {
				   allValid = false//hay un numero
				   break
				}
		  }
 
   if (!allValid)
  {
    alert("La edad no debe tener letras ni carácteres especiales.");
    formulario.YEARSOLD.focus();
	return (false)
  }
 
 if (formulario.CUSTOMSEX[0].checked){
   rdSelected=formulario.CUSTOMSEX[0].value;
	}else{
     if (formulario.CUSTOMSEX[1].checked){
	    rdSelected=formulario.CUSTOMSEX[1].value;
	 }else{
		 rdSelected=0;
		 }
      }
 
if (rdSelected==0){
  alert ('Debe seleccionar el sexo');
  return (false);   
 } 
 
 if (formulario.BDAY.value.length == 0 )
  {
    alert("Debe seleccionar el día.");
    formulario.BDAY.focus();
    return (false);
  }

 if (formulario.BMONTH.value.length == 0 )
  {
    alert("Debe seleccionar el mes.");
    formulario.BMONTH.focus();
    return (false);
  }

if (formulario.BYEAR.value.length == 0 )
  {
    alert("Debe seleccionar el año.");
    formulario.BYEAR.focus();
    return (false);
  }

checkStr = formulario.BYEAR.value;
  allValid = true;
		  for (i = 0;  i < checkStr.length;  i++)
		  { 		   
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOKIsAlpha.length;  j++)
			  if (ch == checkOKIsAlpha.charAt(j)) {
				   allValid = false//hay un numero
				   break
				}
		  }
 
   if (!allValid)
  {
    alert("El año no debe tener letras ni carácteres especiales.");
    formulario.BYEAR.focus();
	return (false)
  }


if (formulario.lugar.value.length == 0 )
  {
    alert("Debe ingresar el lugar.");
    formulario.lugar.focus();
    return (false);
  }

if (formulario.COLEGIO.value.length == 0 )
  {
    alert("Debe ingresar el colegio.");
    formulario.COLEGIO.focus();
    return (false);
  }

 if (formulario.categorias.value.length == 0 )
  {
    alert("Debe seleccionar la categoría del colegio.");
    formulario.categorias.focus();
    return (false);
  }
 
  
 
 if (formulario.titulo.value.length == 0 )
  {
    alert("Debe ingresar el título de secundaria.");
    formulario.titulo.focus();
    return (false);
  } 

if (formulario.NAMEFATHER.value.length == 0 )
  {
    alert("Debe ingresar el nombre del padre.");
    formulario.NAMEFATHER.focus();
    return (false);
  } 
  
  if (formulario.NAMEMATHER.value.length == 0 )
  {
    alert("Debe ingresar el nombre de la madre.");
    formulario.NAMEMATHER.focus();
    return (false);
  } 

 if (formulario.CIVILSTATE.value.length == 0 )
  {
    alert("Debe seleccionar el estado civil.");
    formulario.CIVILSTATE.focus();
    return (false);
  } 

if (formulario.ADDRESH.value.length == 0 )
  {
    alert("Debe ingresar el domicilio del estudiante.");
    formulario.ADDRESH.focus();
    return (false);
  } 

if (formulario.PHONEH.value.length == 0 )
  {
    alert("Debe ingresar el número de teléfono del domicilio del estudiante.");
    formulario.PHONEH.focus();
    return (false);
  } 
  
 checkStr = formulario.PHONEH.value;
  allValid = true;
		  for (i = 0;  i < checkStr.length;  i++)
		  { 		   
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOKIsAlpha.length;  j++)
			  if (ch == checkOKIsAlpha.charAt(j)) {
				   allValid = false//hay un numero
				   break
				}
		  }
 
   if (!allValid)
  {
    alert("El número de telefónico no debe tener letras ni carácteres especiales.");
    formulario.PHONEH.focus();
	return (false)
  } 
  
  checkStr = formulario.WPHONE.value;
  allValid = true;
		  for (i = 0;  i < checkStr.length;  i++)
		  { 		   
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOKIsAlpha.length;  j++)
			  if (ch == checkOKIsAlpha.charAt(j)) {
				   allValid = false//hay un numero
				   break
				}
		  }
 
   if (!allValid)
  {
    alert("El número de telefónico no debe tener letras ni carácteres especiales.");
    formulario.WPHONE.focus();
	return (false)
  }
  
  if (formulario.username.value.length == 0 )
  {
    alert("Debe ingresar un nombre de usuario.");
    formulario.username.focus();
    return (false);
  }
  
  
  if (formulario.password.value.length == 0 )
  {
    alert("Debe ingresar una contraseña.");
    formulario.password.focus();
    return (false);
  }
  
  if (formulario.SAFIQRY.value.length == 0 )
  {
    alert("Debe seleccionar una pregunta de seguridad.");
    formulario.SAFIQRY.focus();
    return (false);
  }

 if (formulario.ANSWER.value.length == 0 )
  {
    alert("Debe ingresar una respuesta.");
    formulario.ANSWER.focus();
    return (false);
  }
 if (formulario.ANSWER.value.length == 0 )
  {
    alert("Debe ingresar una respuesta.");
    formulario.ANSWER.focus();
    return (false);
  }

  return (true);
}

function view_quotes(frm,page,tipIdent,numIdent){
   typ_identification=eval(frm+'.'+tipIdent+'.value');
   num_identification=eval(frm+'.'+numIdent+'.value');
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (typ_identification!=='' &&    num_identification!==''){
      eval("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   }else{
         alert("Seleccione el tipo de documento e Ingrese su número de identificacion.");
         eval(frm+'.'+tipIdent+'.focus()');
   }
  }


function close_win (){
   window.close();
    
}




function habilitar_registroTyp1(DAY,MONTH,YEAR,val,dup,fecha,val_fecha,chk,id1,id2,id3,tipo){
	// identificador=id.value;
	colorN="#FFFFCC";
	colorZ="#FFFFFF"; 
 if (chk.checked)
 {
    chk.value=1;
	
	DAY.disabled=false;
    MONTH.disabled=false;
    YEAR.disabled=false;
    val.disabled=false;
    dup.disabled=false;
	fecha.disabled=false;
	id1.disabled=false;
	id2.disabled=false;
	id3.disabled=false;
	tipo.disabled=false;
	
	fecha.value=val_fecha;
       	
	DAY.style.backgroundColor=colorN;
	MONTH.style.backgroundColor=colorN;
	YEAR.style.backgroundColor=colorN;
	val.style.backgroundColor=colorN;
	dup.style.backgroundColor=colorN;
	fecha.style.backgroundColor=colorN;
	
	
	

 }else{
    
    DAY.value='';
    MONTH.value='';
    YEAR.value='';
    dup.value='';
	fecha.value='';
   
   DAY.disabled=true;
    MONTH.disabled=true;
    YEAR.disabled=true;
    val.disabled=true;
    dup.disabled=true;
	fecha.disabled=true;
	id1.disabled=true;
	id2.disabled=true;
	id3.disabled=true;
	tipo.disabled=true;
		
	DAY.style.backgroundColor=colorZ;
	MONTH.style.backgroundColor=colorZ;
	YEAR.style.backgroundColor=colorZ;
	val.style.backgroundColor=colorZ;
	dup.style.backgroundColor=colorZ;
	fecha.style.backgroundColor=colorZ;
	
   
 }
 
}


function CheckAll()
	{
	for (var i=0;i<document.frmQuotes.elements.length;i++)
	{
	var e = document.frmQuotes.elements[i];
	   
	   if (e.type!='checkbox')
 		{
		e.disabled=true;
		}

	}
  
  document.frmQuotes.periodo.disabled=false;
  document.frmQuotes.num_identificacion.disabled=false;
  document.frmQuotes.AS_TIPO_IDENTIFICACION.disabled=false;
  document.frmQuotes.txt_n.disabled=false;
}


function view_documents(frm,page){
   typ_identification=frm.AS_TIPO_IDENTIFICACION.value;
   num_identification=frm.num_identification.value;
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (typ_identification!=='' &&    num_identification!==''){
      eval("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   }else{
         alert("Seleccione el tipo de documento e Ingrese su número de identificacion.");
         frm.num_identification.focus();
   }
   
    
}


function CheckAll_Documents()
	{
	
	
cheked=0;
	
	for (var i=0;i<document.frmDocuments.elements.length;i++)
	{
	var e = document.frmDocuments.elements[i];
	    if (e.type=='checkbox')
			{
				 if (e.checked)
				 {
				  cheked++;
				 
				 }		   
		    }

	 }
		
    if (cheked==0) 
	   { alert ('Debe chequear al menos una cuota ');					   
		  return (false)}
   return (true)

  
}

function CheckAll_Asistencia()
	{
	for (var i=0;i<document.frm_asistencia.elements.length;i++)
	{
	var e = document.frm_asistencia.elements[i];
	    if ((e.type!='checkbox') && (e.type!='hidden') && (e.type!='text'))
 		{
		e.disabled=true;
		}

	}
	/*document.frm_asistencia.n_students.disabled=false;
	document.frm_asistencia.n_columns.disabled=false;
	document.frm_asistencia.id_tutoria.disabled=false;*/
 }


function habilitar_Asistencia(indice,chk,fecha){
	colorN="#FFFFCC";
			colorZ="#FFFFFF"; 
		 if (chk.checked)
		 {
			chk.value=1;
			fecha.disabled=false;
			for (var i=0;i<document.frm_asistencia.elements.length;i++)
				{
				var e = document.frm_asistencia.elements[i];
					//alert (e.type);
					if (e.type=='select-one')
					{
					  pos1=e.name.indexOf('_');
					  if (e.name.indexOf(''+indice+'',pos1)>0){
					     e.disabled=false;
					     e.style.backgroundColor=colorN;
					   
					   }
					
					
					}
			
				}
			
					
		 }else{
			fecha.disabled=true;
			for (var i=0;i<document.frm_asistencia.elements.length;i++)
				{
				var e = document.frm_asistencia.elements[i];
					//alert (e.type);
					if (e.type=='select-one')
					{
					  pos1=e.name.indexOf('_');
					  if (e.name.indexOf(''+indice+'',pos1)>0){
					     e.disabled=true;
					     e.style.backgroundColor=colorZ;
					   
					   }
					
					
					}
			
				}
	   }
}


function habilitar_docs1(day,month,year,chk,observacion)
{
			colorN="#FFFFCC";
			colorZ="#FFFFFF"; 
		 if (chk.checked)
		 {
			chk.value=1;
			//quote.disabled=false;
			
			day.value='';
			month.value='';
			year.value='';
			observacion.value='';
			
			day.disabled=false;
			month.disabled=false;
			year.disabled=false;
			observacion.disabled=false;
						
			day.style.backgroundColor=colorN;
		    month.style.backgroundColor=colorN;
  		    year.style.backgroundColor=colorN;
  		    observacion.style.backgroundColor=colorN;

		 }else{
			//quote.disabled=true;
			
			day.value='';
			month.value='';
			year.value='';
			observacion.value='';
			
			day.disabled=true;
			month.disabled=true;
			year.disabled=true;			
			observacion.disabled=true;			
						
			day.style.backgroundColor=colorZ;
			month.style.backgroundColor=colorZ;
			year.style.backgroundColor=colorZ;
			observacion.style.backgroundColor=colorZ;		   
		 }

}


function searchToStudent(formulario,identification,id,id_CFM,c_p,i,reg) {
	
	var ci 
	  ci=eval(formulario+'.'+identification+'.value');
       // alert (ci);
	 	  if (eval(formulario+'.'+identification+'.value.length') == 0 )
		  {
			alert("Debe ingresar un número de identificación.");
			eval(formulario+'.'+identification+'.focus()');
			  return (false);
		     }else{
		       if ((eval(formulario+'.'+identification+'.value.length') >0) &&  (eval(formulario+'.'+identification+'.value.length') <10))
				{ 
				alert("El número de identificacion debe tener 10 caracteres.");
				 eval(formulario+'.'+identification+'.focus()');
				 return (false);
			  }
		     }
		  
	 
	 //alert ("___inserts_register_students.asp?id=" + id+"&ci="+ ci+"&id_CFM="+id_CFM+"&id_p="+id_p+"&id_h="+id_h+"&c_p="+c_p+"&i="+i+"&reg="+reg);
    location.href="___inserts_register_students.asp?id=" + id+"&ci="+ ci+"&id_ma="+id_CFM+"&c_p="+c_p+"&i="+i+"&r="+reg;
	}
function searchToMaterias(formulario,cmbNivel,cmbCarrera,typ_mat,Page) {
	
	var Nivel;
	var CCM;
	var typ; 
	 
	  if (formulario.CA_CE_MOD.value.length == 0 )
  {
    alert("Debe seleccionar la Unidad Académica.");
    formulario.CA_CE_MOD.focus();
    return (false);
  }

if (formulario.AS_nivel.value.length == 0 )
  {
    alert("Debe seleccionar el curso o nivel.");
    formulario.AS_nivel.focus();
    return (false);
  }

if (formulario.typ_materias.value.length == 0 )
  {
    alert("Debe seleccionar el tipo de consulta.");
    formulario.typ_materias.focus();
    return (false);
  }

	 
	  Nivel=cmbNivel.value;
  	  CCM=cmbCarrera.value;
      typ=typ_mat.value;
	 //alert (Page+"&id_N="+ Nivel+"&id_CCM="+CCM);
   	location.href=Page+"&id_N="+ Nivel+"&id_CCM="+CCM+"&typ_mat="+typ;
	}

//====================================================================== 
// Opciones de Tipo de Materias 
// ordenado por tipo 
//====================================================================== 
var TotalType = 4; 

var mat_nro_orden = new Array(TotalType); 
mat_nro_orden[0] = 'M'; 
mat_nro_orden[1] = 'SE'; 
mat_nro_orden[2] = 'SP'; 
mat_nro_orden[3] = 'SS'; 
mat_nro_orden[4] = 'SL';  

mat_descr = new Array(TotalType); 
mat_descr[0] = 'Materia'; 
mat_descr[1] = 'Sem. Extracurriculares'; 
mat_descr[2] = 'Sem. Pre-Tecnológico'; 
mat_descr[3] = 'Sem. Practica Docente'; 
mat_descr[4] = 'Sem. Pre-Licenciatura'; 

//=====================================================================|| 
// END Tipo de Materias
//=====================================================================|| 


function view_horParalelos(frm,page,cmb,id_pc){
   id_fm=cmb.value;
   idPC=id_pc.value;
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (id_fm!=='' ){
      eval("location='"+page+"&id_fm="+id_fm+"&id_pc="+idPC+"'");
   }else{
         alert("Debe seleccionar una Materia.");
         cmb.focus();
   }
      
}

/*function ValidateQuotes(formulario) {
	
	var ci 
	  ci=identification.value;
    
	 	  if (eval(formulario+'.'+identification+'.value.length') == 0 )
		  {
			alert("Debe ingresar un número de identificación.");
			eval(formulario+'.'+identification+'.focus()');
			  return (false);
		     }else{
		       if ((eval(formulario+'.'+identification+'.value.length') >0) &&  (eval(formulario+'.'+identification+'.value.length') <10))
				{ 
				alert("El número de identificacion debe tener 10 caracteres.");
				 eval(formulario+'.'+identification+'.focus()');
				 return (false);
			  }
		     }
		  
		 if ((eval(formulario+'.'+nom+'.value.length')==0))
				{ 
				alert("El nombre del estudiante no es válido.");
				 eval(formulario+'.'+nom+'.focus()');
				 return (false);
			  }
		
	    if ((eval(formulario+'.'+ape+'.value.length')==0))
				{ 
				alert("El apellido del estudiante no es válido.");
				 eval(formulario+'.'+ape+'.focus()');
				 return (false);
			  }
		  
	
	location.href=page;
	
	}*/

function View_ParByMat(frm,page,cmbCCM,cmbPC,id_fm){
   var ccm=eval(frm+'.'+cmbCCM+'.value')
   var pc=eval(frm+'.'+cmbPC+'.value')
   var id_fmat=eval(frm+'.'+id_fm+'.value')
   alert ('entro' + ccm+pc+id_fmat);
   if ((ccm=='') || (pc=='') || (id_fmat==''))
	 {
	  alert ('Debe seleccionar una Materia, y la sesión estar activa');
	  eval(frm+'.'+id_fm+'.focus()');
	  return (false);
	 }
   location.href=page+'&id_ccm='+ccm+'&id_pc='+pc+'&id_fm='+id_fmat;
        
}

function validate_CFM_step1(frm,par,mat,prof,hor)
{
 
  if ((eval(frm+'.'+par+'.value.length')==0))
				{ 
				alert("Debe seleccionar el paralelo.");
				 eval(frm+'.'+par+'.focus()');
				 return (false);
			  }
  
  if ((eval(frm+'.'+mat+'.value.length')==0))
				{ 
				alert("Debe seleccionar la Materia.");
				 eval(frm+'.'+mat+'.focus()');
				 return (false);
			  }
  
  /*var cadena=eval(frm+'.'+prof+'.value');
  alert (cadena);
  pos=cadena.indexOf(',');
  alert (pos+cadena);*/
  if (eval(frm+'.'+prof+'.selectedIndex')==-1 )//|| eval(frm+'.'+prof+'.selectedIndex')>1) porque???
	 {
	  alert ('Debe seleccionar un profesor');
	  return (false);
	 
	 }
if (eval(frm+'.'+hor+'.selectedIndex')==-1)
	 {
	  alert ('Debe seleccionar el horario de clases');
	  return (false);
	 }
}

function validate_EstByPar(frm,Estudiantes_selected,paralelos_selected)
{
  if (eval(frm+'.'+Estudiantes_selected+'.selectedIndex')==-1)
	 {
	  alert ('Debe seleccionar el número de estudiantes');
	  eval(frm+'.'+Estudiantes_selected+'.focus()')
	  return (false);
	 
	 }
 if (eval(frm+'.'+paralelos_selected+'.selectedIndex')==-1)
	 {
	  alert ('Debe seleccionar los paralelos asignados');
	  eval(frm+'.'+paralelos_selected+'.focus()')
	  return (false);
	 
	 }

if (eval(frm+'.'+Estudiantes_selected+'.length')!==eval(frm+'.'+paralelos_selected+'.length'))
	 {
	  alert ('Debe ser Igual el número de paralelos que el número de estudiantes por paralelo');
	  return (false);
	 
	 }

      for (var k=0; k<eval(frm+'.'+Estudiantes_selected+'.options.length'); k++)
		{
		var o = eval(frm+'.'+Estudiantes_selected+'.options['+k+']');
			o.selected=true;
		}

    for (var k=0; k<eval(frm+'.'+paralelos_selected+'.options.length'); k++)
		{
		var o = eval(frm+'.'+paralelos_selected+'.options['+k+']');
			o.selected=true;
		}

return(true);
}


function SearchToParalelos(formulario,cmbceem,cmdpc,cmbmat,Page) {
	
	
	  if (eval(formulario+'.'+cmbceem+'.value.length') == 0 )
  {
    alert("Debe seleccionar la Unidad Académica.");
   eval(formulario+'.'+cmbceem+'.focus()');
    return (false);
  }

  if (eval(formulario+'.'+cmbmat+'.value.length') == 0 )
  {
    alert("Debe seleccionar una materia.");
   eval(formulario+'.'+cmbmat+'.focus()');
    return (false);
  }

   var ceem=eval(formulario+'.'+cmbceem+'.value');
   var pc=eval(formulario+'.'+cmdpc+'.value');
   var mat=eval(formulario+'.'+cmbmat+'.value');
	var com=eval(formulario+'.'+cmbmat); 

	//mat.options[mat.selectedIndex].text;
	 //alert (Page+"&id_N="+ Nivel+"&id_CCM="+CCM);
   	location.href=Page+"&id_ccm="+ ceem+"&f_mat="+mat+"&id_pc="+pc+"&nom_mat="+com.options[com.selectedIndex].text;
	}


function CheckAll_Notas()
	{
	for (var i=0;i<document.frm_notas.elements.length;i++)
	{
	var e = document.frm_notas.elements[i];
	    if (e.type!='checkbox')
 		{
		
		e.disabled=true;
		e.style.backgroundColor="#f1f1f1";
		}

	}
  document.frm_notas.nom_unidad_academica.disabled=false;
  document.frm_notas.nom_unidad_academica.style.backgroundColor="#ffffff";
  document.frm_notas.id_carr_centroest_mod.disabled=false;
  document.frm_notas.n_students.disabled=false;
    
 }


function habilitar_Notas(prom,exam,chk)
{
			colorN="#FFFFcc";
			colorZ="#F1F1F1"; 
		 if (chk.checked)
		 {
			chk.value=1;
			//quote.disabled=false;
			
			prom.value='';
			exam.value='';
						
			prom.disabled=false;
			exam.disabled=false;
						
			
			prom.style.backgroundColor=colorN;
			exam.style.backgroundColor=colorN;
						

		 }else{
			//quote.disabled=true;
			
			prom.value='';
			exam.value='';
						
			prom.disabled=true;
			exam.disabled=true;
						
						
			prom.style.backgroundColor=colorZ;
			exam.style.backgroundColor=colorZ;
						
					   
		 }

}


function SendToregister_Notas(prom,exam,chk,Page)
{
			colorN="#FFFFcc";
			colorZ="#F1F1F1"; 
		 if (chk.checked)
		 {
			ck=chk.value;
			//quote.disabled=false;
			if ((prom.value.length==0 ) || (exam.value.length==0)) {
			        prom.focus();
			        alert ('Debe Ingresar las notas de Exámen y promedio de Actividades');
			}else{
				pr=prom.value;
				ex=exam.value;
								
				if ((pr<0 || pr>10) || (ex<0 || ex>10)) {
				   prom.focus();
			        alert ('Debe Ingresar las notas entre 0 y 10 puntos');
				}else{
				   location.href=Page+"&pr="+ pr+"&ex="+ex+"&chk="+ck;
				}
				
				
						
			}			
				
			

		 }else{
           alert ('Debe chequear un registro e ingresar las notas');					   
		 }

}




function habilitar_NotasIN(sum,exam,chk)
{
			colorN="#FFFFcc";
			colorZ="#F1F1F1"; 
		 if (chk.checked)
		 {
			chk.value=1;
			//quote.disabled=false;
			
			sum.value='';
			exam.value='';
			
			
			
			sum.disabled=false;
			exam.disabled=false;
			
			
			sum.style.backgroundColor=colorN;
			exam.style.backgroundColor=colorN;
					
						
			

		 }else{
			//quote.disabled=true;
			
			sum.value='';
			exam.value='';
			
			
			sum.disabled=true;
			exam.disabled=true;
			
						
			sum.style.backgroundColor=colorZ;
			exam.style.backgroundColor=colorZ;
									
					   
		 }

}

function SendToregister_NotasIN(sum,exam,chk,Page)
{
			colorN="#FFFFcc";
			colorZ="#F1F1F1"; 
		 if (chk.checked)
		 {
			ck=chk.value;
			//quote.disabled=false;
				if ((sum.value.length==0 ) || (exam.value.length==0)) {
			        exam.focus();
			        alert ('Debe Ingresar la nota de Exámen y suma de Actividades');
			}else{
			
			su=sum.value;
			ex=exam.value;
					
			
			if ((su<0 || su>10) || (ex<0 || ex>2.5)) {
				   exam.focus();
			        alert ('Debe Ingresar la nota de Exámen entre 0 y 2.5 \n la suma de Actividades a 10');
				}else{
				   location.href=Page+"&su="+ su+"&ex="+ex+"&chk="+ck;
				}
					
			
			}		
			
		 }else{
           alert ('Debe chequear un registro e ingresar las notas');					   
		 }
}


function SendToAssistand_Step1(frm,page,nT){
   nomt=nT.options[nT.selectedIndex].text;
       //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
  
   if ((nomt!=='') ){
      eval("location='"+page+"&nT="+nomt+"'");
   }else{
         alert("Debe seleccionar el número de tutoría y la fecha de asistencia.");
         nT.focus();
   }
      
}

function SendToregister_NotasRec(rec,chk,Page)
{
			colorN="#FFFFcc";
			colorZ="#F1F1F1"; 
		 if (chk.checked)
		 {
			ck=chk.value;
			//quote.disabled=false;
			if (rec.value.length==0) {
			        rec.focus();
			        alert ('Debe Ingresar la nota del exámen de Recuperación');
			}else{
				
				r=rec.value;
				
				
				if (r<0 || r>10) {
				   rec.focus();
			        alert ('Debe Ingresar la nota entre 0 y 10 puntos');
				}else{
				   location.href=Page+"&r="+r+"&chk="+ck;
				}
			}			
		 }else{
           alert ('Debe chequear un registro e ingresar las notas');					   
		 }
}



function habilitar_NotasRec(rec,chk)
{
			colorN="#FFFFcc";
			colorZ="#F1F1F1"; 
		 if (chk.checked)
		 {
			chk.value=1;
			rec.value='';
			rec.disabled=false;
			rec.style.backgroundColor=colorN;
		 }else{
			rec.value='';
  		    rec.disabled=true;
			rec.style.backgroundColor=colorZ;
	 }
}


function view_document(frm,page,tipIdent,numIdent,typ_requisito){
   typ_identification=eval(frm+'.'+tipIdent+'.value');
   num_identification=eval(frm+'.'+numIdent+'.value');
   typ_req=eval(frm+'.'+typ_requisito+'.value');
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (typ_identification!=='' &&    num_identification!=='' && typ_req!==''){
      eval("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"&tr="+typ_req+"'");
   }else{
         alert("Seleccione el tipo de documento, número de identificacion y requisito.");
         eval(frm+'.'+tipIdent+'.focus()');
   }
  }
var TotalGen=1;
var TotalDay = 30; 
var TotalMonth = 11; 
var TotalYear = 3; 
var TotalCivilState=4;
var TotalPregSeg=4;
var TotalAsis=2;

var TotalTipoReporte=1;

var mat_Day = new Array(TotalDay); 
mat_Day[0] = '1'; 
mat_Day[1] = '2'; 
mat_Day[2] = '3'; 
mat_Day[3] = '4'; 
mat_Day[4] = '5';  
mat_Day[5] = '6'; 
mat_Day[6] = '7'; 
mat_Day[7] = '8'; 
mat_Day[8] = '9'; 
mat_Day[9] = '10';  
mat_Day[10] = '11'; 
mat_Day[11] = '12'; 
mat_Day[12] = '13'; 
mat_Day[13] = '14'; 
mat_Day[14] = '15';  
mat_Day[15] = '16'; 
mat_Day[16] = '17'; 
mat_Day[17] = '18'; 
mat_Day[18] = '19'; 
mat_Day[19] = '20';  
mat_Day[20] = '21'; 
mat_Day[21] = '22'; 
mat_Day[22] = '23'; 
mat_Day[23] = '24'; 
mat_Day[24] = '25';  
mat_Day[25] = '26'; 
mat_Day[26] = '27'; 
mat_Day[27] = '28'; 
mat_Day[28] = '29'; 
mat_Day[29] = '30';  
mat_Day[30] = '31';  


var mat_Month = new Array(TotalMonth); 
mat_Month[0] = '1'; 
mat_Month[1] = '2'; 
mat_Month[2] = '3'; 
mat_Month[3] = '4'; 
mat_Month[4] = '5';  
mat_Month[5] = '6'; 
mat_Month[6] = '7'; 
mat_Month[7] = '8'; 
mat_Month[8] = '9'; 
mat_Month[9] = '10';  
mat_Month[10] = '11'; 
mat_Month[11] = '12'; 

var mat_Year = new Array(TotalYear); 
mat_Year[0] = '2005'; 
mat_Year[1] = '2006'; 
mat_Year[2] = '2007'; 
mat_Year[3] = '2008'; 
mat_Year[4] = '2009'; 

var mat_PregSeg = new Array(TotalPregSeg);
mat_PregSeg[0] = 'A qué lugar desearía ir de vacaciones'; 
mat_PregSeg[1] = 'Cuál es el amor de su vida'; 
mat_PregSeg[2] = 'Cuál es su segundo nombre'; 
mat_PregSeg[3] = 'Cuál es su comida favorita'; 
mat_PregSeg[4] = 'Cuál es su mascota favorita'; 

var mat_tipo_reporte = new Array(TotalTipoReporte);
mat_tipo_reporte[0] = 0; 
mat_tipo_reporte[1] = 1; 

var mat_CivilState = new Array(TotalCivilState);
mat_CivilState[0] = 'S'; 
mat_CivilState[1] = 'C'; 
mat_CivilState[2] = 'V'; 
mat_CivilState[3] = 'D'; 
mat_CivilState[4] = 'U'; 

var Asis = new Array(TotalAsis); 
Asis[0] = '1'; 
Asis[1] = '2'; 
Asis[2] = '3'; 

var desAsis = new Array(TotalAsis); 
desAsis[0] = 'A'; 
desAsis[1] = 'F'; 
desAsis[2] = 'J'; 

var Gen = new Array(TotalGen); 
Gen[0] = 'H'; 
Gen[1] = 'M'; 

var mat_tipo_reporteDes = new Array(TotalTipoReporte);
mat_tipo_reporteDes[0] = 'Por Valores'; 
mat_tipo_reporteDes[1] = 'Por Fechas'; 


var mat_CivilStateDes = new Array(TotalCivilState);
mat_CivilStateDes[0] = 'Soltero'; 
mat_CivilStateDes[1] = 'Casado'; 
mat_CivilStateDes[2] = 'Viudo'; 
mat_CivilStateDes[3] = 'Divorciado'; 
mat_CivilStateDes[4] = 'Union Libre'; 


var mat_DayDesc = new Array(TotalDay); 
mat_DayDesc[0] = '01'; 
mat_DayDesc[1] = '02'; 
mat_DayDesc[2] = '03'; 
mat_DayDesc[3] = '04'; 
mat_DayDesc[4] = '05';  
mat_DayDesc[5] = '06'; 
mat_DayDesc[6] = '07'; 
mat_DayDesc[7] = '08'; 
mat_DayDesc[8] = '09'; 
mat_DayDesc[9] = '10';  
mat_DayDesc[10] = '11'; 
mat_DayDesc[11] = '12'; 
mat_DayDesc[12] = '13'; 
mat_DayDesc[13] = '14'; 
mat_DayDesc[14] = '15';  
mat_DayDesc[15] = '16'; 
mat_DayDesc[16] = '17'; 
mat_DayDesc[17] = '18'; 
mat_DayDesc[18] = '19'; 
mat_DayDesc[19] = '20';  
mat_DayDesc[20] = '21'; 
mat_DayDesc[21] = '22'; 
mat_DayDesc[22] = '23'; 
mat_DayDesc[23] = '24'; 
mat_DayDesc[24] = '25';  
mat_DayDesc[25] = '26'; 
mat_DayDesc[26] = '27'; 
mat_DayDesc[27] = '28'; 
mat_DayDesc[28] = '29'; 
mat_DayDesc[29] = '30';  
mat_DayDesc[30] = '31';  


var mat_MonthDesc = new Array(TotalMonth); 
mat_MonthDesc[0] = 'Ene'; 
mat_MonthDesc[1] = 'Feb'; 
mat_MonthDesc[2] = 'Mar'; 
mat_MonthDesc[3] = 'Abr'; 
mat_MonthDesc[4] = 'May';  
mat_MonthDesc[5] = 'Jun'; 
mat_MonthDesc[6] = 'Jul'; 
mat_MonthDesc[7] = 'Ago'; 
mat_MonthDesc[8] = 'Sep'; 
mat_MonthDesc[9] = 'Oct';  
mat_MonthDesc[10] = 'Nov'; 
mat_MonthDesc[11] = 'Dic'; 

function ocultar_recuadro(recuadro) {  //reloads the window if Nav4 resized
recuadro.style.visibility="hidden"
}

function SendToQuotes()
{
	cheked=0;
	
	for (var i=0;i<document.frmQuotes.elements.length;i++)
	{
	var e = document.frmQuotes.elements[i];
	    if (e.type=='checkbox')
			{
				 if (e.checked)
				 {
				  cheked++;
				  ind=e.name.substr(e.name.length-1,1) 
				   
					 if ((eval('frmQuotes.valor'+ind+'.value.length')==0) || (eval('frmQuotes.DAY'+ind+'.value.length')==0) || (eval('frmQuotes.MONTH'+ind+'.value.length')==0) || (eval('frmQuotes.YEAR'+ind+'.value.length')==0)){// || (e.name=='DAY'+ind+'' && e.value=='') ){
					 
					  alert ('Debe ingresar una cantidad válida: ingresar el día, mes y el año');
					  
					  return (false)
					 }
				 }		   
		    }

	 }
		
    if (cheked==0) 
	   { alert ('Debe chequear al menos una cuota ');					   
		  return (false)}
   return (true)
}

function view_tutorias(page,cmb){
   id_ccm=cmb.value;
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (id_ccm!=='' ){
      eval("location='"+page+"&id_ccm="+id_ccm+"'");
   }else{
         alert("Debe seleccionar la carrera el centro de estudio y la modalidad.");
         cmb.focus();
   }
      
}

function view_num_tutorias(page,cmb,cmb_nivel,num_tut){
   id_ccm=cmb.value;
   id_nivel=cmb_nivel.value;
   num=num_tut.value;
   
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (id_ccm!=='' && id_nivel!=='' && num!==''){
      eval("location='"+page+"&id_ccm="+id_ccm+"&id_n="+id_nivel+"&n_t="+num+"'");
   }else{
         alert("Ingrese el numero de tutorias y seleccione la carrera, curso.");
         num_tut.focus();
   }
      
}



function SearchToQuotes(formulario,per,ident,num_ident,Page) {
	
		  if (eval(formulario+'.'+per+'.value.length') == 0 )
  {
    alert("Debe seleccionar el Período.");
   eval(formulario+'.'+per+'.focus()');
    return (false);
  }

  
if (eval(formulario+'.'+ident+'.value.length') == 0 )
  {
    alert("Debe seleccionar una identificación.");
   eval(formulario+'.'+ident+'.focus()');
    return (false);
  }
  if (eval(formulario+'.'+num_ident+'.value.length') == 0 )
  {
    alert("Debe Ingresar el número de Identificación.");
   eval(formulario+'.'+num_ident+'.focus()');
    return (false);
  }
  if (eval(formulario+'.'+num_ident+'.value.length')!==10 )
  {
    alert("El número de identificación de tener 10 números.");
   eval(formulario+'.'+num_ident+'.focus()');
    return (false);
  }
   var periodo=eval(formulario+'.'+per+'.value');
   var identificacion=eval(formulario+'.'+ident+'.value');
   var num_identificacion=eval(formulario+'.'+num_ident+'.value'); 
	
   	location.href=Page+"&id_p="+ periodo+"&id_i="+identificacion+"&ni="+num_identificacion;
	}



function habilitar_registroTyp2(DAY,MONTH,YEAR,val,dup,fecha,val_fecha,chk,id1,id2,tipo){
	// identificador=id.value;
	colorN="#FFFFCC";
	colorZ="#d7d7d7"; 
 if (chk.checked)
 {
    chk.value=1;
	
	DAY.readOnly=false;
    MONTH.readOnly=false;
    YEAR.readOnly=false;
    val.readOnly=false;
    dup.readOnly=false;
	//fecha.readOnly=false;
	id1.disabled=false;
	id2.disabled=false;
	fecha.value=val_fecha;
       	
	DAY.style.backgroundColor=colorN;
	MONTH.style.backgroundColor=colorN;
	YEAR.style.backgroundColor=colorN;
	val.style.backgroundColor=colorN;
	dup.style.backgroundColor=colorN;
	fecha.style.backgroundColor=colorN;
	id1.style.backgroundColor=colorN;
	id2.style.backgroundColor=colorN;
	tipo.disabled=false;

 }else{
    
    DAY.value='';
    MONTH.value='';
    YEAR.value='';
    dup.value='';
	fecha.value='';
   	
	DAY.style.backgroundColor=colorZ;
	MONTH.style.backgroundColor=colorZ;
	YEAR.style.backgroundColor=colorZ;
	val.style.backgroundColor=colorZ;
	dup.style.backgroundColor=colorZ;
	fecha.style.backgroundColor=colorZ;
	}
 }

function SearchToQuotesSystem(formulario,cmb1,cmb2,cmb3,cmb4,cmd1,Page) {
	
	
	  if (eval(formulario+'.'+cmb1+'.value.length') == 0 )
  {
    alert("Debe seleccionar la Unidad Académica.");
   eval(formulario+'.'+cmb1+'.focus()');
    return (false);
  }

if (eval(formulario+'.'+cmb2+'.value.length') == 0 )
  {
    alert("Debe seleccionar el periodo.");
   eval(formulario+'.'+cmb2+'.focus()');
    return (false);
  }

 if (eval(formulario+'.'+cmb3+'.value.length') == 0 )
  {
    alert("Debe seleccionar la tutoria.");
   eval(formulario+'.'+cmb3+'.focus()');
    return (false);
  }
 

 if (eval(formulario+'.'+cmb4+'.value.length') == 0 )
  {
    alert("Debe seleccionar las cuotas que han cancelado los estudiantes.");
   eval(formulario+'.'+cmb4+'.focus()');
    return (false);
  }
  
  if (eval(formulario+'.'+cmd1+'.value.length') == 0 )
  {
    alert("Debe Ingresar el numero de estudiantes por paralelo.");
   eval(formulario+'.'+cmd1+'.focus()');
    return (false);
  }
  
  
   var ccm=eval(formulario+'.'+cmb1+'.value');
   var pc=eval(formulario+'.'+cmb2+'.value');
   var t=eval(formulario+'.'+cmb3+'.value');
	var cp=eval(formulario+'.'+cmb4+'.value'); 
    var ep=eval(formulario+'.'+cmd1+'.value'); 
	//mat.options[mat.selectedIndex].text;
	 //alert (Page+"&id_N="+ Nivel+"&id_CCM="+CCM);
   	location.href=Page+"&id_ccm="+ ccm+"&id_pc="+pc+"&id_t="+t+"&cp="+cp+"&ep="+ep;
	}
	
	
	
	function RegMatpasoII(frm,page,cmb,cmb2,cmb3){

      var val_cmb=eval(frm+'.'+cmb+'.value'); 
      var val_cmb2=eval(frm+'.'+cmb2+'.value'); 
      var val_cmb3=eval(frm+'.'+cmb3+'.value'); 
   if ((val_cmb!=='' && val_cmb3!=='') ){
      eval("location='"+page+"&id_1="+val_cmb+"&id_2="+val_cmb2+"&id_3="+val_cmb3+"'");
   }else{
         alert("Debe seleccionar una materia y Paralelo para consultar el profesor.");
         cmb.focus();
   }
      
}

function jump_1(page,cmb){
   id_t=cmb.value;
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (id_t!=='' ){
      eval("location='"+page+"&id_t="+id_t+"'");
   }else{
         alert("Debe seleccionar una tutoría.");
         cmb.focus();
   }
      
}
function jump_1_nivel(page,cmb){
   id_n=cmb.value;
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (id_n!=='' ){
      eval("location='"+page+"&id_n="+id_n+"'");
   }else{
         alert("Debe seleccionar un nivel.");
         cmb.focus();
   }
      
}



function update_cuotas(formulario)

{
  var checkOKIsAlpha = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzáéíóú %${}¨*[]?¡_'¿,.:";
  var checkOKIsNumeric = "0123456789"
  var checkOKIsE_mail = "@"
  var checkStr 
  var allValid
  var ch
  var i

  //Que no contenga vacio en el año 
  if (formulario.valor.value.length == 0 )
  {
    texto="============ Validación de valor! ============\n";
    texto+="Por favor, ingrese el valor de la cuota.\n";

	alert(texto);
    formulario.valor.focus();
    return (false);
  }

if (formulario.fecha_pago.value.length == 0 )
  {
    texto="============ Validación de fecha de pagos! ============\n";
    texto+="Por favor, ingrese la fecha de pago.\n";

	alert(texto);
    formulario.fecha_pago.focus();
    return (false);
  }
  
if (formulario.fecha_legalizacion.value.length == 0 )
  {
    texto="============ Validación de fecha de legalizacion! ============\n";
    texto+="Por favor, ingrese la fecha de legalización.\n";

	alert(texto);
    formulario.fecha_legalizacion.focus();
    return (false);
  }

   
  return (true);
  
 }


