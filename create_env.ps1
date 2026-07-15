# ================================
# KONFIGURACJA
# ================================
$EnvName = "jupyterlab311"
$MinicondaDir = "$HOME\miniconda3"
$Installer = "Miniconda3-latest-Windows-x86_64.exe"
$InstallerUrl = "https://repo.anaconda.com/miniconda/$Installer"

Write-Host "Sprawdzanie instalacji Minicondy..."

# ================================
# INSTALACJA MINICONDA (JUSTME)
# ================================
if (!(Test-Path $MinicondaDir)) {
    Write-Host "Pobieranie Minicondy..."
    Invoke-WebRequest -Uri $InstallerUrl -OutFile $Installer

    Write-Host "Instalacja Minicondy (tryb JustMe)..."
    Start-Process -FilePath ".\$Installer" `
        -ArgumentList "/InstallationType=JustMe /AddToPath=1 /RegisterPython=0 /S /D=$MinicondaDir" `
        -Wait
} else {
    Write-Host "Miniconda już istnieje — pomijam instalację."
}

# ================================
# INICJALIZACJA CONDY
# ================================
Write-Host "Inicjalizacja Condy..."
& "$MinicondaDir\Scripts\conda.exe" init powershell

# Załaduj Condę do bieżącej sesji
. "$HOME\Documents\PowerShell\profile.ps1"

# ================================
# INSTALACJA MAMBY
# ================================
Write-Host "Instalacja Mamby..."
conda install -n base -c conda-forge -y mamba

# ================================
# TWORZENIE ŚRODOWISKA
# ================================
Write-Host "Tworzenie środowiska z environment.yml..."
mamba env create -f environment.yml

# ================================
# AKTYWACJA ŚRODOWISKA
# ================================
Write-Host "Aktywacja środowiska..."
conda activate $EnvName

# ================================
# DODANIE KERNELA DO JUPYTERLAB
# ================================
Write-Host "Dodawanie kernela do JupyterLab..."
python -m ipykernel install --user --name $EnvName --display-name "Python 3.11 (conda)"

# ================================
# AUTO-AKTYWACJA BASE W POWERSHELL
# ================================
Write-Host "Dodawanie automatycznej aktywacji środowiska base do profilu PowerShell..."

$ProfilePath = "$HOME\Documents\PowerShell\profile.ps1"
$AutoActivateBlock = @'
# >>> conda auto-activate base >>>
if (Test-Path "$HOME\miniconda3\Scripts\conda.exe") {
    & "$HOME\miniconda3\Scripts\conda.exe" activate base
}
# <<< conda auto-activate base <<<
'@

if (!(Select-String -Path $ProfilePath -Pattern "conda activate base" -Quiet)) {
    Add-Content -Path $ProfilePath -Value $AutoActivateBlock
    Write-Host "Dodano automatyczną aktywację base."
} else {
    Write-Host "Wpis już istnieje — pomijam."
}

Write-Host "======================================"
Write-Host "Środowisko zostało utworzone i kernel dodany."
Write-Host "Miniconda działa lokalnie (JustMe)."
Write-Host "Automatyczna aktywacja base działa w PowerShell."
Write-Host "======================================"

