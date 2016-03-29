#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y build-essential libyaml-dev libfftw3-dev libavcodec-dev libavformat-dev \
     libavutil-dev libavresample-dev python-dev libsamplerate0-dev libtag1-dev \
     git python-pip python-h5py \
     python-numpy-dev python-numpy python-yaml

install_essentia() {
    cd ~
    if cd essentia; then
        git checkout v2.1_beta2
    else
        git clone -b v2.1_beta2 https://github.com/MTG/essentia.git
        cd essentia
    fi
    ./waf configure --mode=release --build-static --with-python --with-cpptests --with-examples --with-vamp && \
        ./waf && \
        sudo ./waf install
}

python -c 'import essentia' || install_essentia
pip install -r /vagrant/py/requirements.txt

