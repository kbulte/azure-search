Import-Module (Join-Path $PSScriptRoot "CRUDHelpers.psm1") -DisableNameChecking

function Get-BaseUri
{
    return "https://$Global:serviceName.search.windows.net/datasources"
}

function Get-DataSource
{
    param ($dataSourceName)

    $baseUri = Get-BaseUri
    return Get-Entity $baseUri $dataSourceName
}

function New-DataSource
{
    param ($dataSourceDefinition)

    $name = $dataSourceDefinition.name
    Write-Host "Creating data source $name..."

    $baseUri = Get-BaseUri
    
    return New-Entity $baseUri $dataSourceDefinition
}

function Update-DataSource
{
    param ($dataSourceName, $dataSourceDefinition)

    Write-Host "Updating data source $dataSourceName..."

    $baseUri = Get-BaseUri
    return Update-Entity $baseUri $dataSourceName $dataSourceDefinition
}

function Remove-DataSource
{
    param ($dataSourceName)

    Write-Host "Deleting data source $dataSourceName..."

    $baseUri = Get-BaseUri
    return Remove-Entity $baseUri $dataSourceName
}

function Show-DataSources
{
    $baseUri = Get-BaseUri
    return Show-Entities $baseUri
}

Export-ModuleMember -Function Get-DataSource
Export-ModuleMember -Function New-DataSource
Export-ModuleMember -Function Update-DataSource
Export-ModuleMember -Function Remove-DataSource
Export-ModuleMember -Function Show-DataSources