#! /bin/bash

# try below precision:
# bf16, fp16, pure_fp16, pure_bf16
# All worked indicating consistency in precision is required for using Switch Back
# fp16 and pure_fp16 diverge after 1st step of training

python -m open_clip_train.main \
    --beta1 0.9 \
    --beta2 0.95 \
    --save-frequency 1 \
    --zeroshot-frequency 1 \
    --save-most-recent \
    --train-data './data/mscoco_mini/{00000..00001}.tar' \
    --val-data './data/mscoco_mini/00002.tar' \
    --dataset-type webdataset \
    --dataset-resampled \
    --train-num-samples 2000 \
    --warmup 5000 \
    --batch-size 16 \
    --lr=2e-3 \
    --precision pure_bf16 \
    --wd=0.2 \
    --epochs=60 \
    --workers=8 \
    --seed 0 \
    --model RN50\
    --report-to wandb \
    --wandb-project open_clip_test \
    --resume "latest" \
    --ddp-static-graph \
    --delete-previous-checkpoint \
    --wandb-notes "testing different precision settings for training" \
    
