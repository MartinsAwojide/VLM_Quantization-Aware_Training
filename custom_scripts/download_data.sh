#! /bin/bash

# script to download folder from mega.nz
# usage: ./download_mega.sh <url> <destination>
# ./download_mega.sh https://mega.nz/folder/xxxxxx /path/to/destination

sudo apt-get install megatools

# download specific file based on input given
read -p "Enter data type (mini, full, karpathy): " data_type

if [ $data_type == "mini" ]; then
    cd .. && mkdir data && cd data
    mkdir mscoco_mini && cd mscoco_mini
    megadl "https://mega.nz/folder/wMk2Ba4A#NJbpHvcLvyvFocmpK8kCfQ" --path .
    cd .. && pwd
elif [ $data_type == "full" ]; then
    cd .. && mkdir data && cd data
    mkdir mscoco_full && cd mscoco_full
    megadl "https://mega.nz/folder/EA10CAjY#DJF1ORj1hb-OSUskAnhCoQ" --path .
    cd .. && pwd
elif [ $data_type == "karpathy" ]; then
    cd .. && mkdir data && cd data
    mkdir mscoco_karpathy && cd mscoco_karpathy
    megadl "https://mega.nz/folder/9NlilQwC#o3yTqWSkXoxPfCR7k3y39Q" --path .
    cd .. && pwd
else
    echo "Invalid data type"
fi

