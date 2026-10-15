# Terminal Alias Toolkit
# Shared aliases compatible with Bash and Zsh.
# Edit this file to add your own aliases. Reload with: source ~/.bashrc
# or: source ~/.zshrc

# ── Navigation ──────────────────────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias croot='cd /'
alias home='cd ~'

# ── File management ────────────────────────────────────────────────────────
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'
alias grep='grep --color=auto'
alias dus='du -sh ./* 2>/dev/null'
alias dfh='df -h'
alias cpr='cp -iv'
alias mvr='mv -iv'
alias rmv='rm -Iv'

# ── Git ────────────────────────────────────────────────────────────────────
alias gs='git status --short --branch'
alias gss='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --decorate -10'
alias gla='git log --oneline --decorate --graph --all -20'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch'
alias gco='git checkout'
alias gsw='git switch'
alias gnew='git switch -c'
alias gstash='git stash'
alias gpop='git stash pop'

# ── Python ─────────────────────────────────────────────────────────────────
alias py='python3'
alias pyver='python3 --version'
alias pip='python3 -m pip'
alias venv='python3 -m venv .venv'
alias activate='source .venv/bin/activate'
alias deactivate-venv='deactivate'
alias pipup='python3 -m pip install --upgrade pip'
alias pycompile='python3 -m compileall .'

# ── Go ─────────────────────────────────────────────────────────────────────
alias gov='go version'
alias gob='go build ./...'
alias got='go test ./...'
alias gotv='go test -v ./...'
alias gor='go run .'
alias gom='go mod tidy'
alias gofmtall='gofmt -w .'
alias govet='go vet ./...'

# ── Cloud / AWS CLI ────────────────────────────────────────────────────────
alias awsv='aws --version'
alias awswho='aws sts get-caller-identity'
alias awsprofiles='aws configure list-profiles'
# These aliases require the relevant CLIs and a configured context/credentials.
alias kctx='kubectl config current-context'
alias kns='kubectl config set-context --current --namespace'
alias kpods='kubectl get pods'
alias ksvc='kubectl get services'
alias kdep='kubectl get deployments'

# ── Docker ─────────────────────────────────────────────────────────────────
alias dps='docker ps'
alias dpa='docker ps -a'
alias di='docker images'
alias dlogs='docker logs'
alias dexec='docker exec -it'
alias dstopall='docker stop $(docker ps -q)'
alias dclean='docker system df'

# ── Kubernetes ────────────────────────────────────────────────────────────
alias k='kubectl'
alias kgp='kubectl get pods'
alias kga='kubectl get all'
alias kgn='kubectl get nodes'
alias kdesc='kubectl describe'
alias klogs='kubectl logs'
alias kapply='kubectl apply -f'
alias kdel='kubectl delete -f'

# ── System troubleshooting ─────────────────────────────────────────────────
alias meminfo='free -h'
alias diskfree='df -h'
alias cpuinfo='lscpu'
alias kernel='uname -a'
alias listening='ss -tulpn'
alias myip='hostname -I'
alias pathlist='printf "%s\n" "${PATH//:/\\n}"'
alias reloadbash='source ~/.bashrc'
alias reloadzsh='source ~/.zshrc'

# ── Ruach ──────────────────────────────────────────────────────────────────
# These assume the `ruach` CLI is installed and on PATH.
alias ruachv='ruach version'
alias ruachws='ruach workspace discover'
# Optional: set your actual repository path, then uncomment the next line.
# alias cdr='cd "$HOME/path/to/ruach"'
