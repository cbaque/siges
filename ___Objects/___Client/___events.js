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
	
	
