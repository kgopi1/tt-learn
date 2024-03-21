$file_status=Test-Path ../test.txt
if ($file_status -eq "True"){
    write-host "file is present"
}
else {
    write-host "file is not present"
}
    
