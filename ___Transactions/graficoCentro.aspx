<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="DataAccessLayer" %>
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
string strSQL=""; string strTotalDisposiciones=""; string idSel="";
string id_rrhh = Session["sysIdRrhh"].ToString();

if (Session["sysEdicion"].ToString() =="0"){
idSel = Request.QueryString["j0"]!="0" ? (Request.QueryString["j0"]!= "" ?  Request.QueryString["j0"] : "1" ) : "1";
}

if (Session["sysEdicion"].ToString() =="1"){

if (Request.QueryString["j1"]==""){  
 switch (Request.QueryString["j0"].ToString()){
 case "":
  idSel = "null";
 break;
 case "0":
 idSel = id_rrhh;
 break;
 
 default :
 idSel = Request.QueryString["j0"];
 break;
 }		
}else{
  idSel= "1";
}

if (idSel!="1"){ 
    id_rrhh = idSel ;	
}else{
  id_rrhh = Request.QueryString["j0"];
}

//id_rrhh = idSel!="null" ? idSel : "null"  ;

}




IDBManager dbManager = new DBManager(DataProvider.OleDb); string strCuentaEstados="";
dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();
try
  {    
    
	dbManager.Open();
	strSQL="SP_DISPOSICIONES null,"+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"].ToString()+",'A',null,"+Session["sysEdicion"].ToString()+",null,null,null,"+id_rrhh+","+idSel+",null,null";
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

<iframe id="idDatos" scrolling="no" width="100%" height="600px" src="grafico.aspx?val=<%=strCuentaEstados%>&c=<%=strTotalDisposiciones%>&j0=<%=id_rrhh%>&j1=<%=idSel%>" style="border: 0px solid #cccccc;"  ></iframe>