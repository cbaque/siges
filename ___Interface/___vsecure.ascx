<script language="c#" runat="server">
/*void cambia_color(Object obj,EventArgs e){
   buscar.color="Red";

}*/
</script>
<% //--------------------------------------------------------
	//   Zona de seguridad de SWA - Sistema web academico 
		//Session.Timeout=60;
		string securityResponse;
		securityResponse = (string)Session["securitySign"];
		if (Session["sysIdRrhh"]=="") { Response.Redirect("../63f295684975d3598c0c19e1a3709f25.aspx");}
		if (securityResponse!="webaccess" ) {Response.Redirect("../63f295684975d3598c0c19e1a3709f25.aspx");}	
%>
