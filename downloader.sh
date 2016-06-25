#!/bin/bash

# File Name
#dest="educando-a-nina-capitulo-41-20-06-2016"
dest="$1"

# Google Chrome Request as cURL
#cmdCurl="curl 'http://telefe-vh.akamaihd.net/i/TOK/Educando_A_Nina/201606/AR/TLF4837760-EDUCANDO_A_NINA-ARGENTINA,_1500k,_600k,,_200k,.mp4.csmil/segment7_0_av.ts?null=0&hdntl=exp=1466903400~acl=/i/TOK/Educando_A_Nina/201606/AR/TLF4837760-EDUCANDO_A_NINA-ARGENTINA,_1500k,_600k,,_200k,.mp4.csmil/*~data=hdntl~hmac=75874173e0c4c031ead22103460ab1d030b632d90edfbd8813738c50286d61aa' -H 'Cookie: _alid_=qbbSN0Q6ECPMpmKuNq/+lw==; hdntl=exp=1466903400~acl=%2fi%2fTOK%2fEducando_A_Nina%2f201606%2fAR%2fTLF4837760-EDUCANDO_A_NINA-ARGENTINA,_1500k,_600k,,_200k,.mp4.csmil%2f*~data=hdntl~hmac=75874173e0c4c031ead22103460ab1d030b632d90edfbd8813738c50286d61aa' -H 'DNT: 1' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: es,es-419;q=0.8' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36' -H 'Accept: */*' -H 'Referer: http://telefe.com/educando-a-nina/educando-a-nina-capitulo-41-20-06-2016/' -H 'X-Requested-With: ShockwaveFlash/22.0.0.192' -H 'Connection: keep-alive' --compressed"
cmdCurl="$2"

##################
## Utis

tmp="${dest}.tmp"
dest="${dest}.mp4"

e() {
  echo "# $@"
}

finish() {
  e "#######################################"
  rm -f "${tmp}"
  e "File: $dest"
  e "Finish!"
  exit 0
}

##################
## Run

e "Output file: $dest"

if [ -f "$dest" ]; then
  e "Error! File $dest already exists!" 1>&2
  exit 1
fi

for i in `seq 1 9999`; do
  e "#######################################"
  e "Downloading part ${i} [$dest]..."
  # Replace in URL: "/segment${i}"
  cmdCurlTmp="`echo "$cmdCurl" | sed "s/\/segment[0-9]*_/\/segment${i}_/"`"
  #if ! $cmdCurlTmp >> "${dest}"
  e "$cmdCurlTmp"
  bash -c "$cmdCurlTmp" > "${tmp}"
  if grep -i '<HTML>' "${tmp}" >/dev/null 2>/dev/null
    then
      # HTML
      e "Empty part!" 1>&2
      finish
    else
      # Append
      cat "${tmp}" >> "${dest}"
    fi
done

# Parts limit
e "Limit!" 1>&2
finish
