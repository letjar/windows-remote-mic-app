#requires -Version 5.1
<#
.SYNOPSIS
    Writes the same build provenance a Cython (native-stage) build produces,
    for a source-based (non-Cython) frozen build.

    build-candidate.ps1 writes provenance at the end of its native pipeline.
    When the full native pipeline cannot run (no MSVC C++ toolchain on the
    machine), PyInstaller is invoked directly against the plain src/ tree -
    RemoteMicRC003.spec already supports that path because NATIVE_STAGE is
    false whenever build/native-build.json is absent. This script closes the
    loop so build/package-local-test.ps1, which asserts provenance, can still
    assemble and verify the portable package.

    Produces a functionally complete package, but NOT a byte-identical or
    source-obfuscated equivalent of the official release: business modules
    ship as compiled bytecode inside the EXE archive instead of first-party
    .pyd extensions built with Cython.

.PARAMETER BuildRoot
    Frozen build output directory. Defaults to dist\RemoteMicRC003.
#>

param(
    [string]$BuildRoot = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RC003Root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$RepoRoot = (Resolve-Path (Join-Path $RC003Root "..\..\..")).Path
if ([string]::IsNullOrWhiteSpace($BuildRoot)) {
    $BuildRoot = Join-Path $RC003Root "dist\RemoteMicRC003"
} else {
    $BuildRoot = [System.IO.Path]::GetFullPath($BuildRoot)
}
. (Join-Path $PSScriptRoot "build-provenance.ps1")

$venvPython = Join-Path $RC003Root ".venv\Scripts\python.exe"
if (-not (Test-Path -LiteralPath $venvPython -PathType Leaf)) {
    throw "build virtual environment is missing: $venvPython"
}
if (-not (Test-Path -LiteralPath $BuildRoot -PathType Container)) {
    throw "frozen build output is missing: $BuildRoot"
}

Write-Host "-- fingerprint build inputs --"
$inputState = Get-RC003BuildInputState -RC003Root $RC003Root -RepoRoot $RepoRoot

Write-Host "-- verify frozen executable metadata --"
Assert-RC003ExecutableMetadata `
    -RC003Root $RC003Root `
    -BuildRoot $BuildRoot `
    -PythonExecutable $venvPython

Write-Host "-- write build provenance --"
Write-RC003BuildProvenance `
    -RC003Root $RC003Root `
    -RepoRoot $RepoRoot `
    -BuildRoot $BuildRoot `
    -InputState $inputState `
    -ExecutableMetadataVerified `
    -PythonExecutable $venvPython | Out-Null

Write-Host "-- assert build provenance --"
Assert-RC003BuildProvenance `
    -RC003Root $RC003Root `
    -RepoRoot $RepoRoot `
    -BuildRoot $BuildRoot `
    -PythonExecutable $venvPython | Out-Null

Write-Host "source-build provenance complete: $BuildRoot\build-provenance.json"
