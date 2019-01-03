Import-Module (Join-Path $PSScriptRoot "Utils.psm1") -DisableNameChecking
Import-Module (Join-Path $PSScriptRoot "CRUDHelpers.psm1") -DisableNameChecking

function Get-BaseUri
{
    return "https://$Global:serviceName.search.windows.net/indexers"
}

function Get-Indexer
{
    param ($indexerName)

    $baseUri = Get-BaseUri
    return Get-Entity $baseUri $indexerName
}

function New-Indexer
{
    param ($indexerDefinition)

    $name = $indexerDefinition.name
    Write-Host "Creating indexer $name..."

    $baseUri = Get-BaseUri
    return New-Entity $baseUri $indexerDefinition
}

function Update-Indexer
{
    param ($indexerName, $indexerDefinition)

    Write-Host "Updating indexer $indexerName..."

    $baseUri = Get-BaseUri
    return Update-Entity $baseUri $indexerName $indexerDefinition
}

function Remove-Indexer
{
    param ($indexerName)

    Write-Host "Deleting indexer $indexerName..."

    $baseUri = Get-BaseUri
    return Remove-Entity $baseUri $indexerName
}

function Show-Indexers
{
    $baseUri = Get-BaseUri
    return Show-Entities $baseUri
}

function Get-IndexerStatus
{
    param ($indexerName)

    $baseUri = Get-BaseUri
    $uri = "$baseUri/$indexerName/status"
    return Get $uri
}

function Start-Indexer
{
    param ($indexerName)

    $baseUri = Get-BaseUri
    $uri = "$baseUri/$indexerName/run"
    return Post $uri
}

function Reset-Indexer
{
    param ($indexerName)

    $baseUri = Get-BaseUri
    $uri = "$baseUri/$indexerName/reset"
    return Post $uri
}

Export-ModuleMember -Function Get-Indexer
Export-ModuleMember -Function New-Indexer
Export-ModuleMember -Function Update-Indexer
Export-ModuleMember -Function Remove-Indexer
Export-ModuleMember -Function Show-Indexers
Export-ModuleMember -Function Get-IndexerStatus
Export-ModuleMember -Function Start-Indexer
Export-ModuleMember -Function Reset-Indexer