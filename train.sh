#! /bin/bash

python -m open_clip_train.main \
    --save-frequency 1 \
    --zeroshot-frequency 1 \
    --train-data './data/mscoco_mini/{00000..00001}.tar' \
    --val-data './data/mscoco_mini/00002.tar' \
    --dataset-type webdataset \
    --train-num-samples 20000 \
    --warmup 10000 \
    --batch-size 64 \
    --lr=1e-3 \
    --precision amp_bfloat16 \
    --wd=0.1 \
    --epochs=30 \
    --workers=1 \
    --model RN50