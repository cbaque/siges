<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="DataAccessLayer" %>

<%
string idP0="";
string idP1="";
string idP2="";
int sec=0;
string strSQL = "";
IDBManager dbManager = new DBManager(DataProvider.OleDb);
dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();

try  {       
   			dbManager.Open();
		
		
		
			strSQL = "select mail1,mail2, mail3 from sg_Rrhh where id = "+ Session["sysIdRrhh"].ToString() +" ";
		    //Response.Write(strSQL);
			dbManager.ExecuteReader(CommandType.Text,strSQL);
	 sec=0;		  
	%>
<br />

	 <% while(dbManager.DataReader.Read()) {
	  sec++;
	  idP0 = dbManager.DataReader["mail1"].ToString(); // tipo edicion
  	  idP1 = dbManager.DataReader["mail2"].ToString(); // cedula
	  idP2 = dbManager.DataReader["mail3"].ToString(); // cedula
   	 
	 }
	
	} catch (Exception ex){ Response.Write(ex.Message.ToString());  }
  finally{ dbManager.Dispose();} 
	
%>

<br />
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="2"  >
  <tr>
    <td width="33%"><div align="right" class="detalleDisposicion">Cuenta de correo1:</div></td>
    <td width="67%"><div align="center" style="float: left; width: 40%"><span class="Estilo7">
      <input name="txtEmail1" type="text" class="cajaFormulario" id="txtEmail1" size="10"  maxlength="100"  value="<%=idP0%>"/>
    </span></div></td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><span class="detalleDisposicion">Cuenta de correo2:</span></div></td>
    <td valign="top"><div align="center" style="float: left; width: 40%"><span class="Estilo7">
      <input name="txtEmail2" type="text" class="cajaFormulario" id="txtEmail2" size="10"  maxlength="100" value="<%=idP1%>" />
    </span></div></td>
  </tr>
  <tr>
    <td><div align="right"><span class="detalleDisposicion">Cuenta de correo3: </span></div></td>
    <td><div align="center" style="float: left; width: 40%">
      <input name="txtEmail3" type="text" class="cajaFormulario" id="txtEmail3" size="10" maxlength="100" value="<%=idP2%>" /><input name="idSesion" type="hidden" id="idSesion" value="<%=Session["sysIdRrhh"].ToString()%>" />
    </div></td>
  </tr>
  <tr>
    <td valign="top" align="right">&nbsp;</td>
    <td><button type='button' class="btn btn-primary" onclick="javascript: if (validateForm('frmMeta|txtEmail1;R|txtEmail2;R|txtEmail3;R')){generalJS('0','frmMeta|___sqlAjax1.aspx|txtEmail1;txtEmail2;txtEmail3;idSesion|idCambioCorreos|GET|&typ=22');}" >Guardar</button>
    <div id="idCambioCorreos" style="float: right; width: 60%;"></div></td>
  </tr>
</table>

<div id="idListaCorr" align="center" style="width: 70%;"></div>
