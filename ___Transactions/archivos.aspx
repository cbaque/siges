<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="DataAccessLayer" %>
<% Response.CacheControl = "no-cache"; %>
<style type="text/css">
<!--

body {z
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

</style>
<%
string id = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";
string idR = Request.QueryString["id"]!="" ? Request.QueryString["id"]: "";

/*string strSQL=""; string strTotalDisposiciones="";
IDBManager dbManager = new DBManager(DataProvider.OleDb); string strCuentaEstados="";
dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();
try
  { 		  
    dbManager.Open();
	strSQL="SP_DISPOSICIONES null,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',null,"+Session["sysEdicion"].ToString()+",null,null,null,"+Session["sysIdRrhh"].ToString()+",null,null,null";
    //Response.Write(strSQL);
	dbManager.ExecuteReader(CommandType.Text,strSQL);
    while(dbManager.DataReader.Read())
		{	
		 strCuentaEstados += dbManager.DataReader["N"].ToString() + ";";
		 strTotalDisposiciones = dbManager.DataReader["suma"].ToString();
		}
		strCuentaEstados = strCuentaEstados.Substring(0,strCuentaEstados.Length-1);
		//Response.Write(strCuentaEstados+":"+strTotalDisposiciones);
  }catch (Exception ex){
     Response.Write(ex.Message.ToString());  
  }finally{
     dbManager.Dispose();
}*/
%>

<iframe id="idDatos" scrolling="no" width="100%" height="500px" src="../___Import/___upload.aspx?id=<%=id%>&amp;idR=<%=id%>" style="border: 0px solid #cccccc;"  ></iframe>