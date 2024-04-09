// JavaScript Document

function MM_openBrWindow(theURL,winName,features) { //v2.0
 
 var id = Math.floor((Math.random() * 10000) + 1);
 
  var scrnx;
  var scrny;
  var tope;
  var left1;
  if(screen.width == "1024")
  {
     scrnx=0;
     scrny=0;
     tope=0;
     left1=0;
  }
  else
  {
     if(screen.width == "800")
     {
        scrnx=0;
        scrny=0;
        tope=0;
        left1=0;
     }
     else
     {
        scrnx=0;
        scrny=0;
        tope=0;
        left1=0; 
     }
   }
  features = features + ',screenx='+scrnx+',screeny=' +scrny+',top='+tope+',left='+left1+',width='+screen.width+',height='+screen.height;
   t=window.open(theURL,winName+id,features);
  t.focus();
  
}

function abrirVentana(theURL,winName,features) { //v2.0
 
  var scrnx;
  var scrny;
  var tope;
  var left1;
  if(screen.width == "1024")
  {
     scrnx=50;
     scrny=50;
     tope=35;
     left1=50;
  }
  else
  {
     if(screen.width == "800")
     {
        scrnx=50;
        scrny=50;
        tope=35;
        left1=50;
     }
     else
     {
        scrnx=50;
        scrny=50;
        tope=35;
        left1=50; 
     }
   }
features = features + ',screenx='+scrnx+',screeny=' +scrny+',top='+tope+',left='+left1;
  t=window.open(theURL,winName,features);
  t.focus();
  
}

function abrirVentanaPrint(theURL,winName,features) { //v2.0
 
  var scrnx;
  var scrny;
  var tope;
  var left1;
  if(screen.width == "1024")
  {
     scrnx=0;
     scrny=0;
     tope=0;
     left1=0;
  }
  else
  {
     if(screen.width == "800")
     {
        scrnx=0;
        scrny=0;
        tope=0;
        left1=0;
     }
     else
     {
        scrnx=0;
        scrny=0;
        tope=0;
        left1=0; 
     }
   }
features = features + ',screenx='+scrnx+',screeny=' +scrny+',top='+tope+',left='+left1;
  t=window.open(theURL,winName,features);
  t.print();
  t.focus();
  
}



function clave (n){
	frm_signIn.password.value+= n;
}

function limpiar(){
	frm_signIn.password.value='';
}


function ___d(MoveTo){
	var SelectTo = eval('document.frm.'+MoveTo); 
	SelectTo.options.length = 0;
	}


    function validateForm(args)  //version 0.1
	{

	 var checkOKIsAlpha = "ABCDEFGHIJKLMN—OPQRSTUVWXYZ¡…Õ”⁄abcdefghijklmnÒopqrstuvwxyz·ÈÌÛ˙ %${}®*[]?°_'ø,.: ";
     var checkOKIsNumeric = "0123456789";
     var checkOKIsE_mail = "@";
	 var checkStr; 
     var allValid;
     var ch;
	 var i,listArgs,listParams,form;

	
	 
	 listArgs=args.split('|');
	 form=listArgs[0];
	  
	 for (var i=1;i<listArgs.length;i++){
		
			listParams=listArgs[i].split(';');
			var e = eval(form+'.'+listParams[0]);
	        var t= listParams[1];
	    	switch(t){
				  case 'R': //PARA LEER UN DATO DIFERENTE DEL VACIO
				    	
						if ( typeof( e ) == 'undefined' ){
						   alert(".:: Tr4ckPlan ::.  \n \n Por favor, debe generar una secuencia");
						  return (false);
						  }
						
						if ( e.value.length == 0 ){
						   alert(".:: Tr4ckPlan ::.  \n \n Por favor, debe ingresar/Seleccionar un valor.");
						   (e.type=='text' || e.type=='password' || e.type=='textarea') ? e.style.backgroundColor='#FFFFCC' : e.style.backgroundColor='#FFFFFF';
						   // e.focus();
					        return (false);
						  }
				  break;
				  case 'E': //PARA LEER UN EMAIL CORRECTO
				  		var pos = 0;
						if ( e.value.length > 7 && e.value.indexOf ( ' ', 0 ) == -1 )	{
							pos = e.value.indexOf ( '@', 0 );
							if ( pos > 2 && e.value.indexOf ( '@', pos ) && e.value.indexOf ( '.', pos ) > ( pos + 2 ) )	{
								pos = e.value.indexOf ( '.', pos );
									if ( pos > -1 && pos < e.value.length - 2 )
									return (true);
							  }
						}			
						   alert("Ingrese un e-mail correcto");
						   e.style.backgroundColor='#FFFFCC';
						   e.focus();
					       return (false);
				  break;
				  
				  case 'N': //PARA LEER UN DATO NUMERICO
				  				
				   checkStr = e.value;
                      allValid = true;
                		
						if (checkStr.length > 0  ) {
						for (i = 0;  i < checkStr.length;  i++)
                    		  { 		   
                    			
								ch = checkStr.charAt(i);
                    			for (j = 0;  j < checkOKIsAlpha.length;  j++)
                    			  if (ch == checkOKIsAlpha.charAt(j)) {
                 				   allValid = false//hay un numero
                				   break
                   				}
                    		  }
						    }// fin de if checkStr
						    
							if (checkStr=='') {allValid = false; } 
						
							   if (!allValid)
							  {
								//alert("Debe ingresar un N˙mero.");
								e.style.backgroundColor='#FF9999';
								e.focus();
								//e.value='';
								return (false)
							  }
							  
						  
						
						 break;
				case 'B': //para categoria en blanco
				
				break;
				
				} 
	    }
   	 return (true);
	 
	
  } 

