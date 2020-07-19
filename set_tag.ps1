$ErrorActionPreference = "STOP"

$f = Get-ChildItem lib\CMSAPIProxy.dll
$build = $f[0].LastWriteTime.ToString("yyMM")

Write-Host "CMSAPIProxy.dll last write time is " $f.LastWriteTime
Write-Host "Build number should be $build"

[xml]$nuspec = Get-Content .\CMSAPIProxy.dll.nuspec

$nuspecVersion = ($nuspec | Select-Xml "/package/metadata/version").Node.InnerText
if($nuspecVersion -eq '$version$') {
    throw "bad version in nuspec: '$nuspecVersion'"
}

# using 1.1.1 to semver forward from a preexisting 1.1.0.17000 [something] in nuget.cp-contrib.com feed
#commented out, we arent using datecode as build right now
#$version = "$nuspecVersion.$build"
$version = $nuspecVersion

Write-Host "Setting Version to $version"

$rungittag = Read-Host "Run git tag? [Y/n]"

if($rungittag -eq "Y") {
    
    Write-Host "git" "tag" "v$version"
    & "git" "tag" "v$version"

    Write-Host "Update tags at server: git push --tags"
} else {

    Write-Host "Skipped running 'git tag'"

}
