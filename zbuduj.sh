#!/bin/bash
# Podpisuje zrodlo/Claudiri.xml do gotowego Claudiri.shortcut.
# macOS z aplikacja Skroty. Rozszerzenie pliku wejsciowego musi byc .shortcut,
# bo `shortcuts sign` waliduje po rozszerzeniu, nie po zawartosci.
set -euo pipefail
cd "$(dirname "$0")"

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

plutil -lint zrodlo/Claudiri.xml >/dev/null
cp zrodlo/Claudiri.xml "$TMP/Claudiri.shortcut"
shortcuts sign -m anyone -i "$TMP/Claudiri.shortcut" -o Claudiri.shortcut

echo "gotowe: Claudiri.shortcut ($(wc -c < Claudiri.shortcut | tr -d ' ') B)"
