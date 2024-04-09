/************************************************************************************
                  Ajax para el manejo del Arbol
**************************************************************************************/

var Ajax = new Object();
Ajax.showMessage=1;
Ajax.Message='';

Ajax.Request = function(url, callbackMethod)
{
	Page.getPageCenterX();
	Ajax.request = Ajax.createRequestObject();
	Ajax.request.onreadystatechange = callbackMethod;
	Ajax.request.open("POST", url, true);
	Ajax.request.send(url);
}


Ajax.setMessage = function (message)
{
	Ajax.Message=message;
}
Ajax.setShowMessage = function (m)
{
	Ajax.showMessage=m;
}

Ajax.createRequestObject = function()
{
	var obj;
	if(window.XMLHttpRequest)
	{
		obj = new XMLHttpRequest();
	}
	else if(window.ActiveXObject)
	{
		obj = new ActiveXObject("MSXML2.XMLHTTP");
	}
	return obj;
}


Ajax.CheckReadyState = function(obj)
{
	if ( Ajax.showMessage == 0 )
	{
		document.getElementById('loadingbox').style.display = "none";
	}
	else
	{
		document.getElementById('loadingbox').style.display = "block";
	}	
	if(obj.readyState < 4) {
		document.getElementById('loadingbox').style.top = (Page.top + Page.height/2)-100;
		document.getElementById('loadingbox').style.left = Page.width/2-75;
		document.getElementById('loadingbox').style.position = "absolute";
		document.getElementById('loadingbox').innerHTML = '<table border=0 cellpadding=0 cellspacing=1 width=100 bgcolor="#f1f1f1"><tr><td align=center bgcolor="#ffffff" class=loading height="22px" style="font-family:verdana;font-size:12px">Cargando...</td></tr></table>';
	}
	if( obj.readyState == 4 )
	{
		if(obj.status == 200)
		{
			document.getElementById('loadingbox').innerHTML = "<table border=0 cellpadding=0 cellspacing=1 width=100 bgcolor=#f1f1f1><tr><td align=center class=loading bgcolor=#ffffff height='22px' style='font-family:verdana;font-size:12px'>"+Ajax.Message+"</td></tr></table>";
			setTimeout('Page.loadOut()',2200);
			return true;
		}
		else
		{
			document.getElementById('loadingbox').innerHTML = "HTTP " + obj.status;
		}
	}
}



/****************************************************************************************
              Ajax Para el manejo independiente de cada elemento Html
******************************************************************************************/

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
   
function sendUrl(url,po_method,po_div){
	
	var lo_container;
	//alert(ps_pagehtml);
	if(po_div==undefined){
	   lo_container = document.getElementById('IdEstado');		
	} else {
		//alert(po_div);
	   lo_container = document.getElementById(po_div);			
	 }
	
	var lo_ajax=createAjaxObject();
	
	lo_container.innerHTML = "Cargando...";
	
	if(po_method==undefined){
		po_method="GET";
	} 
	
	lo_ajax.open(po_method, url,true);
	lo_ajax.onreadystatechange=function() {
			if (lo_ajax.readyState==4) {
				  lo_container.innerHTML = lo_ajax.responseText;
			} 
	}
	if(po_method=="GET"){
		lo_ajax.send(null);
	} else {
		lo_ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        lo_ajax.send(null);
	}
}



