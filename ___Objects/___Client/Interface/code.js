// JavaScript Document

function LoadComboCities_1(szForm) {
		
		if (szForm == 'SHIPPMENT') {
		
			comboProv = document.theForm.SHIPPROV;		
			if (comboProv==null) comboProv="";		
			comboShipCity = document.theForm.SHIPCITY;
		
		} else if(szForm == 'REGISTER'){
			//alert("Hola:" + szForm)
			comboProv = document.frmRegister.CUSTOMPROV;		
			if (comboProv==null) comboProv="";		
			comboShipCity = document.frmRegister.CUSTOMCITY;		
		
		}
		
	   ShipProvChoosed = comboProv[comboProv.selectedIndex].text;		
		
		if (ShipProvChoosed=='Azuay')
		{	nCiudad = 3;
			comboShipCity.options.length = 0;			
			addOption = new Option('Cuenca','Cuenca','defaultselected');
            comboShipCity.options[0]=addOption;
			addOption = new Option('Baños');
            comboShipCity.options[1]=addOption;
			addOption = new Option('Sig Sig');
            comboShipCity.options[2]=addOption;
						
		} else if ( ShipProvChoosed == 'Cañar') {
			nCiudad = 2;
			comboShipCity.options.length = 0;			
			addOption = new Option('Azogues');
            comboShipCity.options[0]=addOption;
			addOption = new Option('Eugenio Espejo');
            comboShipCity.options[1]=addOption;			
						
			
		} else if ( ShipProvChoosed == 'Pichincha') {
			nCiudad = 2;
			comboShipCity.options.length = 0;			
			addOption = new Option('Quito');
            comboShipCity.options[0]=addOption;
			addOption = new Option('Sto Domingo');
            comboShipCity.options[1]=addOption;
									
		} else if ( ShipProvChoosed == 'Guayas') {
			nCiudad = 4;
			comboShipCity.options.length = 0;			
			addOption = new Option('Guayaquil');
            comboShipCity.options[0]=addOption;
			addOption = new Option('Salinas');
            comboShipCity.options[1]=addOption;
			addOption = new Option('Duran');
            comboShipCity.options[2]=addOption;
			addOption = new Option('Cerecita');
            comboShipCity.options[3]=addOption;
			
								
		} else if ( ShipProvChoosed == 'Manabi') {
			nCiudad = 3;
			comboShipCity.options.length = 0;			
			addOption = new Option('Portoviejo');
            comboShipCity.options[0]=addOption;
			addOption = new Option('Manta');
            comboShipCity.options[1]=addOption;
			addOption = new Option('Montecristi');
            comboShipCity.options[2]=addOption;
			
		
		}  else if ( ShipProvChoosed == 'El Oro') {
			nCiudad = 4;
			comboShipCity.options.length = 0;			
			addOption = new Option('Machala');
            comboShipCity.options[0]=addOption;
			addOption = new Option('Pto Bolivar');
            comboShipCity.options[1]=addOption;
			addOption = new Option('Sta Rosa');
            comboShipCity.options[2]=addOption;
			addOption = new Option('Pasaje');
            comboShipCity.options[3]=addOption;

		}
	nCiudadTotal = nCiudad;

}

function checkAndPass()
{
  //sendMD5ToAuthentic(extractMD5(this.form),this.form)

	//alert(document.frmRegister.CUSTOMNAME.value);
  if (VerifyRegisterFormFields("frmRegister")== true) {
		href_regproc("frmRegister");
		//var tarjeta="";
		//tarjeta= document.frmProduct.CARDNUMBER.value;
		//var cedula="";
		//cedula= document.frmProduct.ICNUMBER.value;
		//location.href="register_proc.asp?cedula="+cedula+"&tarjeta="+tarjeta;
}  else
  	alert("No pudo validar");
	return(false);

}

<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function asinga_pass(){
var n=document.frm.elements.length;
contador=0;
 for (var i=0;i<n;i++)
	{
	var e = document.frm.elements[i];
	    if (e.type=='text')
			{
			contador++;
			ce=eval('document.frm.cedula'+contador+'');
			pass=eval('document.frm.encriptpass'+contador+'');
				//alert (hex_md5(document.frm.cedula.value));
				pass.value=hex_md5(ce.value);	 
		    
			}

	 }

}