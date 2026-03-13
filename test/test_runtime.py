# SPDX-FileCopyrightText: 2026 Morisetti Alexandre
#
# SPDX-License-Identifier: MIT

from typer.testing import CliRunner

from oberon0_runtime import app

runner = CliRunner()


def test_success_add():
    """Teste le cas nominal : 23 + 19 = 42"""
    result = runner.invoke(app, ["run", "add.wasm", "add", "23", "19"])
    assert result.exit_code == 0
    assert "42" in result.output


def test_error_missing_file():
    """Teste l'échec si le fichier WASM n'existe pas (Erreur gérée par Typer)"""
    result = runner.invoke(app, ["run", "non_existent.wasm", "add", "23", "19"])
    assert result.exit_code != 0
    assert "does not exist" in result.output.lower() or "usage" in result.output.lower()


def test_error_wrong_command():
    """Teste l'échec si la fonction n'existe pas dans le WASM"""
    result = runner.invoke(app, ["run", "add.wasm", "unknown_func", "23", "19"])
    assert result.exit_code != 0
    assert "command 'unknown_func' not found" in result.output
