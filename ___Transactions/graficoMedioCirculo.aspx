<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="DataAccessLayer" %>

<link rel="stylesheet" href="../jqwidgets/styles/jqx.base.css" type="text/css" />
<script type="text/javascript" src="../jqwidgets/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../jqwidgets/jqxcore.js"></script>
   
<script type="text/javascript" src="../jqwidgets/jqxdraw.js"></script>
<script type="text/javascript" src="../jqwidgets/jqxchart.core.js"></script>

<script type="text/javascript" src="../jqwidgets/jqxdata.js"></script>
<% 
string idP5 = ""; string strSQL = "";
IDBManager dbManager = new DBManager(DataProvider.OleDb);
dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();

 dbManager.Open(); strSQL = "exec spReportes null, 1, null ,'A'"; // Response.Write(strSQL + ":" + idP0);
		  dbManager.ExecuteReader(CommandType.Text,strSQL);  while(dbManager.DataReader.Read()) {
            idP5 += dbManager.DataReader["nombre"].ToString() + ", " + dbManager.DataReader["porcentaje"].ToString() + "<br>";
				  }				  
		Response.Write(idP5);		  
%>

<iframe src="http://localhost/siges/___Transactions/___sqlAjax1.aspx?typ=23" height="150" width="150" ></iframe>
<script type="text/javascript">
        $(document).ready(function () {
            // prepare chart data as an array
            var source =
            {
                datatype: "csv",
                datafields: [
                    { name: 'Browser' },
                    { name: 'Share' }
                ],
                url: 'http://localhost/siges/___Transactions/___sqlAjax1.aspx?typ=23'//'../___Transactions/desktop_browsers_share_dec2011.txt'
            };

            var dataAdapter = new $.jqx.dataAdapter(source, { async: false, autoBind: true, loadError: function (xhr, status, error) { alert('Error loading "' + source.url + '" : ' + error); } });

            // prepare jqxChart settings
            var settings = {
                title: "Desktop browsers share",
                description: "(source: wikipedia.org)",
                enableAnimations: true,
                showLegend: false,
                showBorderLine: true,
                legendPosition: { left: 520, top: 140, width: 100, height: 100 },
                padding: { left: 5, top: 5, right: 5, bottom: 5 },
                titlePadding: { left: 0, top: 0, right: 0, bottom: 10 },
                source: dataAdapter,
                colorScheme: 'scheme02',
                seriesGroups:
                    [
                        {
                            type: 'donut',
                            showLabels: true,
                            series:
                                [
                                    {
                                        dataField: 'Share',
                                        displayText: 'Browser',
                                        labelRadius: 120,
                                        initialAngle: 15,
                                        radius: 170,
                                        innerRadius: 70,
                                        centerOffset: 0,
                                        formatSettings: { sufix: '%', decimalPlaces: 1 }
                                    }
                                ]
                        }
                    ]
            };

            // setup the chart
            $('#chartContainer').jqxChart(settings);

        });
    </script>
</head>
<body class='default'>
        <div id='chartContainer' style="width: 850px; height: 500px;">
        </div>
</body>
</html>
