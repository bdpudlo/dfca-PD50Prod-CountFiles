#mkdir C:\PD50prod_reports
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
