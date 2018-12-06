param(
    $pcre="10.32",
    $edc="0.12.3"
)

$ErrorActionPreference="Stop"
$dest = "bin"

if (Test-Path $dest){
    Remove-Item $dest -Recurse -Force -Confirm:$false
}

New-Item $dest -ItemType Directory -ErrorAction SilentlyContinue | Out-Null

#####################################################################
# pcre
#####################################################################
$url = "https://ftp.pcre.org/pub/pcre/pcre2-$($pcre).zip"
$output = "$dest\pcre2-$($pcre).zip"

"Downloading pcre2 v$pcre sources" | Write-Host -ForegroundColor DarkGreen
Start-BitsTransfer -Source $url -Destination $output

"Extracting pcre2 v$pcre sources" | Write-Host -ForegroundColor DarkGreen
Expand-Archive -Path $output -DestinationPath $dest
Rename-Item -Path "$dest\pcre2-$($pcre)" -NewName "pcre2"


#####################################################################
# editorconfig
#####################################################################
$url = "https://github.com/editorconfig/editorconfig-core-c/archive/v$($edc).zip"
$output = "$dest\editorconfig-core-c-$($edc).zip"

"Downloading editorconfig-core-c v$edc sources" | Write-Host -ForegroundColor DarkGreen
Start-BitsTransfer -Source $url -Destination $output

"Extracting editorconfig-core-c v$edc sources" | Write-Host -ForegroundColor DarkGreen
Expand-Archive -Path $output -DestinationPath $dest
Rename-Item -Path "$dest\editorconfig-core-c-$($edc)" -NewName "editorconfig-core-c"