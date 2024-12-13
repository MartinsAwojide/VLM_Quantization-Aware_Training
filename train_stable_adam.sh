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
    --batch-size 256 \
    --lr=2e-3 \
    --precision amp \
    --wd=0.2 \
    --epochs=200 \
    --workers=8 \
    --seed 0 \
    --model RN50\
    --opt adamwsd \
    --report-to wandb \
    --wandb-project open_clip_int8_setup \
    --resume "latest" \
    --ddp-static-graph \
    --use-bnb-linear SwitchBackLinearGlobalMemEfficient \
    --delete-previous-checkpoint \
    --grad-checkpointing \
    --wandb-notes "int8 with SwitchBackM and gradient checkpointing for memory mgt - stable adam"











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
    --batch-size 256 \
    --lr=2e-3 \
    --precision amp \
    --wd=0.2 \
    --epochs=200 \
    --workers=8 \
    --seed 0 \
    --model MobileCLIP-B\
    --opt timm/adafactorbv \
    --report-to wandb \
    --wandb-project open_clip_int8_setup \
    --resume "latest" \
    --use-bnb-linear SwitchBackLinearGlobalMemEfficient \
    --delete-previous-checkpoint \
    --grad-checkpointing \
    --wandb-notes "int8 with SwitchBackM and gradient checkpointing for memory mgt - adafactorbv"




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
    --batch-size 256 \
    --lr=2e-3 \
    --precision amp \
    --wd=0.2 \
    --epochs=200 \
    --workers=8 \
    --seed 0 \
    --model MobileCLIP-B \
    --opt adamwsd \
    --report-to wandb \
    --wandb-project open_clip_int8_setup \
    --resume "latest" \
    --use-bnb-linear SwitchBackLinearGlobalMemEfficient \
    --delete-previous-checkpoint \
    --grad-checkpointing \
    --wandb-notes "int8 with SwitchBackM and gradient checkpointing for memory mgt - adam stable"






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
    --batch-size 256 \
    --lr=2e-3 \
    --precision pure_bf16 \
    --wd=0.2 \
    --epochs=200 \
    --workers=8 \
    --seed 0 \
    --model MobileCLIP-B \
    --opt adamw \
    --report-to wandb \
    --wandb-project open_clip_l4_baseline \
    --resume "latest" \
    --delete-previous-checkpoint \
    --grad-checkpointing \
    --ddp-static-graph 




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
    --batch-size 256 \
    --lr=2e-3 \
    --precision pure_b16 \
    --wd=0.2 \
    --epochs=200 \
    --workers=8 \
    --seed 0 \
    --model RN101 \
    --opt adamw \
    --report-to wandb \
    --wandb-project open_clip_l4_baseline \
    --resume "latest" \
    --delete-previous-checkpoint \
    --grad-checkpointing \
    --ddp-static-graph 