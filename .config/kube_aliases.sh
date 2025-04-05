alias k='kubecolor'
alias kubectl='kubecolor'
alias kg='kubectl get'
alias kgp='kubectl get pods --sort-by="{.metadata.name}"'
alias kgpw='kubectl get pods -o wide --sort-by="{.metadata.name}"'
alias kgd='kubectl get deployments'
alias kgy='kubectl get -o yaml'
alias keti='kubectl exec -it'

# List all pods with the resources
kgpr() {
  kubectl get pods "$@" -o custom-columns='NAME:.metadata.name,MEMORY_REQUEST:.spec.containers[*].resources.requests.memory,MEMORY_LIMIT:.spec.containers[*].resources.limits.memory,CPU_REQUEST:.spec.containers[*].resources.requests.cpu,CPU_LIMIT:.spec.containers[*].resources.limits.cpu' --sort-by='.spec.containers[*].resources.limits.memory'
}

# List all pods and the container
kgpc() {
  kubectl get pods "$@" -o custom-columns='NAME:metadata.name,CONTAINERS:spec.containers[*].name' | sed 's/,*$//' | column -t
}

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

# auto completions
eval "$(flux completion zsh)"
eval "$(helm completion zsh)"

# make completion work with kubecolor
compdef kubecolor=kubectl
