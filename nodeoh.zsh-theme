# Depends on the git plugin for work_in_progress()

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔%{$reset_color%}"

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Node check
node_prompt_info() {
  if check_node="$(type -p "node")" || [ -z "$check_node" ]; then
    if [ -f "package.json" ]; then 
      echo "$ZSH_THEME_NODE_PROMPT_PREFIX"node"~$(node -v)$ZSH_THEME_NODE_PROMPT_SUFFIX"
    fi
  fi
}

# NODE component of prompt
ZSH_THEME_NODE_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_NODE_PROMPT_SUFFIX="]%{$reset_color%}"

# Combine it all into a final right-side prompt
# RPS1='$(git_custom_status)$(ruby_prompt_info) $EPS1'
RPS1='$(git_custom_status)$(node_prompt_info) $EPS1'

PROMPT='%{$fg[cyan]%}%n[%1d% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
