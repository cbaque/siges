<?php
/*$to      = 'sbauz@hotmail.com';
$subject = 'the subject';
$message = 'hello';
$headers = 'From: webmaster@siges.ec' . "\r\n" .
    'Reply-To: webmaster@siges.ec' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();
	mail($to, $subject, $message, $headers);*/
?>
<?php 

$connection = odbc_connect("Driver={SQL Server Native Client 10.0};Server=SQL2008.dbsqlserver.com,8888;Database=04690_db;", "04690_usuario", "Doom5452@@");
echo (isset($connection));
$SQL_Exec_String =  "select * from sg_Mensajes";    
//ejecucion query 
$cur= odbc_exec( $connection, $SQL_Exec_String );  
odbc_result_all($cur,"border=1");
echo ('N='.odbc_num_rows($cur)); 
echo  "<table border=1><tr><th>Dni</th><th>Nombre</th>".  
         "<th>codigo</th><th>ciudad</th></tr>\n";  
    while( odbc_fetch_row( $cur ) ) {  
       $Dni= odbc_result( $cur, 1 );  
       $Nombre= odbc_result( $cur, 2 );  
       $codigo= odbc_result( $cur, 3 ); 
       $ciudad= odbc_result( $cur, 4 ); 
        echo  "<tr><td>$Dni</td><td>$Nombre</td>".  
             "<td>$codigo</td><td>$ciudad</td></tr>\n";  
    }  
    echo  "</table>";

?>