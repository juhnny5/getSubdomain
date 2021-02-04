# getSubdomain 🐱‍🏍
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fjulienbriault%2FgetSubdomain&count_bg=%23AA3DC8&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=Visitor&edge_flat=false)](https://hits.seeyoufarm.com)

Simply retrieve the sub-domains linked to a domain through the Certificate Transparency.
You can find more information [here](https://certificate.transparency.dev/).

## Prerequisites
- `curl`
- `jq`

## Get the script! 🐱‍👤
To retrieve the script, nothing complicated, just use the following commands:
```bash
curl -O https://raw.githubusercontent.com/julienbriault/getSubdomain/main/getSubdomain.sh
chmod u+x getSubdomain.sh
```
## How to use it? 🧐
As for the installation, nothing very complicated, just use the following syntax:
```bash
./getSubdomain example.org
```

Example of a return:
```
[2021-01-25 12:58:43]: reachable domain='www.example.org', state='HTTP OK (200)'
[2021-01-25 12:58:50]: reachable domain='www2.hu-berlin.de', state='HTTP OK (200)'
```