/**************************************************************************************
      Creacion de Tablas usando DOM
***************************************************************************************/
function Table( rows, cols , strHeader)
{
	
	this.rows = rows;
	this.cols = cols;
	this.table = document.createElement( "table" );
	this.table.className="TituloGrid";
	
	
    
	
	var listHeader=strHeader.split('|');
	 
	for( var i=0; i<rows; i++ )
	{
		var row = this.table.insertRow(i);
		for( var j=0; j<cols; j++ )
		{
			col = row.insertCell(j);
		    //col.appendChild( document.createTextNode("\xA0"));
		    	
			if (i<1) col.appendChild( document.createTextNode(listHeader[j]) );
		}
	}
	
	this.appendInBody = function ( )
	{
		document.body.appendChild( this.table ) 
	}

	this.appendInId = function ( id )
	{
		document.getElementById( id ).appendChild( this.table ) 
	}

	this.deleteRow = function ( rowPos )
	{
		this.table.deleteRow( rowPos );
	}

	this.getCell = function ( rowPos, colPos )
	{
		return this.table.firstChild.childNodes.item( rowPos ).childNodes.item( colPos );
	}
	
	this.getRow = function ( rowPos )
	{
		return this.table.firstChild.childNodes.item( rowPos );
	}
	
	this.getRowPos = function ( rowElement )
	{
		for( var i=0; rowElement; i++)
		{
			rowElement = rowElement.previousSibling;
		}
		return (i-1);
	}
	
	this.getTable = function ( )
	{
		return this.table;
	}

	this.insertInCell = function ( row, col, el )
	{
		this.getCell(row,col).appendChild( el );
	    
	}
	
	this.insertRow = function ( row )
	{
		if( row != undefined )
		{
			row = this.table.insertRow( row );
			
			for( var j=0; j<this.cols; j++ )
			{
				col = row.insertCell(j);
				col.className="celdasTabla";
				//col.appendChild( document.createTextNode("\xA0") );
			}
		}
		else
		{
			
			row = this.insertRow( this.numRows() );
			
		}
		return row;
	}
	
	this.numRows = function ( )
	{
		if( this.table.firstChild )
			return this.table.firstChild.childNodes.length;
		else
			return 0;
	}	

	this.setColSpan = function ( row, col, span )
	{
		cell    = this.getCell( row, col );
		_parent = cell.parentNode;
		for(var i=1; i<span; i++ )
		{
			_parent.removeChild( cell.nextSibling );
		}
		this.getCell(row,col).setAttribute( "colSpan", span );
	}	

	this.setAttribute = function ( _name, _value )
	{
		this.table.setAttribute( _name, _value );
	}	
}

