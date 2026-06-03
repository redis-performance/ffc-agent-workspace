---
name: intel-lab-access
description: How to reach the Intel lab fleet non-interactively (passwordless via shark password)
metadata:
  type: reference
---

Intel lab fleet (the "4 runners" + more) is reachable **non-interactively** via
`scripts/intelx.sh <node> '<remote cmd>'`. Stdin is forwarded, so deploy with
`tar czf - files | scripts/intelx.sh gnr1 'tar xzf -; ...'`.

**Auth chain** (all hops automated, no manual typing):
- gateway `guest@146.152.205.52` — key `~/.ssh/id_ssh_github` (passphraseless)
- bastion `sdp@192.168.2.2` — **password** (the "shark one"), injected by
  `/tmp/clx2-proxy.sh` (ProxyCommand; uses sshpass internally)
- target `root@<node>` — **same password**, fed by a second `sshpass -e` in
  intelx.sh with `PubkeyAuthentication=no` (targets reject the key)

The password is NEVER stored in the repo: `intelx.sh` reads it from `$FFC_LAB_PW`
or `~/.ffc-lab-pw` (0600, outside the repo). Create that file once per machine.

Key gotcha: `DISPLAY=:0` makes ssh spawn a GUI askpass for any password prompt
and hang — intelx.sh sets `env -u DISPLAY SSH_ASKPASS_REQUIRE=never`. Also
`sshpass` cannot intercept a `-J`/ProxyJump bastion prompt (nested fd); that's
why the bastion goes through the `/tmp/clx2-proxy.sh` ProxyCommand instead.

**Node map** (all root login): clx1=192.168.2.8, clx2=.10, icx2=.6, spr=.18,
gnr1=.28. Cores: clx1/clx2=80, icx2=144, spr=256, gnr1=384. Only clx1 has clang;
others gcc 11. bashrc aliases: `intelssh-clx1/clx2/spr/gnr1` (added spr+gnr1),
`intelssh-icx1..6`.

ARM Graviton4 (separate, unaffected by this): `ubuntu@3.92.205.222` via
`~/.ssh/benchmarksredislabsus-east-1.pem`; aarch64, 96c, clang 18.1.3 + gcc 13.3.
This is the only box that exercises the `__aarch64__ && __clang__` paths.

Heavy runs (exhaustive, benchmarks) go here, never local — see [[no-heavy-tests-local]].
