$message = @" 
                                 
Some stuff that is meaningful  
 
Thank you, 
IT Department 
Cotendo Corporation 
it@cotendo.com 
"@  


$emailFrom = "noreply@doosan.com" 
$subject="Test Email" 
$smtpserver="smtprelay.corp.doosan.com" 
$smtp=new-object Net.Mail.SmtpClient($smtpServer) 
$smtp.Send($emailFrom, "bryan.pudlo@doosan.com", $subject, $message) 