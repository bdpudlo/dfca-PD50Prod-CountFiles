$message = @" 
                                 
Some stuff that is meaningful  
 
Thank you, 
Bryan 

"@  


$emailFrom = "noreply@doosan.com" 
$subject="Test Email from powershell" 
$smtpserver="smtprelay.corp.doosan.com" 
$smtp=new-object Net.Mail.SmtpClient($smtpServer) 
$smtp.Send($emailFrom, "shanthala.kumar@doosan.com", $subject, $message) 