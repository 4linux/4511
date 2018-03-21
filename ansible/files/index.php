<?php
?>
<html>
<body>
<center><font size="10" Color="size"> <br><br><br><br><br>
<?PHP

function getUserIP()
{
		    $ipaddress = '';
		    	        if (getenv('HTTP_CLIENT_IP'))
								        $ipaddress = getenv('HTTP_CLIENT_IP');
						    else if(getenv('HTTP_X_FORWARDED_FOR'))
							    			            $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
						    else if(getenv('HTTP_X_FORWARDED'))
							    			            $ipaddress = getenv('HTTP_X_FORWARDED');
						    else if(getenv('HTTP_FORWARDED_FOR'))
							    			            $ipaddress = getenv('HTTP_FORWARDED_FOR');
						    else if(getenv('HTTP_FORWARDED'))
							    			           $ipaddress = getenv('HTTP_FORWARDED');
						    else if(getenv('REMOTE_ADDR'))
							    			            $ipaddress = getenv('REMOTE_ADDR');
						    else
							    			            $ipaddress = 'Unknown IP Address';

		    	        return $ipaddress;
}

$user_ip = getUserIP();

echo $user_ip; // Output IP address (Ex: 123.345.456.678)

?>
</font>
</center>
</body>
</html> 
