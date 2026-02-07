# !/bin/bash
set -e
cp Makefile.config.example Makefile.config
sudo apt-get update
sudo apt-get install protobuf-compiler libprotobuf-dev
sudo apt-get install libboost-all-dev
sudo apt-get install libgoogle-glog-dev libgflags-dev libhdf5-serial-dev liblmdb-dev libleveldb-dev libsnappy-dev libopencv-dev
sudo apt-get install libopenblas-dev
conda install -n edge_detection boost
sed -i 's/^BLAS := .*/BLAS := openblas/' Makefile.config
sed -i 's/^PYTHON_LIBRARIES := .*/# PYTHON_LIBRARIES := boost_python python2.7/' Makefile
make clean
make pycaffe -j
