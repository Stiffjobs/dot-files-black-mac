#!/bin/sh
# Launched by cmux for every new terminal surface (ghostty/config `command`).
#
# One tmux session per cmux workspace, named ws-<workspace id>. Extra surfaces
# (splits) opened in the same workspace join that session as a grouped session
# with their own window, so nothing is mirrored and workspaces never share a
# session. Sessions die when their last cmux surface closes instead of piling
# up detached.
TMUX_BIN=/opt/homebrew/bin/tmux
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

id=${CMUX_WORKSPACE_ID:-$$}
ws="ws-${id%%-*}"

if "$TMUX_BIN" has-session -t "=$ws" 2>/dev/null; then
  name="$ws-$$"
  exec "$TMUX_BIN" new-session -t "$ws" -s "$name" \
    \; new-window -t "$name:" -c "$PWD" \
    \; set-option -t "$name:" destroy-unattached on
fi
exec "$TMUX_BIN" new-session -s "$ws" -c "$PWD" \
  \; set-option -t "$ws:" destroy-unattached on
