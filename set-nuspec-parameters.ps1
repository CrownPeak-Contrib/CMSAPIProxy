# update nuspec

$nuspecFile = "CMSAPIProxy.dll.nuspec"

[xml]$nuspecDoc = Get-Content $nuspecFile

$f = Get-ChildItem lib\CMSAPIProxy.dll
$lastMod = $f[0].LastWriteTime.ToString("yyyy-MM-dd")

$nuspecDoc.package.metadata.version = "1.1.2"
$nuspecDoc.package.metadata.description = "CrownPeak CMSAPIProxy library, last modified date of $lastMod"

Write-Host "new doc:::"
Write-Host $nuspecDoc.OuterXml

$xmlsettings = New-Object System.Xml.XmlWriterSettings
$xmlsettings.Indent = $true
$xmlsettings.IndentChars = "`t"

$xmlwriter = [System.Xml.XmlTextWriter]::Create($nuspecFile, $xmlsettings)

$nuspecDoc.WriteTo($xmlwriter)