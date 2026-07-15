#!/bin/bash

# ================================
# KONFIGURACJA
# ================================
ENV_NAME="jupyterlab311"
MINICONDA_DIR="$HOME/programy/miniconda3"
MINICONDA_INSTALLER="Miniconda3-latest-Linux-x86_64.sh"
MINICONDA_URL="https://repo.anaconda.com/miniconda/$MINICONDA_INSTALLER"
BASHRC="$HOME/.bashrc"

# ================================
# POBRANIE I INSTALACJA MINICONDY
# ================================
echo "Sprawdzanie, czy Miniconda jest już zainstalowana w: $MINICONDA_DIR"

if [ -d "$MINICONDA_DIR" ]; then
    echo "Miniconda już istnieje. Pomijam instalację."
else
    echo "Pobieranie Minicondy..."
    wget "$MINICONDA_URL"

    if [ $? -ne 0 ]; then
        echo "Błąd podczas pobierania Minicondy!"
        exit 1
    fi

    echo "Instalacja Minicondy do: $MINICONDA_DIR"
    bash "$MINICONDA_INSTALLER" -b -p "$MINICONDA_DIR"

    if [ $? -ne 0 ]; then
        echo "Błąd podczas instalacji Minicondy!"
        exit 1
    fi

    echo "Miniconda została zainstalowana."
fi

# ================================
# AKTYWACJA CONDY
# ================================
echo "Ładowanie Condy..."
source "$MINICONDA_DIR/etc/profile.d/conda.sh"

# ================================
# AKCEPTACJA TERMS OF SERVICE
# ================================
echo "Akceptacja Terms of Service dla kanałów Anaconda..."
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

# ================================
# INSTALACJA MAMBY
# ================================
echo "Sprawdzanie, czy Mamba jest dostępna..."
if command -v mamba >/dev/null 2>&1; then
    echo "Mamba jest zainstalowana. Używam Mamby."
    USE_MAMBA=true
else
    echo "Mamba nie jest zainstalowana. Instaluję Mambę..."
    conda install -n base -c conda-forge -y mamba

    if command -v mamba >/dev/null 2>&1; then
        echo "Mamba została zainstalowana."
        USE_MAMBA=true
    else
        echo "Nie udało się zainstalować Mamby. Używam Condy."
        USE_MAMBA=false
    fi
fi

# ================================
# TWORZENIE ŚRODOWISKA
# ================================
echo "Tworzenie środowiska z environment.yml..."

if [ "$USE_MAMBA" = true ]; then
    mamba env create -f environment.yml
else
    conda env create -f environment.yml
fi

if [ $? -ne 0 ]; then
    echo "Błąd podczas tworzenia środowiska!"
    exit 1
fi

# ================================
# AKTYWACJA ŚRODOWISKA
# ================================
echo "Aktywacja środowiska..."
conda activate "$ENV_NAME"

# ================================
# DODANIE KERNELA DO JUPYTERLAB
# ================================
echo "Dodawanie kernela do JupyterLab..."
python -m ipykernel install --user --name "$ENV_NAME" --display-name "Python 3.11 (conda)"


echo "Dodawanie automatycznej aktywacji środowiska base do ~/.bashrc..."

CONDA_INIT_BLOCK='
# >>> conda initialize >>>
if [ -f "$HOME/programy/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/programy/miniconda3/etc/profile.d/conda.sh"
    conda activate base
fi
# <<< conda initialize <<<
'

# Dopisz tylko jeśli nie istnieje
if ! grep -q "conda activate base" "$BASHRC"; then
    echo "$CONDA_INIT_BLOCK" >> "$BASHRC"
    echo "Dodano wpis do ~/.bashrc."
else
    echo "Wpis już istnieje — pomijam."
fi

echo "======================================"
echo "Środowisko zostało utworzone i kernel dodany."
echo "Aby aktywować środowisko ręcznie:"
echo "    conda activate $ENV_NAME"
echo "======================================"
