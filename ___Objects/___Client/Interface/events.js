//window.status='Sistema Web Académico';

	function windows_unload()
  {  	
	setTimeout("fwclose()",200);
	 window.parent.display="destroysession.asp";	
  }
  function fwclose()
  {
   	window.parent.close();
  }
	
	/*function right(e) 
	{
		if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2))
		{
			alert ("Sistema Academico Web");
			return false;
		}
		if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) 
		{
			alert ("Sistema Academico Web");
			return false;
		}
		return true;
	}
	document.onmousedown=right;
	
	if(document.layers) window.captureEvents(Event.MOUSEDOWN);
	window.onmousedown=right;*/
	
	
var delimiter = ":"; 
function MoveOption (MoveFrom, MoveTo, ToDo) { 
var SelectFrom = eval('document.main_form.'+MoveFrom); 
var SelectTo = eval('document.main_form.'+MoveTo); 
var SelectedIndex = SelectFrom.options.selectedIndex; 
var container; 

if (ToDo=='Add') { 
container=eval('document.main_form.'+ToDo+MoveTo); 
} 
if (ToDo=='Remove') { 
container=eval('document.main_form.'+ToDo+MoveFrom); 

} 
if (SelectedIndex == -1) { 
alert("Por favor, seleccione una categoría antes de agregar ó Remover."); 
} else { 

for (i=0; i<SelectFrom.options.length; i++) { 
if(SelectFrom.options[i].selected) { 

var name = SelectFrom.options[i].text; 
var ID = SelectFrom.options[i].value; 

SelectFrom.options[i] = null; 
SelectTo.options[SelectTo.options.length]=new Option (name,ID,true); 
i=i-1; 
/*if(ToDo=='Add'||ToDo=='Remove') { 
alert (container.value);
container.value=container.value+name+delimiter; 
//container.value=container.value+ID+delimiter; 
} */
} 
} 
} 
/* Para seleccionar todos los elementos de la lista de opciones*/
for (var i=0; i<SelectTo.options.length; i++) {
		var o = SelectTo.options[i];
			o.selected=true;
		}

/* fín de seleccionar*/
} 


function MoveOption_Dates ( MoveTo,Dia,mes,anio,typ) { //MoveFrom,
//var SelectFrom = eval('document.main_form.'+MoveFrom); // Mover de 
var SelectTo = eval('document.main_form.'+MoveTo);  // Mover a
var d=Dia.value;
var m=mes.value;
var a=anio.value;
var fecha=d+'-'+m+'-'+a;
var SelectedIndex = SelectTo.options.selectedIndex; //Items seleccionados

if ((d == '') || (m == '') || (a == '')) { 
    alert("Por favor, seleccione una fecha antes de agregar ó Remover."); 
} else { 
		//alert (SelectTo.options.length);
		//for (i=0; i<SelectTo.options.length; i++) { 
		if (typ==0)
				{
				
				  if (SelectedIndex == -1) { 
                    alert("Por favor, seleccione una categoría para Remover."); 
                   } else { 
				       for (i=0; i<SelectTo.options.length; i++) { 				   
						  if(SelectTo.options[i].selected) { 
						     SelectTo.options[i] = null;  	
				          }
					   }
				    }
				  
				
				}else{
			     	SelectTo.options[SelectTo.options.length]=new Option (fecha,fecha);
					for (var i=0; i<SelectTo.options.length; i++) {
		                var o = SelectTo.options[i];
			                o.selected=true;
		                   }
					Dia.focus();  
				}
	} 
} 


