<% //--------------------------------------------------------
	//LOCK TRANSACTION PAGE 
		//Session.Timeout=60;
		string pageLocked;
		pageLocked = (string)Session["lockpage"]; 
		//Response.Write(pageLocked);
		//Response.End();
		if (pageLocked !="ulock"  ){Response.Redirect("../63f295684975d3598c0c19e1a3709f25.aspx");		
		}
		//Session["lockpage"] = "lock";		
%>

