autoload colors && colors

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_state() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "%{$fg[green]%}•%{$reset_color%}"
    else
      echo "%{$fg[red]%}✗%{$reset_color%}"
    fi
  fi
}
git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}
git_dir() {
  echo $(basename `git rev-parse --show-toplevel`)
}
git_prefix() {
  echo "git:"
}
git_prompt() {
  ref=$($git symbolic-ref HEAD 2>/dev/null) || return
  echo "%{$fg[yellow]%}[%{$fg[cyan]%}$(git_dir) $(git_prefix)($(git_branch))$(git_state)%{$fg[yellow]%}]%{$reset_color%}"
}
directory_name() {
  echo "%{$fg[blue]%}%1/%{$reset_color%}"
}

export PROMPT=$'$(directory_name)$(git_prompt)%{$fg[yellow]%}➜%{$reset_color%} '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
