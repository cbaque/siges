<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="DataAccessLayer" %>
<%@ Import Namespace="Etiquetas" %>
<div align="left" style=" width: 200px;"><%		
string tipoEdicion = Session["sysEdicion"]!=null ? Session["sysEdicion"].ToString() :"-1";
string id_rrhh =""; string idSel=""; string idSel1=""; 
ComboLista dbAlcance;
ComboLista dbAnalista;

id_rrhh = Session["sysIdRrhh"].ToString();

if (tipoEdicion =="0"){	    
idSel = Request.QueryString["j0"]!="0" ? (Request.QueryString["j0"]!= "" ?  Request.QueryString["j0"] : "1" ) : "1";
dbAlcance = new ComboLista("cmbAlcance", "0", "exec SP_DISPOSICIONES 16,1,1,'A'", "", "", "", "cajaFormulario", "0", "");
			dbAlcance.Nombre=("cmbAlcance");
			dbAlcance.CssCmb="cajaFormulario";
			dbAlcance.ItemSelect = idSel;
			dbAlcance.Events=("onChange='__jump(\"frmMeta|../___Transactions/___erpHome.aspx|cmbAlcance;cmbAlcance\")'");
			Response.Write(dbAlcance.cargarComboLista());
}			


if (tipoEdicion =="1"){

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


dbAnalista = new ComboLista("cmbAlcance", "0", "exec SP_RRHH null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'A',null,8", "", "", "", "cajaFormulario", "0", "");
			dbAnalista.Nombre=("cmbAlcance");
			dbAnalista.CssCmb="cajaFormulario";
			dbAnalista.ItemSelect = Request.QueryString["j0"] ;
			dbAnalista.Events=("onChange='__jump(\"frmMeta|../___Transactions/___erpHome.aspx|cmbAlcance;txtRespID\")'");
			Response.Write(dbAnalista.cargarComboLista());
  
if (idSel!="1"){ 
    
	id_rrhh = idSel ;	
}else{
  id_rrhh = Request.QueryString["j0"];
}
  
   

%>

<div style="float:left; width: 60px;">
	<input name="txtRespS" type="text" class="cajaFormulario" id="txtRespS" size="20"  onkeyup="javascript: if (this.value.length>2){ generalJS('9','frmMeta|___sqlAjax.aspx?typ=14&op=2&tE=0|idAutoSearch|GET|txtRespS|txtRespSSel|txtRespID');}" onclick="this.value=''; var objSE=document.getElementById('txtRespSSel'); objSE.value=''; var objIdSE=document.getElementById('txtRespID'); objIdSE.value='';" placeholder="Buscar" />
	<div id='idAutoSearch' style="width: 250px;"></div>
</div>
<div style="float:left;width: 140px;">
  <input name="txtRespSSel" type="text" class="cajaFormulario" id="txtRespSSel" size="20" readonly="readonly"  placeholder="Responsable" />
</div>
<input name="txtRespID" type="hidden" id="txtRespID" value="" />


<br />     
<br />  
<% } 
//Response.Write(idSel + ":" + id_rrhh);
%>
      
       
</div>
  
<% if (Session["sysTema"].ToString()=="Blue") { %>
<link href="../___css/master.css" rel="stylesheet" type="text/css">
<%}%>
 <% if (Session["sysTema"].ToString()=="Black") { %>
<link href="../___css/master1.css" rel="stylesheet" type="text/css">
<%}%>  
        


<% string strSQL = "";
string strArbol= "";
string imagen = "";
string url="";
string cuenta="";
int i=0;

