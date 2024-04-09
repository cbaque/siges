<%
try{
string estado = Session["sysIdRrhh"]!=null ? "1" : "0";
Response.Write(estado);
} catch (Exception ex){
  Response.Write("-1");
}
%>