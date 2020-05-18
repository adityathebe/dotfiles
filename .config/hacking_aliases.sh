am(){
	amass enum --passive -d $1 | tee $1.amass.subdomains.txt
}

crtsh(){ 
	curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | tee $1.crtsh.subdomains.txt
}

certspotter(){ 
	curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1 | tee $1.certspotter.subdomains.txt
}

checkdomain() {
	x=$(curl -s -L  https://rtb.namecheapapi.com/api/picks/$1 | jq '.picks[]' | jq -crM "select(.domain == \"$1\")")
	echo $x
	if [[ -n "$x" ]]; then
		echo "✅[Available] $1"
	else
		echo "❌[Unavailable] $1"
	fi
}

dirsearch() { 
	python ~/hacking/tools/dirsearch/dirsearch.py -u $1 -e $2 -t 50 -b 
}

checknxdomain() {
	while read -r line; do
		x=$(dig $line)
		if [[ $x == *NXDOMAIN* ]]; then
			echo $line
		fi
	done
}	

checkfingerprint() {
	while IFS= read -r line; do
		# Make Request
		r=$(curl -s -L $line -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36')

		# Check Fingerprint
		if [[ $r == *$1* ]]; then
			echo $line
		fi
	done
}
