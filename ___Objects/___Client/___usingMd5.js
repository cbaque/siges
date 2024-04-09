function EncriptPassStudent(thisForm)
{
 //alert (hex_md5(thisForm.password.value));
  thisForm.encriptpass.value= hex_md5(thisForm.password.value);
}

function checkAndPass(thisForm)
{
  //sendMD5ToAuthentic(extractMD5(this.form),this.form)
   sendMD5ToRegister(extractMD5(thisForm),thisForm);
}

function sendMD5ToRegister(hash,thisform) {
	
	var sp = eval("document." + thisform + ".username.value");
      	location.href="___Interface/___sessionApp.aspx?pass=" + hash + "&us=" + sp;
	  
	}
		
	
	function extractMD5(thisform) {
	var bn = eval("document." + thisform + ".password.value");
		return (hex_md5(bn))
	}
	
	
	



