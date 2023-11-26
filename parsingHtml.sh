#!/bin/bash

if [ "$1" == "" ]; then
    echo -e "\e[1;31m\e[1m
    ================================================
    MODO DE USO: $0 ( URL )
    ================================================\e[0m"
else
    echo -e "\e[1;32m
    ================================================
    EK1L PARSING HTML
    ================================================\e[0m"
    rm -f listaDomains
    wget -q -O index.html $1;
    grep -Eo "(http|https)://[a-zA-Z0-9.-]+" index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" >> listaDomains;

 
    echo -e "\e[1;32m
    ================================================
    PESQUISANDO IP DOS DOMÍNIOS...
    ================================================\e[0m"
    rm -f listaIPDomains
    for url in $(cat listaDomains)
    do
        host $url | grep "has address" >> listaIPDomains
    done
    rm index.html
fi
