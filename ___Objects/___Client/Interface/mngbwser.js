//=====================================================================||
// JavaScript eShop Module De Prati                                    ||
//=====================================================================||

//Opciones de provincias
nProv		= 7;
var matProv = new Array(nProv) ;
matProv[0]	= 'Seleccionar';
matProv[1]	= 'Azuay';
matProv[2]	= 'Cañar';
matProv[3]	= 'Pichincha';
matProv[4]	= 'El Oro';
matProv[5]	= 'Manabi';
matProv[6]	= 'Guayas';

nCiudad	= 0;


//---------------------------------------------------------------------||
// FUNCTION:    LoadComboCities                                        ||
// PARAMETERS:  RegisterVal                                            ||
//---------------------------------------------------------------------||

function LoadComboCities(szForm) {
		
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
//---------------------------------------------------------------------||
// FUNCTION:    ManageRegister                                         ||
// PARAMETERS:  RegisterVal                                            ||
//---------------------------------------------------------------------||
function ShellManager(RegisterVal) {
 	var iSelectedMatQuo	 = 0;

		
		if (RegisterVal=='NewClt') {     
   		
		    strOutput="<TABLE WIDTH=\"100%\"><TR>" +
					  "<TD ALIGN=\"RIGHT\"><B>Usuario</B></TD>" +
					  "<TD><INPUT NAME=\"CUSTOMID\" SIZE=\"16\" MAXLENGTH=\"15\" TYPE=\"TEXT\">*</TD></TR>" +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Password</B></TD>" +
  					  "<TD><INPUT NAME=\"CUSTOMPASSWORD\" SIZE=\"16\" TYPE=\"PASSWORD\" MAXLENGTH=\"15\">*</TD></TR>" +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Nombre</B></TD>" +
					  "<TD><INPUT NAME=\"CUSTOMNAME\" SIZE=\"50\" TYPE=\"TEXT\">*</TD></TR>" +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Primer Apellido</B></TD>" +
					  "<TD><INPUT NAME=\"CUSTOMFIRSTSRN\" SIZE=\"50\" TYPE=\"TEXT\">*</TD></TR>" +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Segundo Apellido</B></TD>" +
					  "<TD><INPUT NAME=\"CUSTOMSECNDSRN\" SIZE=\"50\" TYPE=\"TEXT\"></TD></TR>" +					  
					  "<TR><TD ALIGN=\"RIGHT\"><B>Tarjeta De Prati</B></TD>" +
					  "<TD><INPUT NAME=\"CUSTOMDPNUMBER\" SIZE=\"15\" TYPE=\"TEXT\">*</TD></TR>" +					  
					  "<TR><TD ALIGN=\"RIGHT\"><B>Fecha de Nacimiento</B></TD>" +
					  "<TD><TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\">" +
					  "<TD>Dia<INPUT NAME=\"BDAY\" SIZE=\"2\" MAXLENGTH=\"2\" TYPE=\"TEXT\"></TD>" +
					  "<TD>Mes<INPUT NAME=\"BMONTH\" SIZE=\"2\" MAXLENGTH=\"2\" TYPE=\"TEXT\"></TD>" +
					  "<TD>Año<INPUT NAME=\"BYEAR\" SIZE=\"4\" MAXLENGTH=\"4\" TYPE=\"TEXT\">*</TD></TR>" +
					  "</TABLE></TD></TR>" +					  					  
					  "<TR><TD ALIGN=\"RIGHT\"><B>CI/Pasaporte</B></TD>" +
					  "<TD><INPUT NAME=\"CUSTOMIC\" SIZE=\"20\" MAXLENGTH=\"15\" TYPE=\"TEXT\">*</TD></TR>" +					  
					  "<TR><TD ALIGN=\"RIGHT\"><B>Sexo</B></TD>" +					  
					  "<TD><TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\">" +
					  "<TR><TD><SPAN>Hombre</SPAN></TD>" +
					  "<TD><INPUT TYPE=\"RADIO\" VALUE=\"H\" NAME=\"CUSTOMSEX\" CHECKED></TD>" +
					  "<TD><SPAN>Mujer</SPAN></TD>" +
					  "<TD><INPUT TYPE=\"RADIO\" VALUE=\"M\" NAME=\"CUSTOMSEX\" >*</TD>" +
					  "</TR></TABLE></TD></TR>" +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Dirección 1</B></TD>" +
					  "<TD><INPUT NAME=\"CUSTOMADDRESS1\" SIZE=\"50\" TYPE=\"TEXT\">*</TD></TR>" +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Dirección 2</B></TD>" +
					  "<TD><INPUT NAME=\"CUSTOMADDRESS2\" SIZE=\"50\" TYPE=\"TEXT\"></TD></TR>" +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Provincia</B></TD>"  +
					  "<TD><SELECT NAME=\"CUSTOMPROV\" ONCHANGE=\"LoadComboCities('REGISTER')\">" ; 
			
		              for ( i = 0; i < nProv; i++ ) {
			          strOutput+="<OPTION VALUE=\"" + matProv[i] + "\">" + matProv[i]				     		
			          }
					  
		   strOutput+="</SELECT>*</TD></TR>" +
		   			  "<TR><TD ALIGN=\"RIGHT\"><B>Ciudad</B></TD>" +	 
					  "<TD><SELECT NAME=\"CUSTOMCITY\"><OPTION VALUE=\"Seleccionar\">Seleccionar</SELECT>*</TD></TR>"  +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Teléfonos</B></TD>" +
			          "<TD><TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\">" +
					  "<TR><TD>Domicilio<INPUT NAME=\"CUSTOMPHONE1\" SIZE=\"8\" MAXLENGTH=\"10\" TYPE=\"TEXT\">*</TD>" +
					  "<TD>Trabajo<INPUT NAME=\"CUSTOMPHONE2\" SIZE=\"8\" MAXLENGTH=\"10\" TYPE=\"TEXT\"></TD></TR>" +
					  "</TABLE></TD></TR>" +						   
			          "<TR><TD ALIGN=\"RIGHT\"><B>Correo electronico</B></TD>" +
					  "<TD><INPUT NAME=\"EMAIL\" SIZE=\"40\" TYPE=\"TEXT\"> * --e.g., nombre@tuservidor.com</TD></TR>" +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Pregunta de Seguridad</B></TD>" +
					  "<TD><INPUT NAME=\"SAFIQRY\" SIZE=\"50\" TYPE=\"TEXT\"></TD></TR>" +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Respuesta</B></TD>" +
					  "<TD><INPUT NAME=\"ANSWER\" SIZE=\"50\" TYPE=\"TEXT\"></TD></TR>" +					  
			          "<TR><TD></TD><TD><INPUT TYPE=\"SUBMIT\" VALUE=\"Continuar\"></TD></TR>" +
					  "<TR><TD></TD><TD><B>Los campos marcados con (*) son obligatorios.</B></TD></TR>" +
					  "</TABLE>";

        } else if  ( RegisterVal=='Registered') {
   		   
   	    	strOutput="<TABLE WIDTH=\"100%\"><TR>" +
					  "<TD ALIGN=\"RIGHT\"><B>NOP</TD>" +
					  "<TD><INPUT NAME=\"CUSTOMNAME\" SIZE=\"50\" TYPE=\"TEXT\"></TD></TR>" +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Dirección</TD>" +
					  "<TD><INPUT NAME=\"CUSTOMADDRESS\" SIZE=\"50\" TYPE=\"TEXT\"></TD></TR>" +
					  "<TR><TD ALIGN=\"RIGHT\"><B>Provincia</TD>"  +
					  "<TD><SELECT NAME=\"CUSTOMPROV\">" ; 
				  
		   for ( i = 0; i < nProv; i++ ) {
			strOutput+="<OPTION VALUE=\"" + matProv[i] + "\">" + matProv[i]				     		
			}
			
			strOutput+="</SELECT></TD></TR>" +
					   "<TR><TD ALIGN=\"RIGHT\"><B>Ciudad</TD>" +	 
					   "<TD><INPUT NAME=\"CITY\" TYPE=\"TEXT\"></TD></TR>" +
					   "<TR><TD ALIGN=\"RIGHT\"><B>Teléfono</TD>" +	 
					   "<TD><INPUT NAME=\"TELEPHONE\" TYPE=\"TEXT\"></TD></TR>" +
					   "<TR><TD ALIGN=\"RIGHT\"><B>Desea que su pedido sea enviado a ésta dirección</TD>" +	 
					   "<TD><INPUT TYPE=\"RADIO\" NAME=\"ADRORDER\" VALUE=\"SI\" CHECKED=\"TRUE\">Si<BR>" +
					   "<INPUT TYPE=\"RADIO\" NAME=\"ADRORDER\" VALUE=\"NO\" >No (Mas adelante se preguntará dirección de envío)</TD></TR>" +
					   "<TR><TD></TD><TD><INPUT TYPE=\"SUBMIT\" VALUE=\"Continuar\"></TD></TR>"
					   "</TABLE>";
   
        } else if (RegisterVal=='Send2OtherAddress') {
				//"<TD ALIGN=\"LEFT\" CLASS=\"labelfield\"><B>Nombres Destinatario</B></TD>" +
					  //"<TD><INPUT NAME=\"SHIPNAMES\" SIZE=\"30\" MAXLENGTH=\"30\" TYPE=\"TEXT\">*</TD></TR>" +					  
					  
   		      strOutput="<TR>" +
					  "<TR><TD ALIGN=\"LEFT\">Dirección de envío</TD>" +
					  "<TD><INPUT NAME=\"SHIPADDRESS\" SIZE=\"50\" TYPE=\"TEXT\">" + 
					  " <font class=\"greetext\"><img src=/cart/jvscrpt//%22/common/Images/rojo.gif/%22 width=\"4\" height=\"15\"></font></TD></TR>" +
					  "<TR><TD ALIGN=\"LEFT\" >Provincia</TD>"  +
					  "<TD><SELECT NAME=\"SHIPPROV\" ONCHANGE=\"LoadComboCities('SHIPPMENT')\">" ; 
			
		              for ( i = 0; i < nProv; i++ ) {
			          strOutput+="<OPTION VALUE=\"" + matProv[i] + "\">" + matProv[i]				     		
			          }
					  
		   strOutput+="</SELECT>" +
		   			  " <font class=\"greetext\"><img src=/cart/jvscrpt//%22/common/Images/rojo.gif/%22 width=\"4\" height=\"15\"></font></TD></TR>" +
		   			  "<TR><TD ALIGN=\"LEFT\" >Ciudad</TD>" +	 
					  "<TD><SELECT NAME=\"SHIPCITY\"><OPTION VALUE=\"Seleccionar\">Seleccionar</SELECT></TD></TR>"  +
					  "<TR><TD ALIGN=\"LEFT\" >Teléfono</TD>" +	 
					  "<TD><INPUT NAME=\"SHIPPHONE\" TYPE=\"TEXT\"></TD></TR>" +
					  "<TR><TD><BR></TD></TR>" ;
   
   		}   else if (RegisterVal=='Promo') {
		      		
		
		}   else if (RegisterVal=='Payment') {
		    
		      //Primero recuperamos los valores
		      data2Send = GetCookie("RelevantData");
	 		  
			  Token0  = data2Send.indexOf("|", 0);
			  Token1  = data2Send.indexOf("|", Token0+1);
			  Token2  = data2Send.indexOf("|", Token1+1);
			  Token3  = data2Send.indexOf("|", Token2+1);
			  Token4  = data2Send.indexOf("|", Token3+1);
			  Token5  = data2Send.indexOf("|", Token4+1);
			  Token6  = data2Send.indexOf("|", Token5+1);
			  Token7  = data2Send.indexOf("|", Token6+1);
			  Token8  = data2Send.indexOf("|", Token7+1);
			  Token9  = data2Send.indexOf("|", Token8+1);
			  Token10 = data2Send.indexOf("|", Token9+1);
			  Token11 = data2Send.indexOf("|", Token10+1);
			  Token12 = data2Send.indexOf("|", Token11+1);
			  Token13 = data2Send.indexOf("|", Token12+1);
			  Token14 = data2Send.indexOf("|", Token13+1);
			  Token15 = data2Send.indexOf("|", Token14+1);
			  
			  
			  fields = new Array;
			  fields[0]  = data2Send.substring( 0, Token0 );                  // Prov
			  fields[1]  = data2Send.substring( Token0+1, Token1 );           // City
			  fields[2]  = data2Send.substring( Token1+1, Token2 );           // Shippment Value
			  fields[3]  = data2Send.substring( Token2+1, Token3 );           // Name receive 1
			  fields[4]  = data2Send.substring( Token3+1, Token4 );           // Name receive 2
			  fields[5]  = data2Send.substring( Token4+1, Token5 );           // Address 2 send
			  fields[6]  = data2Send.substring( Token5+1, Token6 );           // Phone 2 send
			  
			  fields[7]  = data2Send.substring( Token6+1, Token7 );           // Order Date Required
			  fields[8]  = data2Send.substring( Token7+1, Token8 );           // Order Time Required
			  
			  fields[9]  = data2Send.substring( Token8+1, Token9 );           // Card Name
			  fields[10]  = data2Send.substring( Token9+1, Token10 );         // Card Type
			  
			  fields[11]  = data2Send.substring( Token10+1, Token11 );        // Card CVV
			  fields[12]  = data2Send.substring( Token11+1, Token12 );        // Exp Year
			  fields[13]  = data2Send.substring( Token12+1, Token13 );        // Exp Month
			  fields[14] = data2Send.substring( Token13+1, Token14);          // Quotas
			  fields[15] = data2Send.substring( Token14+1, Token15 );		  // Card Number		
			  fields[16] = data2Send.substring( Token15+1, data2Send.length );// card Seq
   		   	  
			  // Aqui verificamos que cuota de pago selecciono el usuario
	          // para poder escoger todos los parametros de tmpcutar.js
	          // y que sean enviados a dll
			  var lblcredito= '';
	          for ( i = 0; i < RegTotalPayments; i++) {
			
	   		      if (mat_descr_cuotar[i] ==fields[14]) 
			       iSelectedMatQuo = i;
				   
				   if (iSelectedMatQuo ==0) 
			       lblcredito = 'Credito :';
				   else
				   lblcredito = 'Credito Diferido :';
				   
	          }
			  
			 // band_typetarjeta=typetarjeta('fields[10]');
				
			   //AQUI SE CREA UNA FILA CON TRES COLUMNAS UNA PARA LA LINEA 
			   //PARA EL CHECKOUT POR ESO INICA CON <TD>
			   strOutput = "<TD ALIGN=\"LEFT\">" +
			   			   "<TABLE  BORDER=\"0\">" +						   
						   "<TR><TD ALIGN=\"CENTER\">" +
						   "<DIV ALIGN=\"CENTER\"><STRONG>Información de Envío</STRONG></DIV></TD></TR>" +							   
						   "<TR><TD ALIGN=\"LEFT\"><STRONG>Recibe : </STRONG></TD><TD>" + fields[3] + "</TD></TR>" +						   
						   "<TR><TD ALIGN=\"LEFT\"><STRONG>Recibe (Opc): </STRONG></TD><TD>" + fields[4] + "</TD></TR>" +						   
						   "<TR><TD ALIGN=\"LEFT\"><STRONG>Dirección: </STRONG></TD><TD>" + fields[5] + "</TD></TR>" +
						   "<TR><TD ALIGN=\"LEFT\"><STRONG>Provincia: </STRONG></TD><TD>" + fields[0] + "</TD></TR>"  +
						   "<TR><TD ALIGN=\"LEFT\"><STRONG>Ciudad: </STRONG></TD><TD>" + fields[1] + " </TD></TR>" +	 
						   "<TR><TD ALIGN=\"LEFT\"><STRONG>Teléfono: </STRONG></TD><TD>" + fields[6] + "</TD></TR>" +						   	 
						   "</TABLE>" +
						   "</TD>" + //Fin primera columna 						  
						   "<TD><img src=../../../javascript/Interface/common/Images/lin.gif/" width=\"15\" height=\"110\"></TD>" +
						   "<TD VALIGN=\"TOP\"><TABLE  BORDER=\"0\" ALIGN=\"RIGHT\">" +						   
						   "<TD ALIGN=\"CENTER\">" +
						   "<DIV ALIGN=\"CENTER\"><STRONG>Información de su tarjeta</STRONG></DIV></TD></TR>" +							   						   
						   "<TR><TD ALIGN=\"LEFT\"><STRONG>Tarjeta: </STRONG></TD><TD>" + fields[10] + "</TD></TR>" +	 
						   "<TR><TD ALIGN=\"LEFT\"><STRONG>Cuenta No.: </STRONG></TD><TD> " + fields[15] + "</TD></TR>" +	 
						   "<TR><TD ALIGN=\"LEFT\"><STRONG>"+lblcredito+" </STRONG></TD><TD>" + fields[14] + "</TD></TR>" +	 
						   "<TR><TD ALIGN=\"LEFT\"><STRONG>Titular: </STRONG></TD><TD>" + fields[9] + "</TD></TR>" +						   
						   "</TABLE></TD>" +						   
						   "<INPUT NAME=\"HSHIPNAMES1\" TYPE=\"HIDDEN\" VALUE=\"" + fields[3] + "\">" +
						   "<INPUT NAME=\"HSHIPNAMES2\" TYPE=\"HIDDEN\" VALUE=\"" + fields[4] + "\">" +
						   "<INPUT NAME=\"HSHIPADDRESS\" TYPE=\"HIDDEN\" VALUE=\"" + fields[5] + "\">" +
						   "<INPUT NAME=\"HSHIPPROV\" TYPE=\"HIDDEN\" VALUE=\"" + fields[0] + "\">" +
						   "<INPUT NAME=\"HSHIPCITY\" TYPE=\"HIDDEN\" VALUE=\"" + fields[1] + "\">" +
						   "<INPUT NAME=\"HSHIPPHONE\" TYPE=\"HIDDEN\" VALUE=\"" + fields[6] + "\">" + 
						   "<INPUT NAME=\"HSHIPREQUIREDDATE\" TYPE=\"HIDDEN\" VALUE=\"" + fields[7] + "\">" + 
						   "<INPUT NAME=\"HSHIPREQUIREDTIME\" TYPE=\"HIDDEN\" VALUE=\"" + fields[8] + "\">" + 
						   "<INPUT NAME=\"HCARDTYPE\" TYPE=\"HIDDEN\" VALUE=\"" + fields[10] + "\">" +
						   "<INPUT NAME=\"HCARDNUMBER\" TYPE=\"HIDDEN\" VALUE=\"" + fields[15] + "\">" +
						   "<INPUT NAME=\"HCARDCVV\" TYPE=\"HIDDEN\" VALUE=\"" + fields[11] + "\">" +
						   "<INPUT NAME=\"HCARDSEQ\" TYPE=\"HIDDEN\" VALUE=\"" + fields[16] + "\">" +
						   "<INPUT NAME=\"HCARDQUOTA\" TYPE=\"HIDDEN\" VALUE=\"" + fields[14] + "\">" + 
						   "<INPUT NAME=\"HCARDNQUOTAS\" TYPE=\"HIDDEN\" VALUE=\"" + mat_nro_cuotas[iSelectedMatQuo] + "\">" + 
						   "<INPUT NAME=\"HCARDRECQUOTAS\" TYPE=\"HIDDEN\" VALUE=\"" + mat_rec_cuota[iSelectedMatQuo] + "\">" + 
						   "<INPUT NAME=\"HTASANUAL\" TYPE=\"HIDDEN\" VALUE=\"" + mat_tasa_anual[iSelectedMatQuo] + "\">" + 
						   "<INPUT NAME=\"HNRORDEN\" TYPE=\"HIDDEN\" VALUE=\"" + mat_nro_orden[iSelectedMatQuo] + "\">" + 
						   "<INPUT NAME=\"HEXPYEAR\" TYPE=\"HIDDEN\" VALUE=\"" + fields[12] + "\">" +
						   "<INPUT NAME=\"HEXPMONTH\" TYPE=\"HIDDEN\" VALUE=\"" + fields[13] + "\">" +						   
						   "<INPUT NAME=\"HCARDNAME\" TYPE=\"HIDDEN\" VALUE=\"" + fields[9] + "\">" +
						   "<INPUT NAME=\"HSHIPPCOST\" TYPE=\"HIDDEN\" VALUE=\"" + fields[2] + "\">" +
						   "<INPUT NAME=\"HIVARATE\" TYPE=\"HIDDEN\" VALUE=\"" + IvaRate + "\">";     
   			}
   document.write(strOutput);
   document.close();
}

//function TypeTarjeta(tt) {
//if (tt == 'DE PRATI')
// TypeTarjeta=1;
//else
// TypeTarjeta=2;
//}
//---------------------------------------------------------------------||
// FUNCTION:    EnableCDR                                              ||
// PARAMETERS:                                                         ||
// PURPOSE:  Habilitar el combo de cuotas diferido yr rotativo para    ||
//			 tarjetas externas,cvv y fecha expiracio  				   ||	
//---------------------------------------------------------------------||

function EnableCDR(thisFormName) {
		comboCardType = eval("document." + thisFormName + ".CARDTYPE" );
		txtCardExpYear = eval("document." + thisFormName + ".CARDEXPYEAR");
		txtCardCVV = eval("document." + thisFormName + ".CARDCVV");
		txtCardSeq = eval("document." + thisFormName + ".CARDSEQ");
		radCRDT = eval("document." + thisFormName + ".RADIOCRDT");
		
		comboCardMonthExp = eval("document." + thisFormName + ".CARDEXPMONTH" );
		
		if (comboCardType==null) 
		comboCardType="";

		if (comboCardMonthExp==null) 
		comboCardMonthExp="";		
		
		comboCuotas = eval("document." + thisFormName + ".QUOTAS");				
		
        CardTypeChoosed = comboCardType[comboCardType.selectedIndex].text;		
		
		if (CardTypeChoosed==matCC[0])
		{
			//comboCuotas.options.length = 0; 
			
			//for ( i = 1; i < RegTotalPayments; i++ ) {
			  // addOption = new Option(mat_descr_cuotar[i]);  
	          //  comboCuotas.options[i]=addOption;
			
			//}
			
			txtCardExpYear.disabled=-1; 
			txtCardCVV.disabled=-1;
			txtCardSeq.disabled=0;
			comboCardMonthExp.disabled=-1;
			txtCardExpYear.value=""; 
			txtCardCVV.value="";
			comboCardMonthExp.value=""; 			
			
			radCRDT[1].disabled = 0;
			//comboCuotas.disabled=0;
			//radCRDT.disabled = -1;
			
		} else  {

			comboCuotas.options.length = 0;			
			addOption = new Option(""); //solo Rotativo
            comboCuotas.options[0]=addOption;				
			
			txtCardExpYear.disabled=0; 
			txtCardCVV.disabled=0;
			txtCardSeq.disabled=-1;
			comboCardMonthExp.disabled=0;
			radCRDT[1].disabled = -1;
			radCRDT[0].checked = 1;
			comboCuotas.disabled=-1;
		} 

}

// function para deshabilitar el combo de quotas si es credito rotativo //
// y habilitar si es diferido //

function EnableCmbQuotas(thisFormName) {
radCRDT = eval("document." + thisFormName + ".RADIOCRDT");
cmbQUOTAS = eval("document." + thisFormName + ".QUOTAS");
if (radCRDT[0].checked==1){
//alert (radCRDT[0].value);
	cmbQUOTAS.options.length = 0;			
	addOption = new Option(""); //solo Rotativo
    cmbQUOTAS.options[0]=addOption;
	cmbQUOTAS.disabled=-1;
}
if (radCRDT[1].checked==1){
 //alert (radCRDT[1].value);
 	cmbQUOTAS.options.length = 0; //esta linea la puse anoche
	for ( i = 1; i < RegTotalPayments; i++ ) {
		addOption = new Option(mat_descr_cuotar[i]);  
	    cmbQUOTAS.options[i]=addOption;
			}
 	cmbQUOTAS.disabled=0;
}


/*radCRDT = eval("document." + thisFormName + ".RADIOCRDT");
//comboCrdtType = eval("document." + thisFormName + ".RADIOCRDT" );
//CrdtTypeChoosed = radCRDT[comboCrdtType.selectedIndex].text;
comboCuotas = eval("document." + thisFormName + ".QUOTAS");

if (radCRDT[1].checked =1 ) //si es diferido
		{
			comboCuotas.options.length = 0;
			
			for ( i = 1; i < RegTotalPayments; i++ ) {
			   addOption = new Option(mat_descr_cuotar[i]);  
	           comboCuotas.options[i]=addOption;
			
			}
  } else {
        if (radCRDT[0].checked =1 ) {//si es rotativo
		
			comboCuotas.options.length = 0;			
			addOption = new Option(""); //solo Rotativo
            comboCuotas.options[0]=addOption;				
			comboCuotas.disabled=-1;
        }
  }

*/}

//---------------------------------------------------------------------||
// FUNCTION:    EnableEXPCVVOnly                                       ||
// PARAMETERS:                                                         ||
// PURPOSE:  Habilitar expiracion mes y año, cvv					   ||
//---------------------------------------------------------------------||

function EnableEXPCVVOnly(thisFormName) {
		comboCardType = eval("document." + thisFormName + ".CARDTYPE" ); 
		txtCardExpYear = eval("document." + thisFormName + ".CARDEXPYEAR");
		txtCardCVV = eval("document." + thisFormName + ".CARDCVV");
		txtCardSeq = eval("document." + thisFormName + ".CARDSEQ");
		comboCardMonthExp = eval("document." + thisFormName + ".CARDEXPMONTH" );
		
		
		if (comboCardType==null) 
		comboCardType="";		
		
		if (comboCardMonthExp==null) 
		comboCardMonthExp="";		
		
        CardTypeChoosed = comboCardType[comboCardType.selectedIndex].text; 		
		
			//0=Habilita -1=deshabilita
		if (CardTypeChoosed==matCC[0])
		{
			//Disable
			txtCardExpYear.disabled=-1; 
			txtCardCVV.disabled=-1;
			comboCardMonthExp.disabled=-1;			
			txtCardExpYear.value=""; 
			txtCardCVV.value="";			
			comboCardMonthExp.value="";			
			//Enable
			txtCardSeq.disabled=0;			
			txtCardSeq.value="";
			
		} else  {
			//Disable
			txtCardSeq.disabled=-1;			
			txtCardSeq.value="";
			//Enable
			txtCardExpYear.disabled=0; 
			txtCardCVV.disabled=0;			
			comboCardMonthExp.disabled=0;
		} 

}

function link2PopUp(URL,pW,pH,pL,pT) 
	{
		
	day = new Date();
	id = day.getTime();
	eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=1,menubar=0,resizable=0,width="+ pW + ",height=" + pH + ",left = 332,top = 204');"); 
	
	  
}
//=====================================================================||
//               END eShop De Prati                                    ||
//=====================================================================||