function MoveOption_PlaningPar ( MoveTo,num,typ) { //MoveFrom,
//var SelectFrom = eval('document.main_form.'+MoveFrom); // Mover de 
var SelectTo = eval('document.main_form.'+MoveTo);  // Mover a
var n=num.value;
var SelectedIndex = SelectTo.options.selectedIndex; //Items seleccionados

if ((n == '' && typ==1) ) { 
    alert("Por favor, ingrese el numero de estudiantes para agregar ó Remover."); 
} else { 
		//alert (SelectTo.options.length);
		//for (i=0; i<SelectTo.options.length; i++) { 
		if (typ==0)
				{
				
				  if (SelectedIndex == -1) { 
                    alert("Por favor, seleccione un número para Remover."); 
                   } else { 
				       for (i=0; i<SelectTo.options.length; i++) { 				   
						  if(SelectTo.options[i].selected) { 
						     SelectTo.options[i] = null;  	
				          }
					   }
				    }
				  
				
				}else{
			     	SelectTo.options[SelectTo.options.length]=new Option (n,n); 
					for (var i=0; i<SelectTo.options.length; i++) {
		                 var o = SelectTo.options[i];
       			       o.selected=true;
 		               }
					num.value='';
					num.focus(); 
				}
	} 
} 



function ValidateRezagados(formulario,cmb1,cmb2,cmb3,list) {
	 if (eval(formulario+'.'+cmb1+'.value.length') == 0 )
		  {
			alert("Debe seleccionar la Unidad Académica.");
		   eval(formulario+'.'+cmb1+'.focus()');
			return (false);
		  }

  	if (eval(formulario+'.'+cmb2+'.value.length') == 0 )
		  {
			alert("Debe seleccionar una Tutoria.");
		   eval(formulario+'.'+cmb2+'.focus()');
			return (false);
		  }

	var SelectTo = eval(formulario+'.'+list);
	var SelectedIndex = SelectTo.options.selectedIndex; //Items seleccionados

 	if (SelectedIndex == -1) { 
	   alert("Por favor, seleccione los estudiantes a Registrar."); 
	   eval(formulario+'.'+list+'.focus()');
	  return (false);
	   }

	if (eval(formulario+'.'+cmb3+'.value.length') == 0 )
	  {
		alert("Debe seleccionar un Paralelo.");
	   eval(formulario+'.'+cmb3+'.focus()');
		return (false);
	  }
 	return (true);
}


function ValidatePlaningMat(formulario) {
   if (formulario.AS_tutorias.value.length == 0)
	  {
		alert("Debe seleccionar una tutoría.");
		formulario.AS_tutorias.focus();
		return (false);
	  }
    var SelectedIndex = formulario.list_materias_selected.options.selectedIndex; //Items seleccionados
	if (SelectedIndex == -1) { 
	   alert("Por favor, seleccione las materias a Planificar."); 
	   formulario.list_materias_selected.focus();
	   return (false);
	   }
	for (var i=0; i<formulario.list_materias_selected.options.length; i++)
		{
		var o = formulario.list_materias_selected.options[i];
			o.selected=true;
		}	
	return (true);
}


function ValidatePlaningTut(formulario,n) {
   
   for (i=1;i<=n;i++){
   
   var SelectedIndex = eval(formulario+'.list_fechas'+i+'.options.selectedIndex'); //Items seleccionados
	if (SelectedIndex == -1) { 
	   alert("Debe asignar fechas a la tutoria # "+i+"");
		eval(formulario+'.list_fechas'+i+'.focus()');
		return (false);
	   }
  
     
   }
   
   for (i=1;i<=n;i++){
   
   for (var k=0; k<eval(formulario+'.list_fechas'+i+'.options.length'); k++)
		{
		var o = eval(formulario+'.list_fechas'+i+'.options['+k+']');
			o.selected=true;
		}
   }
   
   /*
    var SelectedIndex = formulario.list_materias_selected.options.selectedIndex; //Items seleccionados
	if (SelectedIndex == -1) { 
	   alert("Por favor, seleccione las materias a Planificar."); 
	   formulario.list_materias_selected.focus();
	   return (false);
	   }
	for (var i=0; i<formulario.list_materias_selected.options.length; i++)
		{
		var o = formulario.list_materias_selected.options[i];
			o.selected=true;
		}*/	
	return (true);
}

