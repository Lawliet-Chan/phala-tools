export sdk_bin=https://download.01.org/intel-sgx/sgx-linux/2.7.1/distro/ubuntu18.04-server/sgx_linux_x64_sdk_2.7.101.3.bin

export psw_deb=https://download.01.org/intel-sgx/sgx-linux/2.7.1/distro/ubuntu18.04-server/libsgx-enclave-common_2.7.101.3-bionic1_amd64.deb

export psw_dev_deb=https://download.01.org/intel-sgx/sgx-linux/2.7.1/distro/ubuntu18.04-server/libsgx-enclave-common-dev_2.7.101.3-bionic1_amd64.deb

export psw_dbgsym_deb=https://download.01.org/intel-sgx/sgx-linux/2.7.1/distro/ubuntu18.04-server/libsgx-enclave-common-dbgsym_2.7.101.3-bionic1_amd64.ddeb

export rust_toolchain=nightly-2019-11-25

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update && sudo apt-get install -y build-essential ocaml ocamlbuild automake autoconf libtool wget python libssl-dev libcurl4-openssl-dev protobuf-compiler libprotobuf-dev sudo kmod vim curl git-core libprotobuf-c0-dev libboost-thread-dev libboost-system-dev liblog4cpp5-dev libjsoncpp-dev alien uuid-dev libxml2-dev cmake pkg-config expect systemd-sysv gdb && sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/cache/apt/archives/*

mkdir -p sgx && sudo mkdir -p /etc/init && wget -O sgx/psw.deb ${psw_deb} && wget -O sgx/psw_dev.deb ${psw_dev_deb} && wget -O sgx/psw_dbgsym.deb ${psw_dbgsym_deb} && wget -O sgx/sdk.bin ${sdk_bin} && sudo dpkg -i sgx/psw.deb && sudo dpkg -i sgx/psw_dev.deb && sudo dpkg -i sgx/psw_dbgsym.deb && sudo chmod +x sgx/sdk.bin && echo -e 'no\n/opt' | sudo sgx/sdk.bin && echo 'source /opt/sgxsdk/environment' >> ~/.bashrc && sudo  rm -rf /root/sgx/*


echo "PLEASE:  source ~/.bashrc"
