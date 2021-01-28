# getSubdomain 🐱‍🏍
Simply retrieve the sub-domains linked to a domain through the Certificate Transparency.
You can find more information [here](https://certificate.transparency.dev/).

## Prerequisites
- `curl`
- `jq`

## Get the script! 🐱‍👤
To retrieve the script, nothing complicated, just use the following commands:
```bash
git clone https://github.com/julienbriault/getSubdomain.git
cd getSubdomain/
chmod +x getSubdomain.sh
```
## How to use it? 🧐
As for the installation, nothing very complicated, just use the following syntax:
```bash
./getSubdomain example.org
```

Example of a return:
```
[2021-01-25 12:58:10]: unreachable domain='tdhost001.t-systems-sfr.com'
[2021-01-25 12:58:42]: unreachable domain='tdreg001.t-systems-sfr.com'
[2021-01-25 12:58:43]: reachable domain='www.example.org', state='HTTP OK (200)'
[2021-01-25 12:58:50]: reachable domain='www2.hu-berlin.de', state='HTTP OK (200)'
```
