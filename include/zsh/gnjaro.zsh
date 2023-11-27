PATH="$PATH:/home/greenchild/.cargo/bin:/home/greenchild/.local/bin"

precmd() {
  PS1="%B%F{blue}$(echo '\n┌─(') %f%b%F{cyan}$(print_branch)%B%F{blue} ) %f%b%F{ctab}%n%f%B%F{blue} :: %f%b%~%B%F{blue}$(echo '\n└>>') %f%b"
}

print_branch() {
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n $branch ]]; then
    echo $branch
  else
    echo "null"
  fi
}

PS1="%B%F{blue}$(echo '\n┌─(') %f%b%F{cyan}$(print_branch)%B%F{blue} ) %f%b%F{cyan}%n%f%B%F{blue} :: %f%b%~%B%F{blue}$(echo '\n└>>') %f%b"

