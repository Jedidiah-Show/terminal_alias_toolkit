# Terminal Alias Catalogue

This is the human-readable guide to the aliases in `aliases.sh`.

## Navigation and file management

| Alias | Equivalent / purpose | Notes |
|---|---|---|
| `..` / `...` / `....` | Move up 1 / 2 / 3 directories | Quick navigation |
| `home` | `cd ~` | Go to home directory |
| `croot` | `cd /` | Go to filesystem root |
| `ll` | `ls -alF` | Detailed listing, including hidden files |
| `la` | `ls -A` | Include hidden entries except `.` and `..` |
| `l` | `ls -CF` | Compact listing |
| `dus` | `du -sh ./*` | Approximate sizes of visible items in current directory |
| `dfh` / `diskfree` | `df -h` | Filesystem space |
| `cpr` | `cp -iv` | Copy with prompt and verbose output |
| `mvr` | `mv -iv` | Move/rename with prompt and verbose output |
| `rmv` | `rm -Iv` | Prompt before removing more than three files or recursively |

## Git

| Alias | Equivalent / purpose |
|---|---|
| `gs` | `git status --short --branch` |
| `gss` | `git status` |
| `ga` / `gaa` | `git add` / `git add --all` |
| `gc` / `gcm` | `git commit` / `git commit -m` |
| `gp` / `gpl` | `git push` / `git pull` |
| `gl` | Recent compact commit history |
| `gla` | Compact graph of all branches |
| `gd` / `gds` | Working-tree diff / staged diff |
| `gb` | List branches |
| `gco` / `gsw` | Checkout / switch branches |
| `gnew` | Create and switch to a new branch |
| `gstash` / `gpop` | Stash changes / restore latest stash |

## Python

| Alias | Purpose | Notes |
|---|---|---|
| `py` | Run `python3` | Python 3 |
| `pyver` | Print Python version | |
| `pip` | Run `python3 -m pip` | Keeps pip associated with Python 3 |
| `venv` | Create `.venv` in current directory | Run once per project |
| `activate` | Activate `.venv` | Run from project root |
| `deactivate-venv` | Run `deactivate` | Requires an active venv |
| `pipup` | Upgrade pip | Prefer inside a virtual environment |
| `pycompile` | Compile Python files under current directory | |

## Go

| Alias | Purpose |
|---|---|
| `gov` | Go version |
| `gob` | Build packages in the current module |
| `got` / `gotv` | Run tests / verbose tests |
| `gor` | Run the current package |
| `gom` | Run `go mod tidy` |
| `gofmtall` | Format Go files under current directory |
| `govet` | Run `go vet ./...` |

## Cloud and Kubernetes

| Alias | Purpose | Requirement |
|---|---|---|
| `awsv` | AWS CLI version | AWS CLI |
| `awswho` | Show AWS caller identity | Configured credentials |
| `awsprofiles` | List AWS CLI profiles | AWS CLI |
| `kctx` | Show current Kubernetes context | `kubectl` and kubeconfig |
| `kns NAME` | Set current context namespace | `kubectl` |
| `k`, `kgp`, `kga`, `kgn` | Common Kubernetes get commands | `kubectl` |
| `kdesc RESOURCE` | Describe a resource | `kubectl` |
| `klogs POD` | Read pod logs | `kubectl` |
| `kapply FILE` | Apply a manifest | Check cluster/context first |
| `kdel FILE` | Delete resources from a manifest | Destructive; review first |

## Docker

| Alias | Purpose | Caution |
|---|---|---|
| `dps` / `dpa` | Running containers / all containers | |
| `di` | List images | |
| `dlogs CONTAINER` | View logs | |
| `dexec CONTAINER COMMAND` | Execute in a running container | |
| `dclean` | Show Docker disk usage | Does not clean anything |
| `dstopall` | Stop every running container | Stops all containers; use intentionally |

## System troubleshooting

| Alias | Purpose |
|---|---|
| `meminfo` | Memory summary (`free -h`) |
| `cpuinfo` | CPU information (`lscpu`) |
| `kernel` | Kernel and system details (`uname -a`) |
| `listening` | Listening sockets (`ss -tulpn`) |
| `myip` | Local IP addresses (`hostname -I`) |
| `pathlist` | Print PATH entries one per line |
| `reloadbash` / `reloadzsh` | Reload shell configuration |

## Ruach

| Alias | Purpose | Requirement |
|---|---|---|
| `ruachv` | `ruach version` | Ruach CLI on `PATH` |
| `ruachws` | `ruach workspace discover` | Ruach CLI on `PATH` |
| `cdr` | Optional project-directory shortcut | Edit the example path and uncomment |

## General tips

- Inspect an alias with `alias NAME`.
- Find commands with `command -v COMMAND`.
- Remove an alias for the current shell session with `unalias NAME`.
- Aliases generally do not accept named parameters; use them for simple shortcuts.
- Before using cloud or Kubernetes commands, verify the identity/account and active context.
