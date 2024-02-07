#!/media/apps/avx512-2021/software/Python/3.10.8-GCCcore-12.2.0/bin/python

import torch
import logging
import os
import sys

def main():
    print("Starting probe_magerit.py")
    print("Hello World!")
    print("This is a test script.")
    print("Is CUDA available? ", torch.cuda.is_available())
    if torch.cuda.is_available():
        print("CUDA device count: ", torch.cuda.device_count())
        print("CUDA device name: ", torch.cuda.get_device_name(0))
        print("Resources: ")
        print(torch.cuda.memory_summary())
        print("CUDA version: ", torch.version.cuda)
    try:
        print("Available RAM: ", torch.cuda.get_device_properties(0).total_memory/1024**3, "GB")
    except RuntimeError:
        print("CUDA not available.")

    # CPU INFO. DO NOT USE TORCH FOR THIS
    print("Available CPU RAM: ", os.sysconf('SC_PAGE_SIZE') * os.sysconf('SC_PHYS_PAGES') / (1024.**3))
    print("CPU name: ", os.uname().nodename)
    print("CPU model: ", os.uname().machine)
    print("CPU architecture: ", os.uname().sysname)
    print("Number of CPU cores: ", os.cpu_count())
    print("pyTorch version: ", torch.__version__)
    # Dont use torch for python version
    print("Python version: ", sys.version)

if __name__ == "__main__":
    main()