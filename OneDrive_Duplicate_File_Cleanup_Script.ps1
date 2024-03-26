# Initialize default paths
$StandardDesktopPath = "$env:USERPROFILE\Desktop"
$OneDriveDesktopPath = "$env:OneDrive\Desktop"

# Try to get the redirected desktop path from the registry
$RedirectedDesktopPath = Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' -Name 'Desktop' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Desktop

# Determine which path exists and use it
if ($RedirectedDesktopPath -and (Test-Path $RedirectedDesktopPath)) {
    $DesktopPath = $RedirectedDesktopPath
} elseif (Test-Path $OneDriveDesktopPath) {
    $DesktopPath = $OneDriveDesktopPath
} else {
    $DesktopPath = $StandardDesktopPath
}

# Initialize default paths
$StandardDocumentsPath = "$env:USERPROFILE\Documents"
$OneDriveDocumentsPath = "$env:OneDrive\Documents"

# Try to get the redirected Documents path from the registry
$RedirectedDocumentsPath = Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' -Name 'Personal' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Personal

# Determine which path exists and use it
if ($RedirectedDocumentsPath -and (Test-Path $RedirectedDocumentsPath)) {
    $DocumentsPath = $RedirectedDocumentsPath
} elseif (Test-Path $OneDriveDocumentsPath) {
    $DocumentsPath = $OneDriveDocumentsPath
} else {
    $DocumentsPath = $StandardDocumentsPath
}

$LogDirectory = "$DocumentsPath\ShortcutCleanupLogs"
$LogFile = "$LogDirectory\$env:USERNAME.log"
$MaxLogFiles = 10

# Create the log directory if it doesn't exist
if (-not (Test-Path $LogDirectory)) {
    New-Item -Path $LogDirectory -ItemType Directory
}

# Rotate log files if more than $MaxLogFiles exist
if ((Get-ChildItem $LogFile*).Count -ge $MaxLogFiles) {
    Get-ChildItem $LogFile* | Sort-Object LastWriteTime | Select-Object -First 1 | Remove-Item -Force
}

# Append date and time to the log file
Add-Content -Path $LogFile -Value ("`n" + (Get-Date).ToString() + "`n")

# Get all .lnk, .url, and .html files on the desktop
$allFiles = Get-ChildItem -Path $DesktopPath -Include "*.lnk", "*.url", "*.html" -Recurse

# Identify files to remove based on pattern
$filesToRemove = $allFiles | Where-Object {
    $_.BaseName -match "^Work - Edge-WBS.*"
}

# Remove the files without confirmation and log their names
$filesToRemove | ForEach-Object {
    $_ | Remove-Item -Force
    Add-Content -Path $LogFile -Value ("Removed: " + $_.FullName)
