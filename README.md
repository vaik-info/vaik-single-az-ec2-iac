# vaik-single-az-ec2-iac

This repository is that deploys EC2 to a single az vpc with a github action as a trigger.<br>
Please fork when using.<br>
This repository is made for minimum sample for [technical tips](https://www.vaikobo.com/tips) explanation. 

[![Apply](https://github.com/vaik-info/vaik-single-az-ec2-iac/actions/workflows/apply.yml/badge.svg)](https://github.com/vaik-info/vaik-single-az-ec2-iac/actions/workflows/apply.yml)
[![Destroy](https://github.com/vaik-info/vaik-single-az-ec2-iac/actions/workflows/destroy.yml/badge.svg)](https://github.com/vaik-info/vaik-single-az-ec2-iac/actions/workflows/destroy.yml)

## Diagram

![IaC-single_az](https://user-images.githubusercontent.com/116471878/197667250-72aa472f-763c-4666-b822-c14960709203.png)

## Pre-requirements

### AWS resources

|               Key               |                             Detail                              |
|:-------------------------------:|:---------------------------------------------------------------:|
|            IAM User             | Attach EC2FullAccess/S3FullAccess(for Backend S3 bucket) Policy |
|        Key pairs for EC2        |                      (example)example.pem                       |
|          Target AMI ID          |                 (example) ami-0f00ffaa05e2bd80e                 |
|        Backend S3 bucket        |             (example)s3://example-single-az-ec2-iac              |

### GitHubActions secrets

GitHub->Settings->Secrets->Actions->New repository secret

|          Key          |                Detail                |
|:---------------------:|:------------------------------------:|
|   AWS_ACCESS_KEY_ID   |            Ref. IAM User             |
| AWS_SECRET_ACCESS_KEY |            Ref. IAM User             |
|   LOCAL_IP_ADDRESS   |     (example)xxx.xxx.xxx.xxx/32      |
|    S3_BUCKET_NAME     |  (example)example-single-az-ec2-iac  |

--------
## Run

- [Apply](https://github.com/vaik-info/vaik-single-az-ec2-iac/actions/workflows/apply.yml)
- [Destroy](https://github.com/vaik-info/vaik-single-az-ec2-iac/actions/workflows/destroy.yml)


--------

## Access EC2

### Login

- command

```shell
ssh -i ~/.ssh/xxx.pem(Key pairs for EC2 ) -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@xxx.xxx.xxx.xxx(public eip address)
```

### Test

- command

```shell
nvidia-smi
python3.9 -c "from tensorflow.python.client import device_lib;device_lib.list_local_devices()"
```

- log

```shell
ubuntu@ip-10-0-4-228:~$ nvidia-smi
Mon Oct 24 11:44:13 2022       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 510.47.03    Driver Version: 510.47.03    CUDA Version: 11.6     |
・・・
| N/A   35C    P8    14W /  70W |      0MiB / 15360MiB |      0%      Default |
・・・
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
ubuntu@ip-10-0-4-228:~$ python3.9 -c "from tensorflow.python.client import device_lib;device_lib.list_local_devices()"
2022-10-24 11:44:15.484589: I tensorflow/core/platform/cpu_feature_guard.cc:193] This TensorFlow binary is optimized with oneAPI Deep Neural Network Library (oneDNN) to use the following CPU instructions in performance-critical operations:  AVX2 AVX512F AVX512_VNNI FMA
・・・
2022-10-24 11:46:09.551010: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1616] Created device /device:GPU:0 with 13584 MB memory:  -> device: 0, name: Tesla T4, pci bus id: 0000:00:1e.0, compute capability: 7.5

```