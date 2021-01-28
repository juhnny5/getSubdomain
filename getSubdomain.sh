#!/bin/bash

#
# Script to get all availables subdomains for a specific domain
# Written by J. BRIAULT <dev[at]jbriault[point]fr>
#

mainDomain=$1
subDomains=$(curl -sX GET "https://crt.sh/?q=${mainDomain}&output=json" | jq -r '.[].common_name' | sort | uniq)

redColor='\033[0;31m'
greenColor='\033[0;32m'
orangeColor='\033[0;33m'
resetColor='\033[0m'

#######################################
# Print domain status OK
# Arguments:
#       $1 = HTTP Status Code (int)
#       $2 = domain (str)
#
# Returns:
#   Print domain status with HTTP status code
#######################################
function printOk() {
        # Definition of arguments
        statusCode=$1
        domain=$2
        if [[ "$1" -eq "200" ]]; then
                printf "%b" "[$(date +'%Y-%m-%d %H:%M:%S')]: reachable domain='${greenColor}${domain}${resetColor}', state='HTTP OK (${statusCode})'\n" >&2
        elif [[ "$1" -eq "401" ]]; then
                printf "%b" "[$(date +'%Y-%m-%d %H:%M:%S')]: reachable domain='${greenColor}${domain}${resetColor}', state='HTTP UNAUTHORIZED (${statusCode})'\n" >&2
        elif [[ "$1" -eq "403" ]]; then
                printf "%b" "[$(date +'%Y-%m-%d %H:%M:%S')]: reachable domain='${greenColor}${domain}${resetColor}', state='HTTP FORBIDDEN (${statusCode})'\n" >&2
        else
                printf "%b" "[$(date +'%Y-%m-%d %H:%M:%S')]: reachable domain='${greenColor}${domain}${resetColor}'\n" >&2
        fi
}

#######################################
# Print domain status KO
# Arguments:
#       $1 = domain (str)
#
# Returns:
#   Print domain status
#######################################
function printKo() {
        # Definition of arguments
        domain=$1
        printf "%b" "[$(date +'%Y-%m-%d %H:%M:%S')]: unreachable domain='${redColor}${domain}${resetColor}'\n" >&2
}

for domain in ${subDomains[@]}; do
        statusCode=$(curl -LI ${domain} -o /dev/null -w '%{http_code}\n' -s)
        if [[ ${statusCode} != "200" ]] && [[ ${statusCode} != "403" ]] && [[ ${statusCode} != "401" ]]; then
                printKo ${domain}
        else
                printOk ${statusCode} ${domain}
        fi
done
