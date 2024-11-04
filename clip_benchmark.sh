#! /bin/bash

# install the library
pip install clip-benchmark

# download prompt template file and classnames file
# Download this .ipynb file
## wget https://github.com/openai/CLIP/blob/main/notebooks/Prompt_Engineering_for_ImageNet.ipynb

# Use the 80 prompts from the .ipynb file
# download the en_classnames.json file form clip_benchmark/datasets
# wget https://github.com/LAION-AI/CLIP_benchmark/blob/main/clip_benchmark/datasets/en_classnames.json

# download the zero_shot_prompts.json file form clip_benchmark/datasets
# wget https://github.com/LAION-AI/CLIP_benchmark/blob/main/clip_benchmark/datasets/en_zeroshot_classification_templates.json
     
# Alternatively, you can use just the cupl_prompts.json file
# wget https://github.com/LAION-AI/CLIP_benchmark/blob/main/clip_benchmark/datasets/cupl_prompts.json

clip_benchmark eval --dataset "ImageNetV2-matched-frequency" --model RN50 --pretrained "./epoch_1.pt" --custom_template_file "en_zeroshot_classification_templates.json" --custom_classname_file "en_classnames.json" --output "{dataset}_{pretrained}_{model}_{language}.json"
cat *_en.json