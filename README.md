# Terminal Alias Toolkit

A portable, documented starter set of terminal aliases for **Bash and Zsh**,
focused on Linux, Git, Python, Go, cloud CLI workflows, Docker, Kubernetes,
system troubleshooting, file management, and Ruach.

## Files

- `setup_terminal_aliases.sh` — repeatable installer.
- `aliases.sh` — complete standalone alias catalogue.
- `aliases.md` — searchable human-readable reference.

## Install

Keep all three files in the same directory. In a terminal, navigate to that
directory and run:

```bash
chmod +x setup_terminal_aliases.sh
./setup_terminal_aliases.sh
```

Reload the shell you use:

```bash
source ~/.bashrc   # Bash
source ~/.zshrc    # Zsh
```

The installer stores aliases at:

```text
~/.config/terminal-toolkit/aliases.sh
```

If `XDG_CONFIG_HOME` is set, it uses `$XDG_CONFIG_HOME/terminal-toolkit/aliases.sh`.

## Verify

```bash
alias
alias gs
gs
ll
pyver
gov
```

Some aliases require tools or setup that may not be present on every machine:
`aws`, `docker`, `kubectl`, and `ruach`. The aliases do not install those tools,
authenticate you, or select a Kubernetes context.

## Add your own aliases

Edit the central file:

```bash
nano ~/.config/terminal-toolkit/aliases.sh
```

Example:

```bash
alias cprojects='cd "$HOME/projects"'
```

Then reload your shell configuration.

## Safety and idempotence

- The installer is designed to be safe to re-run.
- Before editing an existing alias file or shell rc file, it creates a timestamped
  backup beside that file.
- If an alias file already exists, it preserves its contents and appends the
  toolkit block only if that block is not already present.
- It does not replace existing shell configuration.
- File-operation aliases use interactive prompts (`cp -i`, `mv -i`, `rm -I`)
  to reduce accidental overwrites/deletions. Be especially careful with `rmv`.
- `dstopall` stops all currently running Docker containers. Use it intentionally.
- `kdel` deletes Kubernetes resources described by the supplied file. Review the
  target context and file before using it.
- `kns` changes the current Kubernetes context's namespace.

## Notes

Aliases are best for short command substitutions. For complex workflows,
prefer scripts or shell functions with clear argument handling.
