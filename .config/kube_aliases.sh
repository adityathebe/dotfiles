alias k="kubectl"
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgd='kubectl get deployments'
alias kgy='kubectl get -o yaml'
alias kgpw='kubectl get pods -o wide'

# Get events
kge() {
  kubectl get event --field-selector involvedObject.name=$1
}

# Tail events
kgew() {
  kubectl get event --watch --field-selector involvedObject.name=$1
}

# Get a base64 decoded secret
ksec() {
  kubectl get secret $1 -o json | jq '.data | map_values(@base64d)'
}

klogd() {
	kubectl get pods | grep $1 | grep -i running | cut -d ' ' -f 1 | xargs -n 1 -P 2 kubectl logs -f --tail=200
}

# flux auto completion
. <(flux completion zsh)
