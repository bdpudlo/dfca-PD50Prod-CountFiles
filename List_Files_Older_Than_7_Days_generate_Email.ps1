Set-StrictMode -Version Latest

#Constants
$Emails = "Bryan.Pudlo@doosan.com"
$NumberofDays = "7"
#[string[]]$Folder = @("\\swc-us-pd50prod\pd50prod\X831")
[string[]]$Folders = @("\\swc-us-pd50prod\pd50prod\x750A",
    "\\swc-us-pd50prod\pd50prod\x750B", 
    "\\swc-us-pd50prod\pd50prod\x751A", 
    "\\swc-us-pd50prod\pd50prod\x751B", 
    "\\swc-us-pd50prod\pd50prod\x781", 
    "\\swc-us-pd50prod\pd50prod\x782", 
    "\\swc-us-pd50prod\pd50prod\x783", 
    "\\swc-us-pd50prod\pd50prod\x784", 
    "\\swc-us-pd50prod\pd50prod\x784B", 
    "\\swc-us-pd50prod\pd50prod\x786", 
    "\\swc-us-pd50prod\pd50prod\x787", 
    "\\swc-us-pd50prod\pd50prod\x831" )


#mkdir C:\PD50prod_reports
<#
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x750A -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Measure-Object).count > C:\PD50prod_reports\x750A.txt
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x750B -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Measure-Object).count > C:\PD50prod_reports\x750B.txt
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x751A -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Measure-Object).count> C:\PD50prod_reports\x751A.txt
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x751B -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Measure-Object).count> C:\PD50prod_reports\x751B.txt
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x781 -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Measure-Object).count> C:\PD50prod_reports\x781.txt
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x782 -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Measure-Object).count> C:\PD50prod_reports\x782.txt
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x783 -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Measure-Object).count> C:\PD50prod_reports\x783.txt
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x784 -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)}| Measure-Object).count > C:\PD50prod_reports\x784.txt
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x784B -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Measure-Object).count> C:\PD50prod_reports\x784B.txt
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x786 -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Measure-Object).count> C:\PD50prod_reports\x786.txt
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x787 -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)}| Measure-Object).count > C:\PD50prod_reports\x787.txt
(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x831 -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Measure-Object).count> C:\PD50prod_reports\x831.txt
#>

function Count_Files_Older_than_Days {
    param ([string[]]$Folders, [int]$Days)
    
    [string[]]$Texttosend = @()

    ForEach ($item in $Folders) {
        
        $Texttosend += (Get-ChildItem -Path $item -Recurse -Attributes !Directory+!System | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-1 * $Days)} | Measure-Object).count 
        #Get-ChildItem -Path $item -Recurse -Attributes !Directory+!System | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-1 * $Days)}
    
    }
    #(Get-ChildItem -Path \\swc-us-pd50prod\pd50prod\x750A -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-1 * $Days)} | Measure-Object).count
    return ,$Texttosend
}

function Create_Email_Body {
    param (
        [string[]]$Folders, [int]$Days 
    )
    [string[]]$FilesPerFolder = @()
    [string]$message = ""

    $FilesPerFolder = Count_Files_Older_than_Days $Folders $NumberofDays

    if ($Filesperfolder.Count -eq $Folders.Count)
    {
        #Same Number
        #$message = "Same Number of items in script"
        $message += "Hello Please find attached the Weekely reports for the data folders for PD50Prod Test Data" + [System.Environment]::NewLine + [System.Environment]::NewLine
        for ($i = 0; $i -lt $Filesperfolder.Count; $i++) {
            $message += "There are " + $FilesPerFolder[$i] + " in folder" + $Folders[$i] + " That are older than " + $NumberofDays + " days." + [System.Environment]::NewLine
        }


    }
        else {
            #Different Number
            $message = "Error in Script, please contact TED group"
        }
    
        
    
    return ,$message
}

function Simple_Email {
    param (
        [string]$message
    )
    $emailFrom = "noreply@doosan.com" 
    $subject="PD50Test Data files not verified" 
    $smtpserver="smtprelay.corp.doosan.com" 
    $emailto = @("bryan.pudlo@doosan.com",  "cassandra.eurich@doosan.com")
    $smtp=new-object Net.Mail.SmtpClient($smtpServer) 
    $smtp.Send($emailFrom, $emailto, $subject, $message) 
}

#function Main {
    Write-Host "Starting Main"
    #$myArray = @()
    #This will be the main function to read in the folders and 
    #$myArray = Count_Files_Older_than_Days $Folders $NumberofDays
    $EmailMessage = Create_Email_Body $Folders $NumberofDays
    Simple_Email $EmailMessage


#}