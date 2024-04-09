<%
try  {    
DateTime dt = DateTime.Now;
string id = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";
string nomTrama=(Session.SessionID +dt.Year.ToString()+dt.Month.ToString()+dt.Day.ToString()+dt.Hour.ToString()+dt.Minute.ToString()+dt.Second.ToString() +dt.Millisecond.ToString());
string bgColor="#ffffff"; string ejecucion="";
int padreID = Request.QueryString["pID"]!=null ? int.Parse(Request.QueryString["pID"]): -1;
string id_rrhh =   Session["sysIdRrhh"].ToString();        
		                                                                      
switch (padreID){
case 2: //Nuevos
  bgColor="#0033CC"; 
  ejecucion = "Nuevo:";
break;
case 4: //Detenidos
  bgColor="#CC0000"; 
  ejecucion = "Detenido:";
break;
case 5: // En ejecucion
  bgColor="#009900"; 
  ejecucion = "Incumplido:";
break;
case 7:  //Atrasados
  bgColor="#FFCC00"; 
  ejecucion = "Atrasado:";
break;
case 8: //En Revision
  bgColor="#59FFFF";
  ejecucion = "Revisi&oacute;n:";  
break;
case 9: //En Espera
  bgColor="#9C9CFF";
   ejecucion = "En Espera:"; 
break;
case 17:
  bgColor="#001A64";
  ejecucion = "En validacion:";   
break;
case 18:
  bgColor="#B4B4B4"; 
  ejecucion = "En espera:";
break;
}


%>
<div style="margin-left: 20px;">

    <ul class="nav nav-pills">
        <li class="nav-item">
            <a class="nav-link active" id="general-tab" aria-current="page" href="#Archivos" onclick="changeTab('general-tab'); generalJS('0','frmMeta|___sqlAjax.aspx|idTrama;idTrama|idArchivos|GET|&typ=1&id=<%=id%>&tab=1');">General</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" id="cronograma-tab" href="#Duran" onclick="changeTab('cronograma-tab'); generalJS('0','frmMeta|___sqlAjax.aspx|idTrama;idTrama|idArchivos|GET|&typ=3&id=<%=id%>&tab=3'); ">Cronograma</a>
        </li>
    </ul>

<%--    <ul id="myTab1" class="nav nav-tabs">
        <li><a href="#Archivos" data-toggle="tab" class="badge" onclick="generalJS('0','frmMeta|___sqlAjax.aspx|idTrama;idTrama|idArchivos|GET|&typ=1&id=<%=id%>&tab=1');">General CB</a></li>
        <li><a href="#Duran" data-toggle="tab" class="badge" onclick="generalJS('0','frmMeta|___sqlAjax.aspx|idTrama;idTrama|idArchivos|GET|&typ=3&id=<%=id%>&tab=3'); ">Cronograma</a></li>
        <li><a href="#Quevedo" data-toggle="tab" class="badge" onclick="generalJS('0','frmMeta|___sqlAjax1.aspx|idTrama;idTrama|idArchivos|GET|&typ=6&idR=<%=id_rrhh%>&tab=2');">Reportar</a></li>

        <li><a href="#Puembo" data-toggle="tab" class="badge" onclick="generalJS('0','frmMeta|___sqlAjax1.aspx|idTrama;idTrama|idArchivos|GET|&typ=9&id=<%=id%>&tab=4');">Observaciones</a></li>

        <li><a href="#Ventas" data-toggle="tab" class="badge" onclick="generalJS('0','frmMeta|archivos.aspx|idTrama;idTrama|idArchivos|GET|&typ=10&id=<%=id%>&tab=5');">Documentos</a>  </li>

        <li><a href="#Historial" data-toggle="tab" class="badge" onclick="generalJS('0','frmMeta|___sqlAjax.aspx|idTrama;idTrama|idArchivos|GET|&typ=18&id=<%=id%>&tab=6');">Historial</a></li>

    </ul>--%>



    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="82%" height="25" class="detalleDisposicion" style="border-top: solid 1px #CCCCCC; border-left: solid 1px #CCCCCC;">

                <input type="hidden" value="<%=id%>" id="idTrama" />
                &nbsp;<%//=ejecucion%></td>
            <td width="18%" bgcolor="<%=bgColor%>" class="numeroDisposicion" style="border-radius: 0px 10px 10px 10px;">
                <div align="center"><strong>No. 00000<%=id%></strong></div>
            </td>
        </tr>
    </table>

    <div id="idArchivos" style="width: 100%; border-left: solid 1px #CCCCCC; border-bottom: solid 1px #CCCCCC; border-radius: 0px 10px 10px 10px;"></div>
</div>

<%
}catch (Exception ex){
                 Response.Write(ex.Message.ToString()); 
				  
             }
%>
