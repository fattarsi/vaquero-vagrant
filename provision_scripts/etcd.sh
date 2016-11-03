#!/bin/bash
BASH_PROFILE=/home/vagrant/.bash_profile

echo "Installing etcd v3..."
ETCD_VER=v3.0.13
DOWNLOAD_URL=https://github.com/coreos/etcd/releases/download
curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
mkdir -p /tmp/test-etcd && tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/test-etcd --strip-components=1


#place binaries in expected locations
sudo mv /tmp/test-etcd/etcd /bin
sudo mv /tmp/test-etcd/etcdctl /bin

echo "Etcd installed. Configuring..."

echo "export ETCD_NAME=default" >> $BASH_PROFILE
echo "export ETCD_DATA_DIR=/var/lib/etcd/default.etcd" >> $BASH_PROFILE
echo "export ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:2379" >> $BASH_PROFILE
echo "export ETCD_ADVERTISE_CLIENT_URLS=http://localhost:2379" >> $BASH_PROFILE