function view_Par_byNiv(page,cmb,cmb_nivel,pc){
   id_ccm=cmb.value;
   id_nivel=cmb_nivel.value;
   nom_nivel=cmb_nivel.options[cmb_nivel.selectedIndex].text;
   id_pc=pc.value;
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (id_ccm!=='' && id_nivel!==''){
      eval("location='"+page+"&id_ccm="+id_ccm+"&id_n="+id_nivel+"&id_pc="+id_pc+"&n_niv="+nom_nivel+"'");
   }else{
         alert("seleccione la carrera y el curso.");
         cmb_nivel.focus();
   }
      
}


function view_Par_byNiv_migracion(page,cmb,cmb_nivel,pc,par){
   id_ccm=cmb.value;
   id_par=par.value;
   id_nivel=cmb_nivel.value;
   nom_nivel=cmb_nivel.options[cmb_nivel.selectedIndex].text;
   id_pc=pc.value;
   nom_mat=par.options[par.selectedIndex].text;
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (id_ccm!=='' && id_nivel!==''){
      eval("location='"+page+"&id_ccm="+id_ccm+"&id_n="+id_nivel+"&id_pc="+id_pc+"&n_niv="+nom_nivel+"&id_par="+id_par+"&nom_mat="+nom_mat+"'");
   }else{
         alert("seleccione la carrera y el curso.");
         cmb_nivel.focus();
   }
      
}


function ___jump5(page,cmb,cmb_nivel,pc,par,matActas){
   id_ccm=cmb.value;
   id_par=par.value;
   id_nivel=cmb_nivel.value;
   id_materias_aptas=matActas.value;
   nom_nivel=cmb_nivel.options[cmb_nivel.selectedIndex].text;
   id_pc=pc.value;
   nom_mat=par.options[par.selectedIndex].text;
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (id_ccm!=='' && id_nivel!=='' && id_par!=='' && id_materias_aptas!=='' && id_pc!==''){
      eval("location='"+page+"&id_ccm="+id_ccm+"&id_n="+id_nivel+"&id_pc="+id_pc+"&n_niv="+nom_nivel+"&id_par="+id_par+"&nom_mat="+nom_mat+"&id_ma="+id_materias_aptas+"'");
   }else{
         alert("seleccione la carrera, curso, paralelo, nivel y materia");
         cmb_nivel.focus();
   }
      
}



function habilitar_Notas_Migracion(prom,exam,rec,art13,chk)
{
			colorN="#FFFFcc";
			colorZ="#F1F1F1"; 
		 if (chk.checked)
		 {
			chk.value=1;
			//quote.disabled=false;
			
			prom.value='';
			exam.value='';
			rec.value='';
			art13.value='';
						
			prom.disabled=false;
			exam.disabled=false;
			rec.disabled=false;
			art13.disabled=false;
						
			
			prom.style.backgroundColor=colorN;
			exam.style.backgroundColor=colorN;
			rec.style.backgroundColor=colorN;
			art13.style.backgroundColor=colorN;			

		 }else{
			//quote.disabled=true;
			
			prom.value='';
			exam.value='';
			rec.value='';
			art13.value='';
						
			prom.disabled=true;
			exam.disabled=true;
			rec.disabled=true;
			art13.disabled=true;
						
						
			prom.style.backgroundColor=colorZ;
			exam.style.backgroundColor=colorZ;
			rec.style.backgroundColor=colorZ;
			art13.style.backgroundColor=colorZ;
						
					   
		 }

}


