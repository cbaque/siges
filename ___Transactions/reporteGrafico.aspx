<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="DataAccessLayer" %>
<link rel="stylesheet" href="../jqwidgets/styles/jqx.base.css" type="text/css" />
<script type="text/javascript" src="../jqwidgets/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../jqwidgets/jqxcore.js"></script>
<script src="../___Objects/___Client/___appSislab_Ajax.js"></script>    
<script type="text/javascript" src="../jqwidgets/jqxdraw.js"></script>
<script type="text/javascript" src="../jqwidgets/jqxchart.core.js"></script>
<script type="text/javascript" src="../jqwidgets/jqxdata.js"></script>


<script src="../bootstrap/js/bootstrap.min.js"></script>


<style type="text/css"> 
.tablaResumen{ font-size:14px;font-family: Arial, Helvetica, sans-serif; border-left: solid 1px #CCCCCC; border-bottom: solid 1px #CCCCCC;border-radius: 10px 10px 10px 10px; padding:0px 0px; border-top: solid 1px #CCCCCC; border-right: solid 1px #CCCCCC; background-color: #5E9AF4;}

.detalleDisposicion{
	color: #666666;
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

.numeroDisposicion{
	color: #FFFFFF;
	font-size: 15px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

#talkbubble {
   width: 320px;
   height: 25px;
   background: red;
   position: relative;
   -moz-border-radius:    5px;
   -webkit-border-radius: 5px;
   border-radius:         5px;
}
#talkbubble:before {
   content:"";
   position: absolute;
   right: 100%;
   top: 26px;
   width: 0;
   height: 0;
   border-top: 13px solid transparent;
   border-right: 26px solid red;
   border-bottom: 13px solid transparent;
}

.alert{padding: 5px;margin-bottom:5px;border:1px solid transparent;border-radius:4px}.alert h4{margin-top:0;color:inherit}.alert .alert-link{font-weight:700}.alert>p,.alert>ul{margin-bottom:0}.alert>p+p{margin-top:5px}.alert-dismissable,.alert-dismissible{padding-right:35px}.alert-dismissable .close,.alert-dismissible .close{position:relative;top:-2px;right:-21px;color:inherit}.alert-success{color:#3c763d;background-color:#dff0d8;border-color:#d6e9c6}.alert-success hr{border-top-color:#c9e2b3}.alert-success .alert-link{color:#2b542c}.alert-info{color:#31708f;background-color:#d9edf7;border-color:#bce8f1}.alert-info hr{border-top-color:#a6e1ec}.alert-info .alert-link{color:#245269}.alert-warning{color:#8a6d3b;background-color:#fcf8e3;border-color:#faebcc}.alert-warning hr{border-top-color:#f7e1b5}.alert-warning .alert-link{color:#66512c}.alert-danger{color:#a94442;background-color:#f2dede;border-color:#ebccd1}.alert-danger hr{border-top-color:#e4b9c0}.alert-danger .alert-link{color:#843534}

.close{float:right;font-size:21px;font-weight:700;line-height:1;color:#000;text-shadow:0 1px 0 #fff;filter:alpha(opacity=20);opacity:.2}.close:focus,.close:hover{color:#000;text-decoration:none;cursor:pointer;filter:alpha(opacity=50);opacity:.5}button.close{-webkit-appearance:none;padding:0;cursor:pointer;background:0 0;border:0}
</style>   
 
 <style type="text/css">
<!--

body {z
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.Estilo2 {
	color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
}
 </style>
<%
string strSQL=""; string strTotalDisposiciones="";
IDBManager dbManager = new DBManager(DataProvider.OleDb); string strCuentaEstados="";
dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();
try
  { 		  
    dbManager.Open();
	strSQL="SP_DISPOSICIONES null,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',null,"+Session["sysEdicion"].ToString()+",null,null,null,"+Session["sysIdRrhh"].ToString()+",null,null,null";
    
	strSQL="spReportes null";
	
	//Response.Write(strSQL);
	dbManager.ExecuteReader(CommandType.Text,strSQL);
    while(dbManager.DataReader.Read())
		{	
		 strCuentaEstados += dbManager.DataReader["porcentaje"].ToString() + ";";
		 strTotalDisposiciones = dbManager.DataReader["suma"].ToString();
		}
		strCuentaEstados = strCuentaEstados.Substring(0,strCuentaEstados.Length-1);
		//Response.Write(strCuentaEstados+":"+strTotalDisposiciones);
  }catch (Exception ex){
     Response.Write(ex.Message.ToString());  
  }finally{
     dbManager.Dispose();
}
%>

   
<script type="text/javascript">
        $(document).ready(function () {
       
	    // ** graficas
         /*   var source =
            {
                datatype: "csv",
                datafields: [
                    { name: 'Browser' },
                    { name: 'Share' }
                ],
                url: 'desktop_browsers_share_dec2011.txt'
            };

            var dataAdapter = new $.jqx.dataAdapter(source, { async: false, autoBind: true, loadError: function (xhr, status, error) { alert('Error loading "' + source.url + '" : ' + error); } });

            */
             var strValores = '<%=strCuentaEstados%>';//"33.3;26.5;25.4;7.0;4.6;3.2;3.2;3.2";
			 var mValores = strValores.split(';');
			 
              var sampleData = [ { Estado: 'Nuevo', Cuenta: mValores[0]},
                    { Estado: 'En ejecucion', Cuenta: mValores[1]},
                    { Estado: 'Atrasado', Cuenta: mValores[2]},
                    { Estado: 'Detenido', Cuenta: mValores[3]},
                    { Estado: 'En Espera', Cuenta: mValores[4]},
                    { Estado: 'Sin reporte', Cuenta: mValores[5]},
                    { Estado: 'En Validacion', Cuenta: mValores[6]},
					{ Estado: 'Incumplido', Cuenta: mValores[7]}
                ];

            // prepare jqxChart settings
            var settings = {
                title: " Total Disposiciones Municipio:  <%=strTotalDisposiciones%> ",
                description: "",
                enableAnimations: true,
                showLegend: false,
                showBorderLine: false,
                legendPosition: { left: 20, top: 30, width: 40, height: 40 },
                padding: { left: 0, top: 0, right: 0, bottom: 0 },
                titlePadding: { left: 0, top: 0, right: 0, bottom: 0 },
                source: sampleData,
                colorScheme: 'scheme06',
                seriesGroups:
                    [
                        {
                            type: 'donut',
                            showLabels: true,
                            series:
                                [
                                    {
                                        dataField: 'Cuenta',
                                        displayText: 'Estado',
                                        labelRadius: 215,
                                        initialAngle: 55,
                                        radius: 180,
                                        innerRadius: 85,
                                        centerOffset: 5,
                                        formatSettings: { sufix: '%', decimalPlaces: 0 }
                                    }
                                ]
                        }
                    ]
            };

          
            $('#chartContainer').jqxChart(settings);
	
        // ** fin graficas
	   
	   //Para llamar a la tabla de resumen
	   generalJS('0','idFormGrafico|___sqlAjax.aspx|idTempGrafico;idTempGrafico|idTabla|GET|&typ=20');
	    generalJS('0','idFormGrafico|___sqlAjax.aspx|idTempGrafico;idTempGrafico|idTabla1|GET|&typ=21');
		generalJS('0','idFormGrafico|___sqlAjax.aspx|idTempGrafico;idTempGrafico|idTabla2|GET|&typ=22');
	   
	   
	   
	   
	    });
		
		
		
		
    </script>
<title>Reporte SIGES</title><form id="idFormGrafico" action="#">
    <div id='jqxWidget'> 
    <div id='chartContainer' style="width: 45%; height: 500px; float:left; "  align="center" ></div>
  
       <div id='idTabla' style="width: 55%; height: 200px; float:left;" align="center"  ></div>
       <div id='idTabla1' style="width: 55%; height: 150px; float:left;" align="center"  ></div>
        <!-- <div id='idTabla2' style="width: 55%; height: 150px; float:left;" align="center"  ></div> -->       
  
    </div>
    <!--<div style='width: 90%; height:100px; overflow: auto;' > <div class='alert alert-danger' id='alert1'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong> Indicates a successful or positive action.Indicates a successful or positive action.Indicates a successful or positive action.</div></div>-->
       
 </form>     
    


