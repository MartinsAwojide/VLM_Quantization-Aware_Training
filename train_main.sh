#! /bin/bash

python -m open_clip_train.main \
    --beta1 0.9 \
    --beta2 0.95 \
    --save-frequency 1 \
    --zeroshot-frequency 1 \
    --save-most-recent True\
    --train-data './data/mscoco_full/{00000..00049}.tar' \
    --val-data './data/mscoco_full/{00050..00059}.tar' \
    --dataset-type webdataset \
    --dataset-resampled \
    --train-num-samples 50000 \
    --val-num-samples 10000 \
    --imagenet-val /data/imagenet/validation/ \
    --warmup 5000 \
    --batch-size 1024 \
    --lr=2e-3 \
    --precision pure_bf16 \
    --wd=0.2 \
    --epochs=2 \
    --workers=8 \
    --seed 0 \
    --model RN50\
    --report-to wandb \
    --wandb-project open_clip_trial \
    --resume "latest" \
    --ddp-static-graph \
    --delete-previous-checkpoint \
    
