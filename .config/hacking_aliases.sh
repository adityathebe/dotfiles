source ~/.config/secrets

#########
# TOOLS #
#########
alias ffuf='ffuf -c -ic'
alias tplmap='python2 ~/hacking/tools/tplmap/tplmap.py'
alias smuggler='python ~/hacking/tools/smuggler/smuggler.py'
alias dirsearch='ffuf -w /home/gunners/hacking/wordlists/dirsearch.txt -u'
alias rustscan='docker container run --rm -e RUST_BACKTRACE=1 rustscan/rustscan:2.0.0'
alias linkfinder='~/hacking/tools/LinkFinder/.venv/bin/python ~/hacking/tools/LinkFinder/linkfinder.py'
alias gitpillage='~/hacking/tools/gitpillage/gitpillage.sh'
alias github-dork.py='~/hacking/tools/github-dorks/.venv/bin/python ~/hacking/tools/github-dorks/github-dork.py -d ~/hacking/tools/github-dorks/github-dorks.txt'
alias gitdorker='/home/gunners/hacking/tools/GitDorker/.venv/bin/python /home/gunners/hacking/tools/GitDorker/GitDorker.py -t $GH_TOKEN -d /home/gunners/hacking/tools/GitDorker/Dorks/alldorksv3'

# NMAP
alias nmap_open_ports="nmap --open"
alias nmap_fast_all_ports="nmap -sV -sC -O -T4 -n -Pn -p- -oA fullfastscan"
alias nmap_fast_1000_tcp="nmap -sV -sC -O -T4 -n -Pn -oA fastscan"

#########
# AMASS #
#########
am() {
  amass enum -passive -noalts -d $1
}

am-active() {
  target_dir="/home/gunners/hacking/targets/$1"
  mkdir -p $target_dir

  amass enum -active \
    -v \
    -ip \
    -src \
    -d $1 \
    -config '/home/gunners/.config/amass/config.ini' \
    -dir "$target_dir/amass"
}

am-domains() {
  find . -name 'amass.json' | xargs cat | jq -crM ".name" | sort -u
}

am-ips() {
  find . -name 'amass.json' | xargs cat | jq -crM ".addresses[] .ip" | sort -u
}
#########################################################

af() {
  assetfinder -subs-only $1 | grep --color=never "\.$1$"
}

gen_num() {
  # Generate numbers in a given range with 0 padding
  seq -f "%0$3g" $1 $2
}

# whois() {
#   curl -s https://rdap.verisign.com/com/v1/domain/$1 | jq
# }

crtsh() {
  curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u
}

certspotter() {
  curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
}

checkdomain() {
  x=$(curl -s -L https://rtb.namecheapapi.com/api/picks/$1 | jq '.picks[]' | jq -crM "select(.domain == \"$1\")")
  if [[ -n "$x" ]]; then
    echo "✅[Available] $1"
  else
    echo "❌[Unavailable] $1"
  fi
}

checknxdomain() {
  # prints out nxdomains
  while read -r line; do
    x=$(dig $line)
    if [[ $x == *NXDOMAIN* ]]; then
      echo $line
    fi
  done
}

filternxdomain() {
  # prints out non nxdomains
  while read -r line; do
    x=$(dig $line)
    if [[ $x != *NXDOMAIN* ]]; then
      echo $line
    fi
  done
}

checkfingerprint() {
  while IFS= read -r line; do
    r=$(curl -s -L $line -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36')
    if [[ $r == *$1* ]]; then
      echo $line
    fi
  done
}

gitstrings() {
  # Print all the strings in .git/objects/pack
  # Credits to tomnomnom - https://twitter.com/tomnomnom/status/1133345832688857095
  {
    find .git/objects/pack/ -name "*.idx" | while read i; do git show-index <"$i" | awk '{print $2}'; done
    find .git/objects/ -type f | grep -v '/pack/' | awk -F'/' '{print $(NF-1)$NF}'
  } | while read o; do git cat-file -p $o; done
}

ipinfo() {
  curl ipinfo.io/$1
}

chaos_projectdiscovery() {
  curl -s -H "Authorization: $CHAOS_APIKEY" https://dns.projectdiscovery.io/dns/$1/subdomains |
    jq -crM '.subdomains | . []' |
    sed -e "s/$/.$1/"
}

if [[ -r "$HOME/.local/share/go/src/github.com/tomnomnom/gf/gf-completion.zsh" ]]; then
	source $HOME/.local/share/go/src/github.com/tomnomnom/gf/gf-completion.zsh # [https://github.com/tomnomnom/gf]
fi
