#####################
# Main-tool Menu    #
# by: lezarian      #
# v: 4.1            #
#####################

#
## Statements
#
$scriptcontinue = $true
$scriptdeviceswap = $true
$scriptprintmove = $true
$scriptfilemove = $true
$scripthashchecker = $true

$olddevice = "unk"
$olddeviceip = "unk"
$newdevice = "unk"
$newdeviceip = "unk"

$1filehash = "unk"
$1file = "unk"
$2filehash = "unk"
$2file = "unk"
$hashmatch = "unk"

#
## functions
#

#function setold{
#    $olddevice = Read-Host "Enter tag of old device"
#    $olddeviceip = Test-Connection -count 1 -ComputerName $olddevice | select ipv4address
#}
#function setnew{
#    $newdevice = Read-Host "Enter tag of new device"
#    $newdeviceip = Test-Connection -count 1 -ComputerName $newdevice | select ipv4address
#}

#
## Pages past Main Menu
#
function deviceswap{
    While ($scriptdeviceswap){
    
    clear #clears screen for menu
    $page = "Device Swapper"

    '','Mass-Tool','' | Write-Host #title
    Write-Host "Page [ $page ]"
    Write-Host "Old Device [ $olddevice ] IP [ $olddeviceip ]"
    Write-Host "New Device [ $newdevice ] IP [ $newdeviceip ]"
    '','Options...','1) list programs','2) list sso','3) open sso creator' | Write-Host
    'old / new / c / q','' | Write-Host

    $menuselection = Read-Host "Enter Selection"
    switch ($menuselection) {
        old {$olddevice = Read-Host "Enter tag of old device"
             $olddeviceip = Test-Connection -count 1 -ComputerName $olddevice | select ipv4address
        }
        new {$newdevice = Read-Host "Enter tag of new device"
             $newdeviceip = Test-Connection -count 1 -ComputerName $newdevice | select ipv4address
        }
        1 {Get-ChildItem "\\$olddevice\c$\Users\Public\Desktop" | select name, *Time
           Pause
        }
        2 {dir \\$olddevice\c$\
           dir \\$olddevice\c$\
           pause
        }
        3 {Start }
        c {$olddevice = "unk"
           $olddeviceip = "unk"
           $newdevice = "unk"
           $newdeviceip = "unk"
        }
        q {$scriptdeviceswap = $false}
        } #end switch
    } #end while
} #end function

function printmove{
    while ($scriptprintmove) {

    clear #clears screen for menu
    $page = "Printer Mover"

    '','Mass-Tool','' | Write-Host #title
    Write-Host "Page [ $page ]"
    Write-Host "Old Device [ $olddevice ] IP [ $olddeviceip ]"
    Write-Host "New Device [ $newdevice ] IP [ $newdeviceip ]"
    '','Options...','1) empty','2) empty','3) empty','old / new / c / q','' | Write-Host

    $menuselection = Read-Host "Enter Selection"
    switch ($menuselection) {
        old {$olddevice = Read-Host "Enter tag of old device"
             $olddeviceip = Test-Connection -count 1 -ComputerName $olddevice | select ipv4address
        }
        new {$newdevice = Read-Host "Enter tag of new device"
             $newdeviceip = Test-Connection -count 1 -ComputerName $newdevice | select ipv4address
        }
        c {$olddevice = "unk"
           $olddeviceip = "unk"
           $newdevice = "unk"
           $newdeviceip = "unk"
        }
        q {$scriptprintmove = $false}
        } #end switch
    } #end while
} #end function

function filemove{

    function listusers{
        dir C:\Users\$olddevice | select Name, *Time
        pause
    }

    while ($scriptfilemove) {

    clear #clears screen for menu
    $page = "File Mover"

    '','Mass-Tool','' | Write-Host #title
    Write-Host "Page [ $page ]"
    Write-Host "Old Device [ $olddevice ] IP [ $olddeviceip ]"
    Write-Host "New Device [ $newdevice ] IP [ $newdeviceip ]"
    '','Options...','1) List Users','2) empty','3) empty','old / new / c / q','' | Write-Host

    $menuselection = Read-Host "Enter Selection"
    switch ($menuselection) {
        old {$olddevice = Read-Host "Enter tag of old device"
             $olddeviceip = Test-Connection -count 1 -ComputerName $olddevice | select ipv4address
        }
        new {$newdevice = Read-Host "Enter tag of new device"
             $newdeviceip = Test-Connection -count 1 -ComputerName $newdevice | select ipv4address
        }
        1 {listusers}
        2 {}
        c {$olddevice = "unk"
           $olddeviceip = "unk"
           $newdevice = "unk"
           $newdeviceip = "unk"
        }
        q {$scriptfilemove = $false}
        } #end switch
    } #end while
} #end function

function hashchecker{
    while ($scripthashchecker) {

    clear #clears screen for menu
    $page = "Hash Checker"

    '','Mass-Tool','' | Write-Host #title
    Write-Host "Page [ $page ]"
    Write-Host "#1 Hash [ $1filehash ]"
    Write-Host "#2 Hash [ $2filehash ]"
    Write-Host "#1 File [ $1file ]"
    Write-Host "#2 File [ $2file ]"
    Write-Host "Hash match [ $hashmatch ]"
    '','Options...','1) set #1 to file','2) set #1 to value' | Write-Host
    '3) set #2 to file','4) set #2 to value' | Write-Host
    'c / q','' | Write-Host

    $menuselection = Read-Host "Enter Selection"
    switch ($menuselection) {
        1 {}
        2 {}
        3 {}
        4 {}
        c {$olddevice = "unk"
           $olddeviceip = "unk"
           $newdevice = "unk"
           $newdeviceip = "unk"
        }
        q {$scripthashchecker = $false}
        } #end switch
    } #end while
} #end function

#
## Main Menu
#
while ($scriptcontinue) {
    clear #clears screen for menu
    $page = "Main Menu" #sets page name baack

    '','Mass-Tool','' | Write-Host #title
    Write-Host "Page [ $page ]"
    Write-Host "Old Device [ $olddevice ] IP [ $olddeviceip ]"
    Write-Host "New Device [ $newdevice ] IP [ $newdeviceip ]"
    '','Options...','old) set old device','new) set new device','' | Write-Host
    'Pages...','1) Device Swapper','2) Printer Mover' | Write-Host
    '3) File Mover','4) Hash Checker','5) empty' | Write-Host
    '','c) clear','q) quit','' | Write-Host


    $menuselection = Read-Host "Enter Selection"
    switch ($menuselection){
        old {$olddevice = Read-Host "Enter tag of old device"
             $olddeviceip = Test-Connection -count 1 -ComputerName $olddevice | select ipv4address
        }
        new {$newdevice = Read-Host "Enter tag of new device"
             $newdeviceip = Test-Connection -count 1 -ComputerName $newdevice | select ipv4address
        }
        1 {deviceswap}
        2 {printmove}
        3 {filemove}
        4 {hashchecker}
        c {$olddevice = "unk"
           $olddeviceip = "unk"
           $newdevice = "unk"
           $newdeviceip = "unk"
        }
        q {exit}
    }
}