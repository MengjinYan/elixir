#for p2.xlargeg with 30 GB storage

mkdir m
cd m
rm -rf *

#CMake
sudo apt-get install cmake -y

#g++ compiler
sudo apt-get install g++ -y

#opencv
sudo apt-get install libopencv-dev python-opencv -y
sudo apt-get install liblapacke-dev
wget https://github.com/opencv/opencv/archive/3.2.0.tar.gz -O opencv.tar.gz
wget https://github.com/opencv/opencv_contrib/archive/3.2.0.tar.gz -O opencv-contrib.tar.gz
tar zxvf opencv.tar.gz
tar zxvf opencv-contrib.tar.gz
cd opencv-3.2.0
# viz
#èéååäævizéäçåä
sudo cp -r ./modules/viz/include/opencv2 /usr/local/include/

mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D \ OPENCV_EXTRA_MODULES_PATH=/home/ubuntu/m/opencv_contrib-3.2.0/modules /home/ubuntu/m/opencv-3.2.0/
make -j`nproc`

#googletest
sudo apt-get install libgtest-dev -y
cd ~/m; wget https://github.com/google/googletest/archive/release-1.8.0.tar.gz
tar zxvf release-1.8.0.tar.gz
rm release-1.8.0.tar.gz
cd googletest-release-1.8.0
cmake .
make
sudo cp googlemock/gtest/libg* /usr/lib/
sudo cp googlemock/libg* /usr/lib/
cd ..

#openssl
sudo apt-get install libssl-dev -y
wget http://bitbucket.org/eigen/eigen/get/3.2.10.tar.gz
tar zxvf 3.2.10.tar.gz
cd eigen-eigen-b9cd8366d4e8/
mkdir build
cd build
cmake ..
sudo make install
cd ~/m

#curl
sudo apt-get install libcurl4-openssl-dev -y

#boost
sudo apt-get install libboost-all-dev -y

#gflags
sudo apt-get install libgflags-dev -y

#glog
sudo apt-get install libgoogle-glog-dev -y

#cuda
cd ~/m
sudo apt-get purge nvidia-cuda*
sudo apt-get purge nvidia-*

wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
mv cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
sudo apt-get update -y
sudo apt-get install cuda -y

#protobuf
sudo apt-get install autoconf automake libtool curl make g++ unzip
wget https://github.com/google/protobuf/releases/download/v3.2.0/protobuf-cpp-3.2.0.tar.gz
tar zxvf protobuf-cpp-3.2.0.tar.gz
cd protobuf-3.2.0
./autogen.sh
./configure
make -j`nproc`
make check -j`nproc`
sudo make install -j`nproc`
sudo ldconfig # refresh shared library cache.

#grpc
sudo apt-get install build-essential autoconf libtool -y
sudo apt-get install libgflags-dev libgtest-dev -y
sudo apt-get install clang libc++-dev -y
git clone https://github.com/grpc/grpc/
cd grpc
git submodule update --init
make
sudo make install

#libavfilter
sudo apt-get install libavfilter-dev -y





#sudo apt-get install libprotobuf-dev -y #
äèç，åäæVersion 2，èæ
Version 3.


#libbz2
sudo apt-get install libbz2-dev -y

#halide
cd ~/m
wget https://github.com/halide/Halide/releases/download/release_2016_10_25/halide-linux-64-gcc53-trunk-aa5d5514f179bf0ffe1a2dead0c0eb7300b4069a.tgz
tar xvf halide-linux-64-gcc53-trunk-aa5d5514f179bf0ffe1a2dead0c0eb7300b4069a.tgz
cd Halide
sudo apt-get install clang -y
sudo ln -s /usr/bin/llvm-config-3.8 /usr/local/bin/llvm-config
sudo make install
export Halide_DIR=/usr/local/share/halide #
èéèèçèäENVVARçCMakeç


#caffe
cd ~/m
sudo apt-get install libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev -y
sudo apt-get install libatlas-base-dev -y
sudo apt-get install libopenblas-dev -y
sudo apt-get install liblmdb-dev -y
sudo apt-get install --no-install-recommends libboost-all-dev -y
git clone https://github.com/BVLC/caffe.git
cp Makefile.config.example Makefile.config
# Change Makefile.config
# line 94 -95:
# INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial
# LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /usr/lib/x86_64-linux-gnu/hdf5/serial/

sudo apt-get install python-pip

export PYTHONPATH=/path/to/caffe-master/python:$PYTHONPATH
make all -j`nproc`
make test
make runtest
make distribute

cd ~/m/caffe/build
sudo cp lib/* /usr/local/lib
cd ..
  #caffe.pb.h
protoc src/caffe/proto/caffe.proto --cpp_out=.
mkdir include/caffe/proto
mv src/caffe/proto/caffe.pb.h include/caffe/proto

sudo cp include/caffe/ -R /usr/local/include/



#scanner
git clone https://github.com/scanner-research/scanner
cd scanner
export SCANNER_DIR=`pwd`

cd ${SCANNER_DIR}/thirdparty
mkdir build && cd build
cmake ..
make -j`nproc`


cd ${SCANNER_DIR}
mkdir build
cd build
cmake -D BUILD_IMGPROC_OPS=ON ..
make -j`nproc`