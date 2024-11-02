#! /bin/bash

python -m open_clip_train.main \
    --save-frequency 1 \
    --train-data './data/mscoco_full/{00000..000049}.tar' \
    --val-data './data/mscoco_full/{000050..000059}.tar' \
    --dataset-type webdataset \
    --dataset-resampled \
    --train-num-samples 20000 \
    --warmup 5000 \
    --batch-size 32 \
    --lr=2e-3 \
    --precision pure_bf16 \
    --wd=0.2 \
    --epochs=2 \
    --workers=2 \
    --seed 0 \
    --model RN50\
    --report-to wandb \
    --wandb-project open_clip_trial \
    --resume "latest" \
    --ddp-static-graph \
    --local-loss \
    --gather-with-grad \
    
