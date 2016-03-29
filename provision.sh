#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y build-essential libyaml-dev libfftw3-dev libavcodec-dev libavformat-dev \
     libavutil-dev libavresample-dev python-dev libsamplerate0-dev libtag1-dev \
     git python-pip python-h5py python-sklearn \
     python-numpy-dev python-numpy python-yaml

install_essentia() {
    cd ~
    if [ -d essentia ]; then
        (
            cd essentia
            git checkout v2.1_beta2
        )
    else
        echo "Essentia not found; cloning repo"
        git clone -b v2.1_beta2 https://github.com/MTG/essentia.git
    fi
    cd essentia
    ./waf configure --mode=release --with-python 2>&1
    ./waf 2>&1
    sudo ./waf install 2>&1
}

python -c 'import essentia' || install_essentia
pip install -r /vagrant/py/requirements.txt

