# susurrant-env

Download together with required submodules using:

```shell
git clone --recursive https://github.com/susurrant-audio/susurrant-env.git 
```

To run, first install [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads), then:

```shell
vagrant up
vagrant ssh
cd /vagrant/py
make
```