function SendToregister_Notas_Migracion(prom,exam,rec,art13,chk,Page)
{
			colorN="#FFFFcc";
			colorZ="#F1F1F1"; 
		 if (chk.checked)
		 {
			ck=chk.value;
			//quote.disabled=false;
			
			//------------------------------------------------------------------------------------------------------------
		     //  OJO DEBE VALIDARSE MINIMO TRES ACTIVIDADES EN JAVASCRIPT
			//if ((act1.value.length==0 ) || (act2.value.length==0) || (act3.value.length==0) || (act4.value.length==0) || (act5.value.length==0) || (exam.value.length==0)) {
			if ((prom.value.length==0 ) || (exam.value.length==0)) {
			
			prom.focus();
			        alert ('Debe Ingresar las notas de Promedio de Actividades y Exámen');
			}else{
				pr=prom.value;
				ex=exam.value;
				re=rec.value;
				ar=art13.value;
								
				if ((pr<0 || pr>10) || (ex<0 || ex>10)) {
				   prom.focus();
			        alert ('Debe Ingresar las notas entre 0 y 10 puntos');
				}else{
				   
				   location.href=Page+"&pr="+ pr+"&ex="+ex+"&r="+re+"&at="+ar+"&chk="+ck;
				
				}
			}			
		//------------------------------------------------------------------------------------------------------------
			
				
		 }else{
           alert ('Debe chequear un registro e ingresar las notas');					   
		 }
}


function habilitar_NotasIN_Migracion(sum,exam,rec,art13,chk)
{
			colorN="#FFFFcc";
			colorZ="#F1F1F1"; 
		 if (chk.checked)
		 {
			chk.value=1;
			//quote.disabled=false;
			
			sum.value='';
			exam.value='';
			rec.value='';
			art13.value='';
			
			
			sum.disabled=false;
			exam.disabled=false;
			rec.disabled=false;
			art13.disabled=false;
			
			sum.style.backgroundColor=colorN;
			exam.style.backgroundColor=colorN;
			rec.style.backgroundColor=colorN;
			art13.style.backgroundColor=colorN;
						
			

		 }else{
			//quote.disabled=true;
			
			sum.value='';
			exam.value='';
			rec.value='';
			art13.value='';
			
			sum.disabled=true;
			exam.disabled=true;
			rec.disabled=true;
			art13.disabled=true;
			
						
			sum.style.backgroundColor=colorZ;
			exam.style.backgroundColor=colorZ;
			rec.style.backgroundColor=colorZ;
			art13.style.backgroundColor=colorZ;
									
					   
		 }

}



function SendToregister_NotasIN_Migracion(sum,exam,rec,art13,chk,Page)
{
			colorN="#FFFFcc";
			colorZ="#F1F1F1"; 
		 if (chk.checked)
		 {
			ck=chk.value;
			//quote.disabled=false;
				if ((sum.value.length==0 ) || (exam.value.length==0)) {
			        sum.focus();
			        alert ('Debe Ingresar la nota del Exámen y la suma de Actividades');
			}else{
			
			su=sum.value;
			ex=exam.value;
			re=rec.value;
			at=art13.value;
					
			
			if ((su<0 || su>10) || (ex<0 || ex>2.5)) {
				   sum.focus();
			        alert ('Debe Ingresar entre 0 y 2.5 para nota de Exámen \n entre 0 y 7.5 para suma de Actividades');
				}else{
				   location.href=Page+"&su="+su+"&ex="+ex+"&r="+re+"&at="+at+"&chk="+ck;
				}
					
			
			}		
			
		 }else{
           alert ('Debe chequear un registro e ingresar las notas');					   
		 }
}


function ValidateArrastres(formulario) {
   if (formulario.tipoRegistro.value.length == 0)
	  {
		alert("Debe seleccionar el tipo de registro.");
		formulario.tipoRegistro.focus();
		return (false);
	  }
    var SelectedIndex = formulario.AS_arrastres.options.selectedIndex; //Items seleccionados
	if (SelectedIndex == -1) { 
	   alert("Por favor, seleccione los estudiantes que estan arrastrando la materia."); 
	   formulario.AS_arrastres.focus();
	   return (false);
	   }
	for (var i=0; i<formulario.AS_arrastres.options.length; i++)
		{
		var o = formulario.AS_arrastres.options[i];
			o.selected=true;
		}	
	return (true);
}


