#!/opt/homebrew/bin/zsh
# -- STATUS REPORT -- #
filename=$(basename "$0")
echo -e "${I_OK}$filename"

# print border
print "${G_BORDER}"

# -- CHECK SERVICES -- #
# SKHD 
if pgrep -f skhd >/dev/null; then
    print "${I_OK}skhd service"
else
    print "${I_ERR}skhd service"
fi
# YABAI 
if pgrep -f yabai >/dev/null; then
    print "${I_OK}yabai service"
else
    print "${I_ERR}yabai service"
fi

# BORDERS 
if pgrep -f borders >/dev/null; then
    print "${I_OK}borders service"
else
    print "${I_ERR}borders service"
fi

# SSH-AGENT 
if pgrep -u "$USER" ssh-agent > /dev/null; then
  print "${I_OK}ssh-agent"
else
  eval "$(ssh-agent -s)"
  print "${I_RUN}ssh-agent"
fi

# print border
print "$G_BORDER"

# -- CHECK ENVIRONMENT VARIABLES -- #
if [[ -z "${HOME}" ]]; then # HOME
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: HOME"
fi
# xdg variables
if [[ -z "${XDG_CONFIG_HOME}" ]]; then # XDG_CONFIG_HOME
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: XDG_CONFIG_HOME"
fi
if [[ -z "${XDG_DATA_HOME}" ]]; then # XDG_DATA_HOME
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: XDG_DATA_HOME"
fi
if [[ -z "${XDG_STATE_HOME}" ]]; then
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: XDG_STATE_HOME"
fi
if [[ -z "${XDG_CACHE_HOME}" ]]; then # XDG_CACHE_HOME
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: XDG_CACHE_HOME"
fi
# custom directory variables
if [[ -z "${NAS_DIR}" ]]; then # NAS_DIR
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: NAS_DIR"
fi
if [[ -z "${DEV_DIR}" ]]; then # DEV_DIR
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: DEV_DIR"
fi
if [[ -z "${GITHUB_DIR}" ]]; then # GITHUB_DIR
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: GITHUB_DIR"
fi
if [[ -z "${NOTES_DIR}" ]]; then # NOTES_DIR
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: NOTES_DIR"
fi
if [[ -z "${ZSH_DIR}" ]]; then # ZSH_DIR
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: ZSH_DIR"
fi
if [[ -z "${BASH_DIR}" ]]; then # BASH_DIR
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: BASH_DIR"
fi
if [[ -z "${CRYPT_DIR}" ]]; then # CRYPT_DIR
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: CRYPT_DIR"
fi
if [[ -z "${CRIT_DIR}" ]]; then # CRIT_DIR
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: CRIT_DIR"
fi
# setting environment variables
if [[ -z "${GPG_TTY}" ]]; then # GPG_TTY
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: GPG_TTY"
fi
if [[ -z "${GNUPGHOME}" ]]; then # GNUPGHOME
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: GNUPGHOME"
fi
if [[ -z "${PNPM_HOME}" ]]; then # PNPM_HOME
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: PNPM_HOME"
fi
if [[ -z "${STARSHIP_CONFIG}" ]]; then # STARSHIP_CONFIG
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: STARSHIP_CONFIG"
fi
if [[ -z "${EDITOR}" ]]; then # EDITOR
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: EDITOR"
fi
if [[ -z "${BROWSER}" ]]; then # BROWSER
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: BROWSER"
fi
if [[ -z "${ANSIBLE_VAULT_SECRET}" ]]; then # ANSIBLE_VAULT_SECRET
  echo -e "${I_ERR}SET ENVIRONMENT VARIABLE: ANSIBLE_VAULT_SECRET"
fi
# check zsh config dir
if [[ ! -d "$ZSH_DIR" ]]; then
  echo -e "${I_ERR}zsh config directory not found: $ZSH_DIR"
fi
# check bash config dir
if [[ ! -d "$BASH_DIR" ]]; then
  echo -e "${I_ERR}bash config directory not found: $BASH_DIR"
fi

if [[ "$SHELL" =~ "zsh" ]]; then
  echo -e "${I_INFO}SHELL  ZSH"
elif [[ "$SHELL" =~ "bash" ]]; then
  echo -e "${I_INFO}SHELL : BASH"
else
  echo -e "${I_ERR}UNKNOWN SHELL TYPE : $SHELL"
  echo -e "${I_INFO}only bash & zsh supported : $SHELL"
fi
