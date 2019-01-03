Import-Module (Join-Path $PSScriptRoot "Utils.psm1") -DisableNameChecking

function Get-Uri
{
    param ($baseUri, $entityName)
    return "$baseUri/$entityName"
}

function Get-Entity
{
    param ($baseUri, $entityName)

    $uri = Get-Uri $baseUri $entityName
    return Get-Safe $uri
}

function New-Entity
{
    param ($baseUri, $entityDefinition)

    return Post $baseUri $entityDefinition
}

function Update-Entity
{
    param ($baseUri, $entityName, $entityDefinition)
    
    $uri = Get-Uri $baseUri $entityName
    return Put $uri $entityDefinition
}

function Remove-Entity
{
    param ($baseUri, $entityName)
    
    $uri = Get-Uri $baseUri $entityName
    return Delete $uri
}

function Show-Entities
{
    param ($baseUri)

    return Get $baseUri
}

Export-ModuleMember -Function Get-Entity
Export-ModuleMember -Function New-Entity
Export-ModuleMember -Function Update-Entity
Export-ModuleMember -Function Remove-Entity
Export-ModuleMember -Function Show-Entities