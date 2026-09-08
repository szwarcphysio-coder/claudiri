#!/bin/bash
# Podpisuje kazdy wariant z zrodlo/*.xml do gotowego pliku .shortcut w katalogu repo.
# macOS z aplikacja Skroty. Rozszerzenie pliku wejsciowego musi byc .shortcut,
# bo `shortcuts sign` waliduje po rozszerzeniu, nie po zawartosci.
set -euo pipefail
cd "$(dirname "$0")"

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

for XML in zrodlo/*.xml; do
  NAZWA=$(basename "$XML" .xml)
  plutil -lint "$XML" >/dev/null
  cp "$XML" "$TMP/$NAZWA.shortcut"
  shortcuts sign -m anyone -i "$TMP/$NAZWA.shortcut" -o "$NAZWA.shortcut"
  echo "gotowe: $NAZWA.shortcut ($(wc -c < "$NAZWA.shortcut" | tr -d ' ') B)"
done
