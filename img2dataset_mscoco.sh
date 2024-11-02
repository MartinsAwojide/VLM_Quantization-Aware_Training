#! /bin/bash

# Install img2dataset
pip install img2dataset

# Download the dataset parquet file from HuggingFace
wget https://huggingface.co/datasets/ChristophSchuhmann/MS_COCO_2017_URL_TEXT/resolve/main/mscoco.parquet

# Install Knot Resolver
wget https://secure.nic.cz/files/knot-resolver/knot-resolver-release.deb
sudo dpkg -i knot-resolver-release.deb
sudo apt update
sudo apt install -y knot-resolver
sudo sh -c 'echo `hostname -I` `hostname` >> /etc/hosts'
sudo sh -c 'echo nameserver 127.0.0.1 > /etc/resolv.conf'
sudo systemctl stop systemd-resolved

# Start Knot Resolver services
sudo systemctl start kresd@1.service
sudo systemctl start kresd@2.service
sudo systemctl start kresd@3.service
sudo systemctl start kresd@4.service

# Check if Knot Resolver is working
dig @localhost google.com

# Download the dataset using img2dataset
img2dataset --url_list mscoco.parquet --input_format "parquet"\
         --url_col "URL" --caption_col "TEXT" --output_format webdataset\
           --output_folder mscoco --processes_count 16 --thread_count 64 --image_size 256\
             --enable_wandb True