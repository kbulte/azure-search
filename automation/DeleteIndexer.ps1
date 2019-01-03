param (
    [string] 
    $serviceName = $(throw "-serviceName is required."),
    
    [string]
    $serviceKey = $(throw "-serviceKey is required."),

    [string] 
    $indexerName = $(throw "-indexerName is required.")
 )
 
 Import-Module (Join-Path (Join-Path $PSScriptRoot "lib") "Credentials.psm1") -DisableNameChecking
 Import-Module (Join-Path (Join-Path $PSScriptRoot "lib") "Indexer.psm1") -DisableNameChecking

 Set-Credentials $serviceName $serviceKey

 $indexer = Get-Indexer $indexerName
 if ($null -ne $indexer)
 {
    Remove-Indexer $indexerName
    Write-Host "Indexer $indexerName has been deleted"
 }
 else
 {
    Write-Host "Indexer $indexerName was not found"
 }