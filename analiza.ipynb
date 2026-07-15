# ================================
# KONFIGURACJA
# ================================
$EnvName = "jupyterlab311"
$MinicondaDir = "$HOME\miniconda3"
$Installer = "Miniconda3-latest-Windows-x86_64.exe"
$InstallerUrl = "https://repo.anaconda.com/miniconda/$Installer"
$ProfilePath = "$HOME\Documents\PowerShell\profile.ps1"

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

# Utwórz profil jeśli nie istnieje
if (!(Test-Path $ProfilePath)) {
    Write-Host "Tworzenie profilu PowerShell..."
    New-Item -ItemType File -Path $ProfilePath -Force | Out-Null
}

# Załaduj Condę do bieżącej sesji
Write-Host "Ładowanie Condy do bieżącej sesji..."
. $ProfilePath

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
# BLOK INICJALIZACJI CONDY
# ================================
Write-Host "Dodawanie bloku inicjalizacji Condy do profilu PowerShell..."

$CondaInitBlock = @'
# >>> conda initialize >>>
if (Test-Path "$HOME\miniconda3\Scripts\conda.exe") {
    & "$HOME\miniconda3\Scripts\conda.exe" hook powershell | Out-String | Invoke-Expression
}
# <<< conda initialize <<<
'@

if (!(Select-String -Path $ProfilePath -Pattern "conda initialize" -Quiet)) {
    Add-Content -Path $ProfilePath -Value $CondaInitBlock
    Write-Host "Dodano blok inicjalizacji Condy."
} else {
    Write-Host "Blok inicjalizacji już istnieje — pomijam."
}

# ================================
# AUTO-AKTYWACJA BASE
# ================================
Write-Host "Dodawanie auto-aktywacji środowiska base..."

$AutoActivateBlock = @'
# >>> conda auto-activate base >>>
conda activate base
# <<< conda auto-activate base <<<
'@

if (!(Select-String -Path $ProfilePath -Pattern "conda activate base" -Quiet)) {
    Add-Content -Path $ProfilePath -Value $AutoActivateBlock
    Write-Host "Dodano auto-aktywację base."
} else {
    Write-Host "Auto-aktywacja base już istnieje — pomijam."
}

Write-Host "======================================"
Write-Host "Środowisko zostało utworzone i kernel dodany."
Write-Host "Miniconda działa lokalnie (JustMe)."
Write-Host "Automatyczna inicjalizacja i auto-aktywacja działają."
Write-Host "======================================"
