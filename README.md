# VLM_Quantization-Aware_Training

## Download Datasets

- clone the repository
- move to the custom_scripts folder and make the download_data script executable and run the script using

```bash
cd custom_scripts && chmod a+x download_data.sh && ./download_data.sh
```

- After installation of megatools, indicate which datatype you need to download. Select either 'mini', 'full' and 'karpathy'


## Training with OpenCLIP 
- create a conda environment
- Install the dependencies for [openCLIP](https://github.com/mlfoundations/open_clip?tab=readme-ov-file#install) using the install_requirements script in the custom_scripts folder and structure your dataset path as follows:

```bash
 /data/mini/{}.tar 
```

- You can initiate the training process by running `train.sh`.

```bash
 chmod a+x train.sh && ./train.sh
```

## Using Adafactor/AdafactorBigVision Optimizer 
- Run the following command to install the latest version of `timm` that includes the Adafactor/AdafactorBV optimizer implementation:

```bash 
!pip install git+https://github.com/huggingface/pytorch-image-models.git 
```
This will uninstall your current version of `timm` and install the latest version.
Example output:
```
Successfully built timm
Installing collected packages: timm
  Attempting uninstall: timm
    Found existing installation: timm 1.0.11
    Uninstalling timm-1.0.11:
      Successfully uninstalled timm-1.0.11
Successfully installed timm-1.0.12.dev0
```

- Add the following argument to your execution script (e.g., train_main_xxx.sh) to specify the optimizer:
```bash
    --opt timm/adafactor
```
or 
```bash
    --opt timm/adafactorbv 
```
- Run your script and check the log output to ensure the optimizer is set correctly. The output should include the following information:

```
2024-12-02,15:23:52 | INFO |   no_set_device_rank: False
2024-12-02,15:23:52 | INFO |   opt: timm/adafactorbv
2024-12-02,15:23:52 | INFO |   precision: amp_bfloat16
2024-12-02,15:23:52 | INFO |   pretrained: 
2024-12-02,15:23:52 | INFO |   pretrained_image: False
2024-12-02,15:23:52 | INFO |   rank: 0
2024-12-02,15:23:52 | INFO |   remote_sync: None
```

**Noted**: As of 2/12/2024, the Adafactor is not working. Please use the AdafactorBV instead. If you try to use the Adafactor, you will encounter the following error log:
```
2024-12-02,16:04:04 | INFO | Start epoch 0
Traceback (most recent call last):
  File "/usr/lib/python3.10/runpy.py", line 196, in _run_module_as_main
    return _run_code(code, main_globals, None,
  File "/usr/lib/python3.10/runpy.py", line 86, in _run_code
    exec(code, run_globals)
  File "/home/george/Documents/github/deep-learning-cmu/new_open_clip/open_clip/src/open_clip_train/main.py", line 560, in <module>
    main(sys.argv[1:])
  File "/home/george/Documents/github/deep-learning-cmu/new_open_clip/open_clip/src/open_clip_train/main.py", line 488, in main
    train_one_epoch(model, data, loss, epoch, optimizer, scaler, scheduler, dist_model, args, tb_writer=writer)
  File "/home/george/Documents/github/deep-learning-cmu/new_open_clip/open_clip/src/open_clip_train/train.py", line 181, in train_one_epoch
    optimizer.step()
  File "/home/george/Documents/github/deep-learning-cmu/new_open_clip/open_clip/.env/lib/python3.10/site-packages/torch/optim/optimizer.py", line 487, in wrapper
    out = func(*args, **kwargs)
  File "/home/george/Documents/github/deep-learning-cmu/new_open_clip/open_clip/.env/lib/python3.10/site-packages/torch/utils/_contextlib.py", line 116, in decorate_context
    return func(*args, **kwargs)
  File "/home/george/Documents/github/deep-learning-cmu/new_open_clip/open_clip/.env/lib/python3.10/site-packages/timm/optim/adafactor.py", line 190, in step
    update = grad ** 2 + group['eps']
TypeError: unsupported operand type(s) for +: 'Tensor' and 'NoneType'

```

## Using AdamW-Adafactor
- Follow the instructions [here](https://github.com/mlfoundations/open_clip?tab=readme-ov-file#install) to install OpenCLIP from source locally (Note: it is not installed via `pip install openclip`).
- Move the `stable_adam.py` into the `open_clip` directory. Edit the `__init__.py` file in the `open_clip` directory to reflect the new changes. Add the line below:  

```
from .stable_adam import StableAdamW
```

- Replace the `main.py` in the `open_clip` with the one in the repo. 

- Add the following argument to your execution script (e.g., train_main_xxx.sh) to specify the optimizer:
```bash
    --opt adamwsd
```
- Run your script and check the log output to ensure the optimizer is set correctly. The output should include the following information:

```
2024-12-02,15:23:52 | INFO |   no_set_device_rank: False
2024-12-02,15:23:52 | INFO |   opt: adamwsd
```