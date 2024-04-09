<link rel="stylesheet" href="../jqwidgets/styles/jqx.base.css" type="text/css" />
<script type="text/javascript" src="../jqwidgets/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../jqwidgets/jqxcore.js"></script>
   
<script type="text/javascript" src="../jqwidgets/jqxdraw.js"></script>
<script type="text/javascript" src="../jqwidgets/jqxchart.core.js"></script>

<script type="text/javascript" src="../jqwidgets/jqxdata.js"></script>
 
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
             var strValores = '<%=Request.QueryString["val"]%>'; //"33.3;26.5;25.4;7.0;4.6;3.2;3.2;3.2";
			 
			 var mValores = strValores.split(';');
			
              var sampleData = [ { Estado: 'Nuevo', Cuenta: 0},
                    { Estado: 'En ejecucion', Cuenta: mValores[0]},
                    { Estado: 'Atrasado', Cuenta: mValores[1]},
                    { Estado: 'Detenido', Cuenta: mValores[2]},
                    { Estado: 'En Espera', Cuenta: 0},
                    { Estado: 'Sin reporte', Cuenta: 0},
                    { Estado: 'En Validacion', Cuenta: 0},
					{ Estado: 'Incumplido', Cuenta: 0}
                ];


            // prepare jqxChart settings
            	var settings = {
                title: "",//" Total Disposiciones (<%//=Request.QueryString["c"]%>) ",
                description: "",
                enableAnimations: false,
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
                                        labelRadius: 105,
                                        initialAngle: 10,
                                        radius: 90,
                                        innerRadius: 45,
                                        centerOffset: 0,
                                        formatSettings: { sufix: '%', decimalPlaces: 1 }
                                    }
                                ]
                        }
                    ]
            };

          
            $('#chartContainer').jqxChart(settings);
	
        // ** fin graficas
	  
	   
	   
	   
	    });
		
		
		
		
    </script>    

    
    <div id='jqxWidget'> <span id="idTempGrafico"></span>
       <div id='chartContainer' style="width: 100%; height: 240px; float:left; "  align="left" ></div>       
    </div>
   
       
  
    