function jump_arrastres(page,cmb){
   id_n=cmb.value;
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (id_n!=='' ){
      eval("location='"+page+"&id_n="+id_n+"'");
   }else{
         eval("location='"+page+"&id_n='");
   }
      
}

function ValidateMigracion(formulario,cmb,list1,list2) {
	 if (eval(formulario+'.'+cmb+'.value.length') == 0 )
		  {
			alert("Debe seleccionar el tipo de registro.");
		   eval(formulario+'.'+cmb+'.focus()');
			return (false);
		  }

	var SelectTo = eval(formulario+'.'+list1);
	var SelectedIndex = SelectTo.options.selectedIndex; //Items seleccionados

 	if (SelectedIndex == -1) { 
	   alert("Por favor, seleccione las materias a Registrar."); 
	   eval(formulario+'.'+list1+'.focus()');
	  return (false);
	   }

	var SelectTo = eval(formulario+'.'+list2);
	var SelectedIndex = SelectTo.options.selectedIndex; //Items seleccionados

 	if (SelectedIndex == -1) { 
	   alert("Por favor, seleccione los estudiantes."); 
	   eval(formulario+'.'+list2+'.focus()');
	  return (false);
	   }
	
 	return (true);
}


function ValidatePlaningMat(formulario) {
   if (formulario.AS_tutorias.value.length == 0)
	  {
		alert("Debe seleccionar una tutoría.");
		formulario.AS_tutorias.focus();
		return (false);
	  }
    var SelectedIndex = formulario.list_materias_selected.options.selectedIndex; //Items seleccionados
	if (SelectedIndex == -1) { 
	   alert("Por favor, seleccione las materias a Planificar."); 
	   formulario.list_materias_selected.focus();
	   return (false);
	   }
	for (var i=0; i<formulario.list_materias_selected.options.length; i++)
		{
		var o = formulario.list_materias_selected.options[i];
			o.selected=true;
		}	
	return (true);
}


function ValidatePlaningTut(formulario,n) {
   
   for (i=1;i<=n;i++){
   
   var SelectedIndex = eval(formulario+'.list_fechas'+i+'.options.selectedIndex'); //Items seleccionados
	if (SelectedIndex == -1) { 
	   alert("Debe asignar fechas a la tutoria # "+i+"");
		eval(formulario+'.list_fechas'+i+'.focus()');
		return (false);
	   }
  
     
   }
   
   for (i=1;i<=n;i++){
   
   for (var k=0; k<eval(formulario+'.list_fechas'+i+'.options.length'); k++)
		{
		var o = eval(formulario+'.list_fechas'+i+'.options['+k+']');
			o.selected=true;
		}
   }
   
   /*
    var SelectedIndex = formulario.list_materias_selected.options.selectedIndex; //Items seleccionados
	if (SelectedIndex == -1) { 
	   alert("Por favor, seleccione las materias a Planificar."); 
	   formulario.list_materias_selected.focus();
	   return (false);
	   }
	for (var i=0; i<formulario.list_materias_selected.options.length; i++)
		{
		var o = formulario.list_materias_selected.options[i];
			o.selected=true;
		}*/	
	return (true);
}


function view_asistenciaCursos(page,cmb,periodoCiclo){
    id_ccm=cmb.value;
    id_pc=periodoCiclo.value;
   //alert ("location='"+page+"&ti="+typ_identification+"&ni="+num_identification+"'");
   if (id_ccm!=='' && id_pc!=''){
      eval("location='"+page+"&id_ccm="+id_ccm+"&id_pc="+id_pc+"'");
   }else{
         alert("Debe seleccionar la carrera el centro de estudio y la modalidad.");
         cmb.focus();
   }
      
}
