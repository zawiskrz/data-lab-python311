# 🎯 Cel projektu

Repozytorium zawiera:

- środowisko Python do analizy danych,
- notebook `analiza.ipynb`,
- dane z zadania 8 matury rozszerzonej z informatyki (2026),
- skrypty instalacyjne dla Linux i Windows,
- pełną konfigurację Conda/Mamba w pliku `environment.yml`.

Celem jest umożliwienie szybkiego uruchomienia środowiska analitycznego na dowolnym systemie.

---

# 📁 Struktura projektu

```
.
├── analiza.ipynb                 # Notebook z analizą danych
├── baza.db                       # Lokalna baza SQLite
├── create_env.ps1                # Skrypt instalacyjny dla Windows (PowerShell)
├── create_env.sh                 # Skrypt instalacyjny dla Linux (bash)
├── dane/                         # Dane do zadania 8 (matura INF 2026)
│   ├── klienci.txt
│   ├── opis_transakcji.txt
│   └── transakcje.txt
├── environment.yml               # Definicja środowiska Conda/Mamba
├── Miniconda3-latest-Linux-x86_64.sh   # Instalator Minicondy dla Linux
├── minp_dane_2605.zip            # Dane z arkusza maturalnego INF 2026
├── minp_r0_100_2605_zasady.pdf   # Zasady oceniania (matura INF 2026)
├── minp_r0_100_a_2605_arkusz.pdf # Arkusz maturalny INF 2026
├── raport_sprzedaz.xlsx          # Przykładowy raport sprzedaży
└── requirements.txt              # Lista pakietów pip (opcjonalna)
```

---

# 🧬 Wersja Pythona

```
Python 3.11
```

---

# 📦 Grupy pakietów instalowane w environment.yml (z opisami)

## Python & Jupyter
- python — interpreter języka Python (wersja 3.11)
- jupyterlab — nowoczesne środowisko pracy dla notebooków
- notebook — klasyczne środowisko Jupyter Notebook
- ipykernel — kernel Pythona dla Jupyter
- ipython — rozszerzona konsola Pythona z autouzupełnianiem

## Autocomplete / LSP
- jedi — silnik autouzupełniania kodu Python
- prompt_toolkit — biblioteka do interaktywnych terminali
- python-lsp-server — serwer języka Python dla edytorów (LSP)
- jupyterlab-lsp — integracja LSP z JupyterLab

## SQL / SQLite
- sqlite — lekka baza danych SQL w jednym pliku
- sqlalchemy — ORM i narzędzia do pracy z bazami SQL
- prettytable — formatowanie tabel w terminalu

## Data science
- pandas — analiza danych w formie tabel (DataFrame)
- numpy — obliczenia numeryczne i operacje na macierzach
- pyarrow — szybkie kolumnowe struktury danych (Apache Arrow)
- polars — ultraszybki DataFrame oparty na Rust
- duckdb — analityczna baza danych typu in-process (jak SQLite dla analityki)

## Excel
- openpyxl — odczyt i zapis plików Excel (xlsx)
- xlsxwriter — szybkie generowanie plików Excel

## Wizualizacja
- matplotlib — podstawowa biblioteka wykresów
- seaborn — statystyczne wykresy oparte na matplotlib
- plotly — interaktywne wykresy i dashboardy
- ipywidgets — interaktywne widżety w notebookach
- altair — deklaratywne wykresy oparte na Vega-Lite
- bokeh — interaktywne wizualizacje webowe
- holoviews — wysoki poziom abstrakcji dla wizualizacji (bokeh/matplotlib)

## Spark
- pyspark — Pythonowy interfejs do Apache Spark (big data)

## Statystyka / ekonometria
- statsmodels — modele statystyczne i ekonometryczne
- scipy — zaawansowane funkcje matematyczne i statystyczne

## Debugger
- xeus-python — kernel Pythona z natywnym debuggingiem
- jupyterlab-debugger — debugger w JupyterLab

## Git
- git — system kontroli wersji
- gitpython — obsługa Git z poziomu Pythona
- nbdime — narzędzia do porównywania notebooków

## JupyterLab extensions
- black — automatyczny formatter kodu Python
- jupyterlab_code_formatter — integracja formatterów z JupyterLab
- jupyterlab_execute_time — czas wykonania komórek
- jupyterlab-system-monitor — monitor zasobów systemowych
- jupyterlab-topbar — pasek narzędzi w JupyterLab

