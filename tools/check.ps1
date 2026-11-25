# Checks the endpoint specs in endpoints/.
# Every endpoint that accepts a request body (POST, PUT, PATCH) needs a
# "## Validation" section and an "## Errors" section that covers 400 Bad Request.

$failed = 0
$files = Get-ChildItem -Path (Join-Path $PSScriptRoot '..\endpoints') -Filter '*.md'

foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    if ($content -notmatch '(?m)^\*\*Method:\*\*\s*(POST|PUT|PATCH)') {
        Write-Host "OK    $($file.Name) (no request body)"
        continue
    }

    $problems = @()
    if ($content -notmatch '(?m)^## Validation\s*$') { $problems += "missing '## Validation' section" }
    if ($content -notmatch '(?m)^## Errors\s*$') { $problems += "missing '## Errors' section" }
    elseif ($content -notmatch '400 Bad Request') { $problems += "'## Errors' does not cover 400 Bad Request" }

    if ($problems.Count -eq 0) {
        Write-Host "OK    $($file.Name)"
    }
    else {
        foreach ($p in $problems) { Write-Host "FAIL  $($file.Name): $p" }
        $failed += $problems.Count
    }
}

if ($failed -gt 0) {
    Write-Host "`n$failed problem(s) found."
    exit 1
}
Write-Host "`nAll checks passed."
exit 0
