#! /bin/bash
conda install python=3.10
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
conda install wandb
pip install -r requirements.txt  
pip install -r requirements-training.txt
pip install -r requirements-test.txt
pip install open_clip_torch

# show current directory
pwd

# show files in current directory
ls -l

# move to the parent directory
cd ..