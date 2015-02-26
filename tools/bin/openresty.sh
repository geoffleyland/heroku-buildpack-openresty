#!/bin/sh

DEFAULT_CONF=nginx.conf
DEFAULT_ROOT="$(pwd)"

CONF="${1:-$DEFAULT_CONF}"
ROOT="${2:-$DEFAULT_ROOT}"

OUT_CONF="$CONF.compiled"

cd "$ROOT"
cat "$CONF" | $HOME/tools/template.lua > "$OUT_CONF"
nginx -p "$ROOT" -c "$OUT_CONF"
