#!/bin/bash

set -e
#apt-get update 
#apt-get install --no-install-recommends --no-install-suggests -y \
yum install -y \
                libcurl4-openssl-dev \
                build-essential \
                git \
                ca-certificates

alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake 10 \
      --slave /usr/local/bin/ctest ctest /usr/bin/ctest \
      --slave /usr/local/bin/cpack cpack /usr/bin/cpack \
      --slave /usr/local/bin/ccmake ccmake /usr/bin/ccmake \
      --family cmake \

alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake3 20 \
      --slave /usr/local/bin/ctest ctest /usr/bin/ctest3 \
      --slave /usr/local/bin/cpack cpack /usr/bin/cpack3 \
      --slave /usr/local/bin/ccmake ccmake /usr/bin/ccmake3 \
      --family cmake

# Build OpenTracing
cd /
git clone https://github.com/opentracing/opentracing-cpp.git
cd opentracing-cpp
mkdir .build && cd .build
cmake -DBUILD_TESTING=OFF ..
make && make install
