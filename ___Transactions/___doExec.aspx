<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="DataAccessLayer" %>
<%
IDBManager dbManager = new DBManager(DataProvider.OleDb);
dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();
string strSQL="";
  try{  
     dbManager.Open();
	 strSQL = "exec spProcesos  1"; 	//Response.Write(strSQL);	   
	 dbManager.ExecuteNonQuery(CommandType.Text,strSQL);
	 }catch (Exception ex){ Response.Write(ex.Message.ToString()); }
             finally{dbManager.Dispose();}
	

%>