$message = @" 
Second Test.                        
Some stuff that is meaningful for this test email. 
 
Thank you, 
Bryan 

"@  


$emailFrom = "noreply@doosan.com" 
$subject="Test Email from powershell" 
$smtpserver="smtprelay.corp.doosan.com" 
$smtp=new-object Net.Mail.SmtpClient($smtpServer) 
$smtp.Send($emailFrom, "bryan.pudlo@doosan.com", $subject, $message) 