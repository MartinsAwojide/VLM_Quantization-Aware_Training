#! /bin/bash

python -m open_clip_train.main \
    --save-frequency 1 \
    --zeroshot-frequency 1 \
    --train-data './data/mscoco_mini/{00000..00001}.tar' \
    --val-data './data/mscoco_mini/00002.tar' \
    --dataset-type webdataset \
    --dataset-resampled \
    --train-num-samples 20000 \
    --warmup 5000 \
    --batch-size 32 \
    --lr=2e-3 \
    --precision amp_bf16 \
    --wd=0.2 \
    --epochs=1 \
    --workers=2 \
    --model RN50\
    --report-to wandb \
    --wandb-project open_clip_trial \
    --resume "latest" \
    --ddp-static-graph \
    --delete-previous-checkpoint \
    
