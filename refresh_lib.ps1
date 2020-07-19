$ErrorActionPreference = "STOP"

$cmsapiproxyDllsPath = [System.IO.Path]::Combine($env:LOCALAPPDATA, "CrownPeak", "CMSAPIDLLs")
Copy-Item (Join-Path $cmsapiproxyDllsPath "CMSAPIProxy*") .\lib\

