//=====================================================================|| 
// JavaScript eShop Module De Prati || 
//=====================================================================|| 
//====================================================================== 
//Opciones de Tarjeta 
//Fomra de parametrizar, si se desea mostrar todas las tarjetas
// entonces cambiar nCCTypes al maximo de tarjetas ej si hay 3 
// tarjetas definidas entonces se debe poner nCCTypes=3
//====================================================================== 
nCCTypes = 3; 
var matCC = new Array(nCCTypes); 
matCC[0] = 'DE PRATI'; 
matCC[1] = 'MASTERCARD'; 
matCC[2] = 'VISA'; 


nCrdtTypes = 2; 
var matCrdt = new Array(nCrdtTypes); 
matCrdt[0] = 'Rotativo'; 
matCrdt[1] = 'Diferido'; 


function retCCIndex(ccName) {
		

	for ( i = 0; i < nCCTypes; i++ ) {
	  if (matCC[i] == ccName)
	  		return(i);			
	}
}
//====================================================================== 
// Codigo de las tarjetas											  ||
//====================================================================== 
//var mat_cod_tarjeta = new Array(nCCTypes); 
//mat_cod_tarjeta[0] = 18; 
//mat_cod_tarjeta[1] = 3; 
//mat_cod_tarjeta[2] = 14; 

//====================================================================== 
// Longitud minima de numero de tarjeta								  ||
//====================================================================== 
//var mat_largo1 = new Array(nCCTypes); 
//mat_largo1[0] = 6; 
//mat_largo1[1] = 16; 
//mat_largo1[2] = 16; 

//====================================================================== 
// Longitud maxima de numero de tarjeta								  ||
//====================================================================== 
//var mat_largo2 = new Array(nCCTypes); 
//mat_largo2[0] = 7; 
//mat_largo2[1] = 16; 
//mat_largo2[2] = 16; 

//Matriz de Orden de cuotas 
var mat_nro_orden = new Array(RegTotalPayments); 
mat_nro_orden[0] = 0; 
mat_nro_orden[1] = 2; 
mat_nro_orden[2] = 3; 
mat_nro_orden[3] = 4; 
mat_nro_orden[4] = 6; 
mat_nro_orden[5] = 5; 
//Matriz de Descripciones var 
mat_descr_cuotar = new Array(RegTotalPayments); 
mat_descr_cuotar[0] = 'Rotativo'; 
mat_descr_cuotar[1] = '6 Meses'; 
mat_descr_cuotar[2] = '9 Meses'; 
mat_descr_cuotar[3] = '12 Meses'; 
mat_descr_cuotar[4] = '15 Meses'; 
mat_descr_cuotar[5] = '18 Meses'; 
//Matriz de numero de cuotas 
var mat_nro_cuotas = new Array(RegTotalPayments); 
mat_nro_cuotas[0] = 1; 
mat_nro_cuotas[1] = 6; 
mat_nro_cuotas[2] = 9; 
mat_nro_cuotas[3] = 12; 
mat_nro_cuotas[4] = 15; 
mat_nro_cuotas[5] = 18; 
//Matriz de interes REC_CUOTA 
var mat_rec_cuota = new Array(RegTotalPayments); 
mat_rec_cuota[0] = 0; 
mat_rec_cuota[1] = 5.32; 
mat_rec_cuota[2] = 7.65; 
mat_rec_cuota[3] = 12.31; 
mat_rec_cuota[4] = 16.88; 
mat_rec_cuota[5] = 18.31; 
//Matriz de taza anual 
var mat_tasa_anual = new Array(RegTotalPayments); 
mat_tasa_anual[0] = 0; 
mat_tasa_anual[1] = 18; 
mat_tasa_anual[2] = 18; 
mat_tasa_anual[3] = 18; 
mat_tasa_anual[4] = 18; 
mat_tasa_anual[5] = 22; 
//Matriz de monto minimo 
var mat_monto_minimo = new Array(RegTotalPayments); 
mat_monto_minimo[0] = 0; 
mat_monto_minimo[1] = 20; 
mat_monto_minimo[2] = 20; 
mat_monto_minimo[3] = 20; 
mat_monto_minimo[4] = 20; 
mat_monto_minimo[5] = 20; 




//=====================================================================|| 
// END eShop De Prati || 
//=====================================================================|| 
