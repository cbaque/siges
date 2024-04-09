<link rel="stylesheet" href="../jqwidgets/styles/jqx.base.css" type="text/css" />
<script type="text/javascript" src="../jqwidgets/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../jqwidgets/jqxcore.js"></script>
   
<script type="text/javascript" src="../jqwidgets/jqxdraw.js"></script>
<script type="text/javascript" src="../jqwidgets/jqxchart.core.js"></script>

<script type="text/javascript" src="../jqwidgets/jqxdata.js"></script>
 <!--<iframe src="http://localhost/siges/___Transactions/___sqlAjax1.aspx?typ=23" height="150" width="150" ></iframe>-->
 
  <script type="text/javascript">
        $(document).ready(function () {          
var source = {
                datatype: "csv",
                datafields: [
                    { name: 'responsables' },
                    { name: 'nuevos' },
					{ name: 'enEjecucion' },
					{ name: 'atrasados' },
					{ name: 'detenidos' },
					{ name: 'enEspera' },
					{ name: 'Revision' }																				
                ],
                url: '___sqlAjax1.aspx?typ=23&id=<%=Request.QueryString["id"]%>'
            };

            var dataAdapter = new $.jqx.dataAdapter(source, { async: false, autoBind: true, loadError: function (xhr, status, error) { alert('Error loading "' + source.url + '" : ' + error); } });

var settings = {
                title: "",
                description: "",
                enableAnimations: false,
                showLegend: false,
				showBorderLine: false,
                padding: { left: 5, top: 5, right: 5, bottom: 5 },
                titlePadding: { left: 0, top: 0, right: 0, bottom: 10 },
                source: dataAdapter,
                xAxis:
                    {
                        dataField: 'responsables',
                        showTickMarks: true,
                        tickMarksInterval: 1,
                        tickMarksColor: '#888888',
                        unitInterval: 1,
                        showGridLines: false,
                        gridLinesInterval: 1,
                        gridLinesColor: '#CCCCCC',
                        axisSize: 'auto',
						textRotationAngle: -45
                    },
                colorScheme: 'scheme07',
                seriesGroups:
                    [
                        {
                            type: 'stackedcolumn',
                            columnsGapPercent: 100,
                            seriesGapPercent: 6,
                            valueAxis:
                            {
                                unitInterval: 10,
                                minValue: 0,
                                maxValue: 120,
                                displayValueAxis: true,
                                description: 'Disposiciones',
                                tickMarksColor: '#333333',
								gridLinesColor: '#CCCCCC',
								showGridLines: false
                            },
                            series: [ { dataField: 'responsables', displayText: 'Responsables' },
                                    { dataField: 'nuevos', displayText: 'Nuevos' },
                                    { dataField: 'enEjecucion', displayText: 'En Ejecucion' },
                                    { dataField: 'atrasados', displayText: 'Atrasados' },
									{ dataField: 'detenidos', displayText: 'Detenidos' },																											                                    { dataField: 'enEspera', displayText: 'En Espera' },																											                                    { dataField: 'Revision', displayText: 'Revision' }
                                ]
                        }
                    ]
            };


            // prepare jqxChart settings
           /* var settings = {
                title: "Disposciones por Responsables y Estados",
                description: "",
                enableAnimations: true,
                showLegend: false,
				showBorderLine: false,
				enableCrosshairs: true,
                padding: { left: 5, top: 5, right: 5, bottom: 5 },
                titlePadding: { left: 0, top: 10, right: 0, bottom: 10 },
                source: dataAdapter,
                xAxis:
                    {
                        dataField: 'responsables',
                        showTickMarks: false,
                        valuesOnTicks: false,
                        tickMarksInterval: 1,
                        tickMarksColor: '#333333',
                        unitInterval: 1,
                        showGridLines: false,
						gridLinesInterval: 1,
                        gridLinesColor: '#cccccc',
                        axisSize: 'auto',
						textRotationAngle: -45
						//,textRotationPoint: 'topright',
                        //textOffset: {x: 0, y: -25}
                    },
                colorScheme: 'scheme07',
                seriesGroups:
                    [
                        {
                            type: 'stackedcolumn',
                            showLabels: false,
                            valueAxis:
                            {
                                unitInterval: 1,
                                minValue: 0,
                                //maxValue: 5,
                                description: 'Disposiciones',
                                axisSize: 'auto',
                                tickMarksColor: '#333333',
								gridLinesColor: '#f1f1f1',
								showGridLines: false								
                            },
                            series: [
                                    { dataField: 'responsables', displayText: 'responsables', symbolType: 'squared'},{ dataField: 'nuevos', displayText: 'Nuevos', symbolType: 'dot'},{ dataField: 'enEjecucion', displayText: 'En Ejecucion', symbolType: 'dot'},{ dataField: 'atrasados', displayText: 'Atrasados', symbolType: 'dot'},{ dataField: 'detenidos', displayText: 'Detenidos', symbolType: 'dot'},{ dataField: 'enEspera', displayText: 'En Espera', symbolType: 'dot'}
                                ]
                        }
                    ]
            };*/







            // setup the chart
            $('#chartContainer').jqxChart(settings);

        });
    </script>
</head>
<body class='default'>
    <div id='chartContainer' style="width:100%; height:250px">
    </div>