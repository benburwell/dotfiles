function sheb() {
  # if an address wasn't specified, use the ec2 command to select an instance
  if [[ $# == "0" ]]; then
    1=$(ec2 | fzf --no-multi --prompt="ec2 instance> " | sed 's/ .*//')
    if [[ -z "$1" ]]; then
      return 1
    fi
  fi

  # first add key to agent if necessary
  if [[ ! $(ssh-add -L) ]]; then
    ssh-add -K ~/.ssh/id_rsa
  fi

  if [[ $(echo "$1" | grep "@") ]]; then
    # If a username was provided, use it
    ssh -J virtyx -t "$1" "sudo su -"
  else
    # Otherwise, assume username is "ec2-user"
    ssh -J virtyx -t "ec2-user@$1" "sudo su -"
  fi
}
