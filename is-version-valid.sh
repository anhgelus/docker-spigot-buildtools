#!/bin/bash

validjava8="1.16.5","1.16.4","1.16.3","1.16.2","1.16.1","1.15.2","1.15.1","1.15","1.14.4","1.14.3","1.14.2","1.14.1","1.14","1.13.2","1.13.1","1.13","1.12.2","1.12.1","1.12","1.11.2","1.11.1","1.11","1.10.2","1.9.4","1.9.2","1.9","1.8.8","1.8.3","1.8"
validjava17="latest","1.19","1.18.2","1.18.1","1.18","1.17.1"

java=$1
version=$2

isvalid=false

if [[ "${java}" =~ "17" ]]; then
    if [[ "${validjava17[@]}" =~ "${version}" ]]; then
        isvalid=true
    fi
else 
    if [[ "${validjava8[@]}" =~ "${version}" ]]; then
        isvalid=true
    fi
fi
echo "${isvalid}"

if [[ ${isvalid} = true ]]; then
    echo "Valid version"
else
    echo "This is not a valid version, see https://www.spigotmc.org/wiki/buildtools/ for more information"
    exit 42
fi