IDBManager dbManager = new DBManager(DataProvider.OleDb);
dbManager.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["MM_CONNECTION_STRING_Conn"].ToString();
         try
          { 
			   dbManager.Open();
               
			   if (Session["sysIdTipoRrhh"].ToString()=="1"){ // Mismo Menu para Gestor y Analista 
			     if (Session["sysEdicion"].ToString()=="0"){ // Menu Gestores
			   strSQL = "SP_MENU_TIPORRHH  "+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"] +",null,null,null,"+idSel+",null,null,null,"+Session["sysEdicion"].ToString()+",null,'A',null,3,"+id_rrhh+"";
			     }
				 
				 if (Session["sysEdicion"].ToString()=="1"){ //Menu Analistas	 			   
			   
			   strSQL = "SP_MENU_TIPORRHH  "+Session["sysIdTipoRrhh"].ToString()+","+Session["sysIdPlanta"] +",null,null,null,"+ idSel +",null,null,null,"+Session["sysEdicion"].ToString()+",null,'A',null,3,"+id_rrhh+"";
			     }
			   }			   
			  			   
			   if (Session["sysIdTipoRrhh"].ToString()=="2"){ //Menu para Administrador
			   strSQL = "SP_MENU_TIPORRHH  "+Session["sysIdTipoRrhh"].ToString()+",null,null,null,null,null,null,null,null,null,null,'A',null,4,"+id_rrhh+"";
			   }
			   
			    //Response.Write(strSQL);
			  // Response.End();
			   dbManager.ExecuteReader(CommandType.Text,strSQL);
               
			  
			   
			   while(dbManager.DataReader.Read())
			   { 
			     if (i<1){
				        strArbol +="<SCRIPT type=text/javascript>";
						strArbol +="menu = new dTree('menu');";
						strArbol +="menu.add(0,-1,'Menu <a href=\"../___Transactions/___erpHome.aspx?j0=0&j1=\" title=\"Recargar\" ><i class=\"bi bi-arrow-clockwise text-white fs-5\"></i></a>');";
				  }
				 
				 i++;
				  
				
				url = dbManager.DataReader["url"].ToString();
			   	
				switch (dbManager.DataReader["id"].ToString()){
					case "2": //Nuevos
					 imagen = "<i class=\"bi bi-bookmark-fill text-primary\"></i>";
					 
					break;
					case "4": //detenidos
					imagen = "<i class=\"bi bi-bookmark-fill text-danger\"></i>";
					break;
					//case "11": //Incumplido
					//imagen = "<img src=\"../___Images/11.gif\" />";
					//break;
					case "7": // atrasado
					imagen = "<i class=\"bi bi-bookmark-fill text-warning\"></i>";
					break;
					//case "15": //sin reporte
					//imagen = "<img src=\"../___Images/15.gif\" />";
					//break;
					case "5": //en ejecucion
					imagen = "<i class=\"bi bi-bookmark-fill text-success\"></i>";
					break;
					
					case "8": //Revision
					imagen = "<i class=\"bi bi-bookmark-fill text-info\"></i>";
					break;

					case "9": //en espera
					imagen = "<i class=\"bi bi-bookmark-fill text-secondary\"></i>";
					break;
					
					default:
					imagen = "<img src=\"../___Images/General.gif\" />";
					break;					
					}		
	  
			   cuenta = dbManager.DataReader["cuenta"].ToString()!="" ? "(" +dbManager.DataReader["cuenta"].ToString() +")": "" ;
			   
			   strArbol +="menu.add("+dbManager.DataReader["id"].ToString()+","+dbManager.DataReader["padreid"].ToString()+",' "+ imagen +" "+dbManager.DataReader["nombre"].ToString().Trim()+""+cuenta+"','"+ url.Trim()+ dbManager.DataReader["parametro"].ToString().Trim()+dbManager.DataReader["id"].ToString()+"&pID="+ dbManager.DataReader["padreid"].ToString() +"','"+dbManager.DataReader["nombre"].ToString().Trim()+"','"+dbManager.DataReader["evento"].ToString().Trim()+"'); ";
					}
				  strArbol +="document.write(menu);</SCRIPT>";
				Response.Write(strArbol);
              }
             catch (Exception ex)
             {
                 Response.Write(ex.Message.ToString());  
             }
              
             finally
             {
               dbManager.Dispose();
             }

%>
