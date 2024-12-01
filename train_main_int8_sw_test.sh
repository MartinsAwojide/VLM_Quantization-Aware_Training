#! /bin/bash

# --imagenet-val './data/imagenet/validation/' \

# General Precision Options for OpenCLIP
# precision= amp, amp_bf16, amp_bfloat16, bf16, fp16, pure_bf16, pure_fp16, fp32

# Usually matrix mulplication for OpenCLIP is done in float16 or bfloat16 but int8 operations are faster. Are they as accurate though?

# working setting for int8
# precision=amp, amp_bf16, fp32
# seems the amp and default fp32 settings work because the difference are handled during matrix multiplication compared to pure_fp16 and pure_bf16 

# SwitchBack Options
# SwitchBackLinearGlobalMemEfficient, SwitchBackLinearGlobal

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
    --precision fp32 \
    --wd=0.2 \
    --epochs=60 \
    --workers=8 \
    --seed 0 \
    --model RN50\
    --report-to wandb \
    --wandb-project open_clip_int8 \
    --resume "latest" \
    --ddp-static-graph \
    --use-bnb-linear SwitchBackLinearGlobalMemEfficient \
    --delete-previous-checkpoint \
    --wandb-notes "testing int8 training with linear unit replacement with SwitchBack units" \
    
