#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


if (-not (Get-Command kubectl -ErrorAction SilentlyContinue) -and (-not (Get-Variable -Name PWSHRC_FORCE_MODULES_EXPORT_UNSUPPORTED -Scope Global -ValueOnly -ErrorAction SilentlyContinue))) {
    return
} else {
    . "$PSScriptRoot/poshy-wrap-kubectl.ps1"
}
