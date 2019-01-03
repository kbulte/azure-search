Import-Module (Join-Path $PSScriptRoot "Utils.psm1") -DisableNameChecking
Import-Module (Join-Path $PSScriptRoot "CRUDHelpers.psm1") -DisableNameChecking

function Get-BaseUri
{
    return "https://$Global:serviceName.search.windows.net/indexes"
}

function Get-Index
{
    param ($indexName)

    $baseUri = Get-BaseUri
    return Get-Entity $baseUri $indexName
}

function New-Index
{
    param ($indexDefinition)

    $name = $indexDefinition.name
    Write-Host "Creating index $name..."

    $baseUri = Get-BaseUri
    return New-Entity $baseUri $indexDefinition
}

function Update-Index
{
    param ($indexName, $indexDefinition)
    
    Write-Host "Updating index $indexName..."

    $baseUri = Get-BaseUri
    return Update-Entity $baseUri $indexName $indexDefinition
}

function Remove-Index
{
    param ($indexName)

    Write-Host "Deleting index $indexName..."

    $baseUri = Get-BaseUri
    return Remove-Entity $baseUri $indexName
}

function Show-Indexes
{
    $baseUri = Get-BaseUri
    return Show-Entities $baseUri
}

function Get-IndexStats
{
    param ($indexName)

    $baseUri = Get-BaseUri
    $uri = "$baseUri/$indexName/stats"
    return Get $uri
}

Export-ModuleMember -Function Get-Index
Export-ModuleMember -Function New-Index
Export-ModuleMember -Function Update-Index
Export-ModuleMember -Function Remove-Index
Export-ModuleMember -Function Show-Indexes
Export-ModuleMember -Function Get-IndexStats