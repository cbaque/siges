<link rel="stylesheet" href="../jqwidgets/styles/jqx.base.css" type="text/css" />
<script type="text/javascript" src="../jqwidgets/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../jqwidgets/jqxcore.js"></script>
 <script src="../___Objects/___Client/___appSislab_Ajax.js"></script>

    
<script type="text/javascript" src="../jqwidgets/jqxdraw.js"></script>
<script type="text/javascript" src="../jqwidgets/jqxchart.core.js"></script>

<script type="text/javascript" src="../jqwidgets/jqxdata.js"></script>


<script src="../bootstrap/js/bootstrap.min.js"></script>

<% if (Session["sysTema"].ToString()=="Blue") { %>
<link href="../___css/tema1.css" rel="stylesheet" type="text/css">

<%}%>
 <% if (Session["sysTema"].ToString()=="Black") { %>
<link href="../___css/tema2.css" rel="stylesheet" type="text/css">

<%}%>


   
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
             var strValores = '<%=Request.QueryString["val"]%>';//"33.3;26.5;25.4;7.0;4.6;3.2;3.2;3.2";
			 var mValores = strValores.split(';');
			 
              var sampleData = [ { Estado: 'Nuevo', Cuenta: mValores[0]},
                    { Estado: 'En ejecucion', Cuenta: mValores[1]},
                    { Estado: 'Atrasado', Cuenta: mValores[2]},
                    { Estado: 'Detenido', Cuenta: mValores[3]},
                    { Estado: 'En Espera', Cuenta: mValores[4]},
                    { Estado: 'Revision', Cuenta: mValores[5]},
                    { Estado: 'En Validacion', Cuenta: mValores[6]},
					{ Estado: 'Incumplido', Cuenta: mValores[7]}
                ];

            // prepare jqxChart settings
            var settings = {
                title: " Total Disposiciones (<%=Request.QueryString["c"]%>) ",
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
                                        formatSettings: { sufix: '%', decimalPlaces: 1 }
                                    }
                                ]
                        }
                    ]
            };

          
            $('#chartContainer').jqxChart(settings);
	
        // ** fin graficas
	   
	   //Para llamar a la tabla de resumen
	   generalJS('0','idFormGrafico|___sqlAjax.aspx|idTempGrafico;idTempGrafico|idTabla|GET|&typ=0&j0=<%=Request.QueryString["j0"]%>&j1=<%=Request.QueryString["j1"]%>');
	   
	   
	   
	   
	    });
		
		
		
		
    </script>
<form id="idFormGrafico" action="#"> 
    
    <div id='jqxWidget'> <span id="idTempGrafico"></span>
       <div id='chartContainer' style="width: 50%; height: 500px; float:left; "  align="center" ></div>
       <div id='idNotificacion'></div>
       <div id='idTabla' style="width: 50%; height: 500px; float:left;" align="center"  ></div>
    </div>
    <!--<div style='width: 90%; height:100px; overflow: auto;' > <div class='alert alert-danger' id='alert1'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong> Indicates a successful or positive action.Indicates a successful or positive action.Indicates a successful or positive action.</div></div>-->
       
 </form>     
    


