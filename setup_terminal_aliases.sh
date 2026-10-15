#!/usr/bin/env bash
# Terminal Alias Toolkit installer for Bash and Zsh.
# Safe to re-run: backs up files before edits, keeps existing custom aliases,
# and adds a managed alias block only once.

set -Eeuo pipefail

CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
TOOLKIT_DIR="$CONFIG_HOME/terminal-toolkit"
ALIASES_FILE="$TOOLKIT_DIR/aliases.sh"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE="$SCRIPT_DIR/aliases.sh"

backup_file() {
    local file="$1"
    [[ -f "$file" ]] || return 0
    local backup="${file}.backup.$(date +%Y%m%d-%H%M%S)"
    cp -p -- "$file" "$backup"
    printf 'Backup: %s\n' "$backup"
}

mkdir -p "$TOOLKIT_DIR"

if [[ ! -f "$TEMPLATE" ]]; then
    printf 'Error: aliases.sh template was not found beside this installer.\n' >&2
    printf 'Keep setup_terminal_aliases.sh and aliases.sh in the same directory.\n' >&2
    exit 1
fi

if [[ ! -f "$ALIASES_FILE" ]]; then
    install -m 0644 "$TEMPLATE" "$ALIASES_FILE"
    printf 'Installed aliases: %s\n' "$ALIASES_FILE"
else
    # Preserve the user's existing file. Add the toolkit aliases only if this
    # installer has not already added them. Existing names are not overwritten:
    # aliases defined later in the file retain normal shell precedence.
    if ! grep -Fq '# BEGIN TERMINAL ALIAS TOOLKIT MANAGED BLOCK' "$ALIASES_FILE"; then
        backup_file "$ALIASES_FILE"
        {
            printf '\n# BEGIN TERMINAL ALIAS TOOLKIT MANAGED BLOCK\n'
            # Strip the template's explanatory header before appending its aliases.
            sed '1,3d' "$TEMPLATE"
            printf '# END TERMINAL ALIAS TOOLKIT MANAGED BLOCK\n'
        } >> "$ALIASES_FILE"
        printf 'Added toolkit aliases to existing file without deleting its contents.\n'
    else
        printf 'Toolkit alias block already exists; leaving it unchanged.\n'
    fi
fi

add_loader() {
    local rc="$1"
    local source_line='[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/terminal-toolkit/aliases.sh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/terminal-toolkit/aliases.sh"'
    touch "$rc"
    if ! grep -Fq 'terminal-toolkit/aliases.sh' "$rc"; then
        backup_file "$rc"
        {
            printf '\n# Load Terminal Alias Toolkit\n'
            printf '%s\n' "$source_line"
        } >> "$rc"
        printf 'Added loader to %s\n' "$rc"
    else
        printf 'Loader already present in %s\n' "$rc"
    fi
}

# Configure whichever shells are present; don't create unused shell config files.
if [[ -n "${BASH_VERSION:-}" || -f "$HOME/.bashrc" ]]; then
    add_loader "$HOME/.bashrc"
fi
if [[ -n "${ZSH_VERSION:-}" || -f "$HOME/.zshrc" ]]; then
    add_loader "$HOME/.zshrc"
fi

printf '\nSetup finished.\n'
printf 'Aliases file: %s\n' "$ALIASES_FILE"
printf 'Reload Bash with: source ~/.bashrc\n'
printf 'Reload Zsh with:  source ~/.zshrc\n'
printf 'Check aliases with: alias\n'
printf 'Check one alias with: alias gs\n'
