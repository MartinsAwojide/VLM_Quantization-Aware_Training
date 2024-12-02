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
    --batch-size 250 \
    --lr=2e-3 \
    --precision amp \
    --wd=0.2 \
    --epochs=500 \
    --workers=8 \
    --seed 0 \
    --model RN50\
    --report-to wandb \
    --wandb-project open_clip_int8_setup \
    --resume "latest" \
    --ddp-static-graph \
    --use-bnb-linear SwitchBackLinearGlobal \
    --delete-previous-checkpoint \
    --wandb-notes "int8 for full coco dataset with linear unit replacement with SwitchBack units and RN50 backbone --setup runs" \