/************************************************************************************
          Implementation of Table Dom AJAX
*************************************************************************************/
function agregar(str,strColType,objTable,strDiv){
	rows=objTable.numRows();
	if (rows>0){
		objTable.insertRow(rows);
		    //para asignar elementos a cada columna
			var listArgs,i;
    		listCol=strColType.split('|');
	 		
			var txtNo=document.createTextNode(rows);
				objTable.insertInCell(rows,0,txtNo);
						
			
	 		for (var i=1;i<listCol.length;i++){
				
				switch (listCol[i]){
					case 'A': //for Ajax database
						var objDiv=document.createElement("div");
						objDiv.id='div'+strDiv+rows+i;
						objTable.insertInCell(rows,i,objDiv);
						setTimeout("sendUrl('"+str+"p="+strDiv+rows+i+"','POST','div"+strDiv+rows+i+"');",1);
						
					break;
					case 'T': //For TextBox in Grid
						var input=document.createElement("input");
						input.name="txt"+strDiv+rows+i;
						input.value="";
						input.className="ct";
						input.size=5;
						objTable.insertInCell(rows,i,input);
										
					break;
					case 'C':
					break;
					case 'L':
					break;
					}
				
    			
			
			}
			
			
    }
}

function borrarFila(objTable){
	numRows=objTable.numRows();
		if (numRows>1){
			numRows--;
			objTable.deleteRow(numRows);
       }
     }


function leerDatos(){
var n=document.frmDebitos.elements.length;
contador=0;
 for (var i=0;i<n;i++)
	{
	var e = document.frmDebitos.elements[i];
	    if (e.type=='text')
			{
			alert (e.value);
			}

	 }

}

/*Ojo corregir esta funcion*/
function loading(){
	alert ('ok');
	var objDiv=document.createElement("div");
		objDiv.id='loading';
		objDiv.className="ct";
		objDiv.innerHTML="Cargando por favor espere...";
		var parentEl=document.body;
            parentEl.append(objDiv);
			
		//setTimeout("sendUrl('"+str+"p="+strDiv+rows+i+"','POST','div"+strDiv+rows+i+"');",1);
	}



function __jump(parametros)
{
	lstParams=parametros.split('|');
	form = lstParams[0];
	url =  lstParams[1];
	lstTags=lstParams[2].split(';');
	strURL = url+'?';
		
			for (i=0;i<lstTags.length;i++){	
				var e = eval(form+'.'+lstTags[i]);
				strURL += 'j'+i+'='+ e.value +'&'; 
			//alert(strURL);
				}
			strURL = strURL.substr(0,(strURL.length-1));
	//alert(strURL);
window.location=strURL;
//eval("location='"+strURL+"'");
}

function lookup(idAnalisis,idArticulo,idLaboratorio,tagPosition) {
			
		if(idAnalisis.length == 0) {
			// Hide the suggestion box.
			$('#suggestions').hide();
		} else {
			$.post("___sqlAjax.aspx?typ=14", {p0: ""+idAnalisis+"",p1: ""+idArticulo+"",p2: ""+idLaboratorio+""}, function(data){
				//alert (data.length);
				if(data.length >0) {
					x=$(tagPosition).position();
					$('#suggestions').css({"position": "absolute", "top" : ""+x.top+"px", "left" : ""+(x.left+30)+"px","background-color": "#DFF2BF","background-repeat" : "no-repeat", "border" : "1px solid"});
					$('#suggestions').show();
					$('#autoSuggestionsList').html(data);
					
				}
			});
		}
	} // lookup
	
	function fill(thisValue) {
		$('#suggestions').hide();		
	}
	
	
	function habilitar_Asistencia(frm,chkGeneral){
	var obCheck=document.getElementById(chkGeneral);
	
	if (obCheck.checked)
		 {
			for (var i=0;i<eval('document.'+frm+'.elements').length;i++)
				{
				var e = eval('document.'+frm+'.elements['+i+']');
					if (e.type=='checkbox')
					{
					   pos1=e.name.indexOf('_');
					  if (pos1>0) e.checked=true;					  				
					}
			
				}
			
					
		 }else{
			
			for (var i=0;i<eval('document.'+frm+'.elements').length;i++)
				{
				var e = eval('document.'+frm+'.elements['+i+']');
					if (e.type=='checkbox')
					{
					   pos1=e.name.indexOf('_');
					  if (pos1>0) e.checked=false;					  				
					}
			
				}
	   }
}



function leerCHK(frm,objContenedor){
var strIDS = ''; var salida = false;
for (var i=0;i<eval('document.'+frm+'.elements').length;i++)
		{
	    	var e = eval('document.'+frm+'.elements['+i+']');
				if (e.type=='checkbox')
					{  pos1=e.name.indexOf('_');
					  if (pos1>0 && e.checked) 
					   { strIDS += e.value +',';  }					  
					}			
				}		
		 if (strIDS.length > 1 ){
			eval('document.'+frm+'.'+objContenedor).value = strIDS.substr(0,(strIDS.length-1));
		    salida = true;
		 }
  return salida;							
}     

