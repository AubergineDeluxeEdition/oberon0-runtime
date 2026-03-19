# Oberon-0 Runtime

[![CI](https://github.com/AubergineDeluxeEdition/oberon0-runtime/actions/workflows/ci.yml/badge.svg)](https://github.com/AubergineDeluxeEdition/oberon0-runtime/actions)
[![Documentation](https://img.shields.io/badge/docs-GitHub%20Pages-blue.svg)](https://auberginedeluxeedition.github.io/oberon0-runtime/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![REUSE status](https://api.reuse.software/badge/github.com/AubergineDeluxeEdition/oberon0-runtime)](https://api.reuse.software/info/github.com/AubergineDeluxeEdition/oberon0-runtime)

Ce projet implémente un **runtime** en Python pour le langage **Oberon-0**. Il permet d'exécuter des modules compilés au format WebAssembly (WASM) en leur fournissant les fonctions système nécessaires (I/O).

## 📖 Documentation

La documentation complète du projet, générée à partir des *docstrings* du code source, est disponible en ligne :

👉 **[Consulter la documentation technique](https://auberginedeluxeedition.github.io/oberon0-runtime/)**

## 🚀 Fonctionnalités

* **Exécution WASM** : Charge et exécute des fichiers `.wasm` via `wasmtime`.
* **Interface CLI** : Utilise `typer` pour une expérience en ligne de commande intuitive.
* **Fonctions Système** : Implémente `ReadInt`, `WriteInt`, `WriteChar`, `WriteLn`, etc.
* **Gestion des entrées** : Passage d'arguments numériques directement via la ligne de commande.
* **Validation du code** : Entièrement vérifié par `Ruff`, `MyPy` et `Pyright`.

## 📦 Installation

Ce projet utilise [uv](https://github.com/astral-sh/uv) pour la gestion des dépendances.

1.  Clonez le dépôt :
    ```bash
    git clone https://github.com/AubergineDeluxeEdition/oberon0-runtime.git
    cd oberon0-runtime
    ```

2.  Installez les dépendances et créez l'environnement virtuel :
    ```bash
    uv sync
    ```

3.  (Optionnel) Installez l'outil globalement sur votre machine :
    ```bash
    uv tool install .
    ```

## 🛠️ Utilisation

### Afficher les commandes disponibles dans un fichier WASM
```bash
uv run oberon0-rt info add.wasm
```

### Exécuter une fonction (ex: additionner 23 et 19)
```bash
uv run oberon0-rt run add.wasm add 23 19
```

### Mode Debug
Pour voir le détail des appels système (logs) :
```bash
uv run oberon0-rt run add.wasm add 23 19 --debug
```

## 🧪 Développement

### Tests unitaires
Les tests sont gérés par `pytest` et simulent les entrées/sorties :
```bash
uv run pytest
```

### Qualité du code (Linting & Formatage)
```bash
uv run ruff check .
uv run ruff format .
```

### Mise à jour de la doc
La documentation est automatiquement déployée via GitHub Actions lors d'un push sur `main`. Pour la générer localement :
```bash
uv run sphinx-build -b html docs/source public
```

## ⚖️ Licence

Ce projet est sous licence **MIT**. La conformité aux licences est gérée selon le standard [REUSE](https://reuse.software/).

```text
SPDX-FileCopyrightText: 2026 Morisetti Alexandre
SPDX-License-Identifier: MIT
```
