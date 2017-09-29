# Hier den Namen des PC's der Überwacht werden soll eingeben
$PCName = ""
 
if(Test-Path .status.txt){
}else{
    "aus" > status.txt
}
$Status = Get-Content ".\status.txt"
if (Test-Connection -count 1 -computer $PCName){
    if ($Status -eq "aus"){
        "an" > status.txt
        $wshell = New-Object -ComObject Wscript.Shell
        $wshell.Popup("PC $PCName wurde angeschaltet",0,"$PCName Status Änderung",0x1)
    }
}else{
    if ($Status -eq "an"){
        "aus" > status.txt
        $wshell = New-Object -ComObject Wscript.Shell
        $wshell.Popup("PC $PCName wurde ausgeschaltet",0,"$PCName Status Änderung",0x1)
    }
}
