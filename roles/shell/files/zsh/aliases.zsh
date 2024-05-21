#!/opt/homebrew/bin/zsh
# -- STATUS REPORT -- #
filename=$(basename "$0")
echo -e "${I_OK}$filename sourced"
# -- BUILTIN -- #
alias cl="clear"
alias mf="touch"
alias md="mkdir"
alias gr="grep"
alias sr="source"
alias ns="netstat"
# -- MODULES -- #
alias nv="nvim"
alias br="brew"
alias py="python"
alias po="poetry"
alias pm="podman"
alias lg="lazygit"
alias pn="pnpm"
alias td='nvim +"Telekasten goto_today"'
alias nt='nvim +"Telekasten panel"'
alias ff="fastfetch"
alias fz="fzf"
alias ct="bat"
alias xc="pbcopy"
alias xp="pbpaste"
alias pg="nvimpager"
alias an="ansible"
alias tf="terraform"
alias pw="pwsh"
# -- DROP IN REPLACEMENTS -- #
alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias python3="python"
alias pip3="pip"
alias ssh="ssh -A"
alias docker="podman"
