#!/bin/sh

# Start nginx.  The only reason we don't do this directly is because we
# have to replace template variables in the conf file.
# (see tools/template.lua)

DEFAULT_CONF=nginx.conf
DEFAULT_ROOT="$(pwd)"
TOOLS=`dirname \`dirname $0\``

CONF="${1:-$DEFAULT_CONF}"
ROOT="${2:-$DEFAULT_ROOT}"

OUT_CONF="$CONF.compiled"

cd "$ROOT"
cat "$CONF" | $TOOLS/template.lua > "$OUT_CONF"
nginx -p "$ROOT" -c "$OUT_CONF"
