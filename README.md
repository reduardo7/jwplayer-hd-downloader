# JW Player HD Downloader

Download videos using **JW Player** in **HD**!

# Usage

1. Play video using **Chrome Browser**.
2. Open **console**.
3. Go to **Network** tab in **console**.
4. Wait for next part of video.
5. Right click an select **Copy as cURL (bash)**.
6. Run `bash downloader.sh "my-file-name" "PASTE CURL HERE"`.

## Example

```bash
bash downloader.sh "file-name" "curl 'http://t....f9706ad338c22ce' -H 'DNT: 1' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: es,es-419;q=0.8' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36' -H 'Accept: */*' -H 'Referer: http://t....6-2016/' -H 'X-Requested-With: ShockwaveFlash/22.0.0.192' -H 'Connection: keep-alive' --compressed"
```