## Utilities
- pyyaml — obsługa plików YAML
- jsonschema — walidacja danych JSON
- rich — kolorowe logi i formatowanie terminala
- orjson — ultraszybki parser JSON
- ruamel.yaml — zaawansowana obsługa YAML

## Pakiety pip-only
- ipython-sql — zapytania SQL bezpośrednio w notebooku
- jupyterlab-git — integracja Git z JupyterLab
- icecream — debugowanie z czytelnym logowaniem
- ipyfilechooser — widżet wyboru plików w notebooku
- findspark — automatyczne wykrywanie instalacji Spark
- dash — framework do tworzenia dashboardów webowych

---

# 🐧 Instalacja środowiska pod Linux

## 1. Nadaj uprawnienia do skryptu

```bash
chmod +x create_env.sh
```

## 2. Uruchom skrypt

```bash
./create_env.sh
```

## Co robi create_env.sh?

- pobiera Minicondę (jeśli nie istnieje),
- instaluje Minicondę lokalnie w `$HOME/programy/miniconda3`,
- akceptuje Terms of Service Condy,
- instaluje Mambę w środowisku base,
- tworzy środowisko z `environment.yml`,
- aktywuje środowisko,
- dodaje kernel do JupyterLab,
- dopisuje automatyczną aktywację `base` do `~/.bashrc`.

## 3. Aktywacja środowiska

```bash
conda activate jupyterlab311
```

---

# 🪟 Instalacja środowiska pod Windows (PowerShell)

## 1. Zezwól na uruchamianie lokalnych skryptów

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 2. Uruchom skrypt instalacyjny

```powershell
cd C:\ścieżka\do\projektu
.\create_env.ps1
```

## Co robi create_env.ps1?

- pobiera Minicondę dla Windows,
- instaluje Minicondę w trybie **JustMe**,
- wykonuje `conda init powershell`,
- ładuje profil PowerShell,
- instaluje Mambę,
- tworzy środowisko z `environment.yml`,
- aktywuje środowisko,
- dodaje kernel do JupyterLab,
- dopisuje automatyczną aktywację `base` do `profile.ps1`.

## 3. Aktywacja środowiska

```powershell
conda activate jupyterlab311
```

---

# 📊 Uruchamianie notebooka

```bash
jupyter lab
```

Notebook `analiza.ipynb` znajduje się w katalogu głównym projektu.

---

# 🔧 Aktualizacja środowiska

```bash
mamba env update --file environment.yml --name jupyterlab311
```

Z czyszczeniem pakietów:

```bash
mamba env update --file environment.yml --name jupyterlab311 --prune
```

---

# 🗑️ Usuwanie środowiska

## Usunięcie środowiska Conda/Mamba

```bash
conda deactivate
conda env remove --name jupyterlab311
```

## Usunięcie kernela z JupyterLab

```bash
jupyter kernelspec uninstall jupyterlab311
```

## Usunięcie Minicondy

### Linux

```bash
rm -rf ~/programy/miniconda3
sed -i '/conda activate base/d' ~/.bashrc
```

### Windows

```powershell
Remove-Item -Recurse -Force "$HOME\miniconda3"
```

Usuń wpis z:

```
%USERPROFILE%\Documents\PowerShell\profile.ps1
```

---

# 📚 Dane maturalne (INF 2026)

Katalog `dane/` zawiera pliki wykorzystywane w zadaniu 8 matury rozszerzonej z informatyki (2026):

- `klienci.txt`
- `opis_transakcji.txt`
- `transakcje.txt`

Pliki PDF i ZIP w repozytorium to materiały pomocnicze z arkusza i zasad oceniania.

---

# 🧩 Dodatkowe informacje

- Miniconda instalowana jest lokalnie (tryb **JustMe** / lokalny katalog),
- Skrypty nie wymagają uprawnień administratora,
- Automatyczna aktywacja środowiska działa tylko w terminalach interaktywnych,
- `environment.yml` zawiera pełne środowisko analityczne (Python 3.11 + JupyterLab + Spark + Pandas + Polars + Plotly + Dash + SQL + Debugger + Git).

