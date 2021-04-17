#!/bin/bash
#
# Build script for installing prerequisities of NS-3 installation on Ubuntu
#
echo Script construído por Vicente Sousa em 09/02/2017 para instalar o ns-3.27
echo Atualizado por Daniel Luna em 02/05/2019 para instalar o ns-3.29
echo Atualizado por Vicente Sousa em 16/04/2021 para instalar o ns-3.30
#
# Dependencies installation according to https://www.nsnam.org/wiki/Installation#Ubuntu.2FDebian.2FMint
sudo apt-get update
sudo apt-get install vtun lxc uml-utilities
sudo apt-get install g++ python3 
sudo apt-get install python3-dev pkg-config sqlite3 
sudo apt-get install wget 
sudo apt-get install python3-setuptools git 
sudo apt-get install qt5-default mercurial 
sudo apt-get install autoconf cvs bzr unrar 
sudo apt-get install gdb valgrind uncrustify   
sudo apt-get install doxygen graphviz imagemagick
sudo apt-get install texlive texlive-extra-utils texlive-latex-extra texlive-font-utils dvipng latexmk
sudo apt-get install python3-sphinx dia 
sudo apt-get install gsl-bin libgsl-dev libgsl23 libgslcblas0 tcpdump sqlite sqlite3 libsqlite3-dev libxml2 libxml2-dev 
sudo apt-get install  vtun lxc uml-utilities

# gcc 4.9
#sudo add-apt-repository ppa:ubuntu-toolchain-r/test
#sudo apt-get update
#sudo apt-get install gcc-4.9 g++-4.9
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9

# Eclipse CDT installation
#sudo apt-get install eclipse eclipse-cdt g++

# ns-3 installation and compilation

# Criar pasta
mkdir ~/ns-3
cd ~/ns-3
# Baixar:
sudo wget http://www.nsnam.org/release/ns-allinone-3.30.tar.bz2 --no-check-certificate
#Descompactar:
tar xvjf ns-allinone-3.30.tar.bz2
#Entrar na pasta:
cd ns-allinone-3.30/ns-3.30/
# Configurar:
CXXFLAGS="-Wall -g -O0" ./waf --build-profile=debug --enable-examples --enable-tests configure
# Compilar:
./waf
# Testar 
./waf --run hello-simulator

echo For Eclipse configuration, see presentation: Tutorial_instalação_NS-3_e_integração_com_eclipsev06.pptx or following the instructions bellow.

# https://linuxconfig.org/eclipse-ide-for-c-c-developers-installation-on-ubuntu-20-04
# https://linoxide.com/install-eclipse-on-ubuntu-20-04/
# https://askubuntu.com/questions/1265776/installing-eclipse-c-c-ubuntu-20-04
# src/aodv/examples/aodv.cc
# src/dsdv/examples/dsdv-manet.cc
# src/dsr/examples/dsr.cc
# src/applications/examples/three-gpp-http-example.cc
# src/traffic-control/examples
# src/olsr/examples/simple-point-to-point-olsr.cc
# src/network/examples/packet-socket-apps.cc
# src/uan/examples/uan-cw-example.cc
