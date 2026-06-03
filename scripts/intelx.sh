#!/usr/bin/env bash
# Non-interactive runner for the Intel lab fleet (passwordless via the shark
# password fed to sshpass). Chains: gateway guest@146.152.205.52 (key) ->
# bastion sdp@192.168.2.2 (shark pw, via /tmp/clx2-proxy.sh) -> root@<node> (shark pw).
#
#   scripts/intelx.sh <node> '<remote command>'        # run a command
#   scripts/intelx.sh <node> --put <localfile>          # stream a file to ~/ on node
#   tar czf - a b | scripts/intelx.sh <node> 'tar xzf -; ...'   # stdin is forwarded
#
# nodes: clx1 clx2 icx2 spr gnr1   (root login on all)
set -u
# Lab password (the "shark one") is read from the environment or a 0600 file
# OUTSIDE the repo — never hardcoded/committed. Set FFC_LAB_PW or ~/.ffc-lab-pw.
PW="${FFC_LAB_PW:-$(cat ~/.ffc-lab-pw 2>/dev/null)}"
[ -n "$PW" ] || { echo "ERR: lab password not set (export FFC_LAB_PW or create ~/.ffc-lab-pw)" >&2; exit 4; }
PROXY="${CLX2_PROXY:-/tmp/clx2-proxy.sh}"
declare -A NODE=( [clx1]=192.168.2.8 [clx2]=192.168.2.10 [icx1]=192.168.2.4 \
  [icx2]=192.168.2.6 [icx3]=192.168.2.12 [spr]=192.168.2.18 [gnr1]=192.168.2.28 )

node="${1:?usage: intelx.sh <node> <cmd>}"; shift
ip="${NODE[$node]:-$node}"   # allow raw IP too
[ -x "$PROXY" ] || { echo "ERR: bastion proxy $PROXY missing/!exec" >&2; exit 3; }

exec env -u DISPLAY SSH_ASKPASS_REQUIRE=never SSHPASS="$PW" \
  sshpass -e ssh -o ConnectTimeout=15 \
    -o PreferredAuthentications=password -o PubkeyAuthentication=no \
    -o StrictHostKeyChecking=accept-new -o LogLevel=ERROR \
    -o ProxyCommand="$PROXY %h %p" \
    root@"$ip" "$@"
