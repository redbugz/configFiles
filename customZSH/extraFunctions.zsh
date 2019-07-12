#! /bin/zsh

# Show current package version
function package_json_info() {
  # Show package version only when repository is a package
  [[ -f package.json ]] || return

  # Grep and cut out package version
  local package_version=$(grep -E '"version": "v?([0-9]+\.){1,}' package.json | cut -d\" -f4 2> /dev/null)

  # Handle version not found
  if [ ! "$package_version" ]; then
    package_version="⚠"
  fi

  echo " ${ZSH_THEME_PACKAGE_SYMBOL} ${package_version}"
}

# Show current bower version
function bower_json_info() {
  # Show bower version only when repository has a bower.json
  [[ -f bower.json ]] || return

  # Grep and cut out bower version
  # Grep -E does not support \d for digits shortcut, should use [:digit:] or [0-9] instead
  local bower_version=$(grep -E '"version": "v?([0-9]+\.){1,}' bower.json | cut -d\" -f4 2> /dev/null)

  # Handle version not found
  if [ ! "$bower_version" ]; then
    bower_version="⚠"
  fi

  echo " ${ZSH_THEME_BOWER_SYMBOL} ${bower_version}"
}
# 
# get the npm version
function npm_prompt_info() {
  [[ -f "$NVM_DIR/nvm.sh" ]] || return
  local npm_prompt
  npm_prompt=$(npm -v 2>/dev/null)
  [[ "${npm_prompt}x" == "x" ]] && return
  echo " ${ZSH_THEME_NPM_PROMPT_PREFIX} ${npm_prompt}"
}

