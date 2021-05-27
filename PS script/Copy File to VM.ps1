$cred = Get-Credential
$s = New-PSSession -ComputerName "52.142.56.241" -Credential $cred
Copy-Item C:\temptxt\ C:\ -ToSession $s