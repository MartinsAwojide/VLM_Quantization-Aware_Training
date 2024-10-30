# VLM_Quantization-Aware_Training

## Download Datasets

- clone the repository
- move to the custom_scripts folder and make the download_data script executable and run the script using

```bash
cd custom_scripts && chmod a+x download_data.sh && ./download_data.sh
```

- After installation of megatools, indicate which datatype you need to download. Select either 'mini', 'full' and 'karpathy'


## Training with OpenCLIP 
- Once you’ve installed the dependencies for [openCLIP](https://github.com/mlfoundations/open_clip?tab=readme-ov-file#install) and structured your dataset path as follows:

```bash
 /data/mini/{}.tar 
```

- You can initiate the training process by running `train.sh`.

```bash
 chmod a+x train.sh && ./train.sh
```