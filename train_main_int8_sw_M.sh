#! /bin/bash

python -m open_clip_train.main \
    --beta1 0.9 \
    --beta2 0.95 \
    --save-frequency 1 \
    --zeroshot-frequency 1 \
    --save-most-recent \
    --train-data './data/mscoco_full/{00000..00059}.tar' \
    --imagenet-val './data/imagenet/validation/' \
    --dataset-type webdataset \
    --dataset-resampled \
    --train-num-samples 60000 \
    --warmup 5000 \
    --batch-size 1024 \
    --lr=2e-3 \
    --precision pure_bf16 \
    --wd=0.2 \
    --epochs=60 \
    --workers=8 \
    --seed 0 \
    --model RN50\
    --report-to wandb \
    --wandb-project open_clip_main \
    --resume "latest" \
    --ddp-static-graph \
    --use-bnb-linear SwitchBackLinearGlobalMemEfficient \
    --delete-previous-checkpoint \
    
