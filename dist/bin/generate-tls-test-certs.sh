#!/bin/bash

# Copyright (c) 2016-2018 Christian Saide <supernomad>
# Licensed under the MPL-2.0, for details see https://github.com/supernomad/quantum/blob/master/LICENSE

PROJECT_ROOT=$(realpath $(dirname ${BASH_SOURCE})/../../.)

rm -rf "$PROJECT_ROOT/dist/ssl/certs"
mkdir -p "$PROJECT_ROOT/dist/ssl/certs"

rm -rf "$PROJECT_ROOT/dist/ssl/csrs"
mkdir -p "$PROJECT_ROOT/dist/ssl/csrs"

rm -rf "$PROJECT_ROOT/dist/ssl/keys"
mkdir -p "$PROJECT_ROOT/dist/ssl/keys"

rm -rf "$PROJECT_ROOT/dist/ssl/data"
mkdir -p "$PROJECT_ROOT/dist/ssl/data"

pushd "$PROJECT_ROOT/dist/ssl" 2>&1 > /dev/null

touch data/index.txt
echo '01' > data/serial

export SAN="IP:127.0.0.1, IP:::1"

# Create etcd CA cert
yes | openssl req -config etcd-openssl.cnf -passout pass:quantum -new -x509 -extensions v3_ca -keyout keys/ca.key -out certs/ca.crt -subj "/C=US/ST=New York/L=New York City/O=quantum/OU=development/CN=ca.quantum.dev"

# Create and sign etcd server certificate
export SAN="DNS:etcd.quantum.dev, IP:127.0.0.1, IP:::1, IP:172.19.0.4, IP:fd00:dead:beef::4"
yes | openssl req -config etcd-openssl.cnf -new -nodes -keyout keys/etcd.quantum.dev.key -out csrs/etcd.quantum.dev.csr -subj "/C=US/ST=New York/L=New York City/O=quantum/OU=development/CN=etcd.quantum.dev"
yes | openssl ca -config etcd-openssl.cnf -passin pass:quantum -extensions v3_server -keyfile keys/ca.key -cert certs/ca.crt -out certs/etcd.quantum.dev.crt -infiles csrs/etcd.quantum.dev.csr

# Create and sign etcd client certificates
export SAN="DNS:quantum0.quantum.dev, IP:127.0.0.1, IP:::1, IP:172.19.0.2, IP:fd00:dead:beef::2"
yes | openssl req -config etcd-openssl.cnf -new -nodes -keyout keys/quantum0.quantum.dev.key -out csrs/quantum0.quantum.dev.csr -subj "/C=US/ST=New York/L=New York City/O=quantum/OU=development/CN=quantum0.quantum.dev"
yes | openssl ca -config etcd-openssl.cnf -passin pass:quantum -extensions v3_client -keyfile keys/ca.key -cert certs/ca.crt -out certs/quantum0.quantum.dev.crt -infiles csrs/quantum0.quantum.dev.csr

export SAN="DNS:quantum1.quantum.dev, IP:127.0.0.1, IP:::1, IP:172.19.0.3, IP:fd00:dead:beef::3"
yes | openssl req -config etcd-openssl.cnf -new -nodes -keyout keys/quantum1.quantum.dev.key -out csrs/quantum1.quantum.dev.csr -subj "/C=US/ST=New York/L=New York City/O=quantum/OU=development/CN=quantum1.quantum.dev"
yes | openssl ca -config etcd-openssl.cnf -passin pass:quantum -extensions v3_client -keyfile keys/ca.key -cert certs/ca.crt -out certs/quantum1.quantum.dev.crt -infiles csrs/quantum1.quantum.dev.csr

export SAN="DNS:quantum2.quantum.dev, IP:127.0.0.1, IP:::1, IP:172.19.0.5, IP:fd00:dead:beef::5"
yes | openssl req -config etcd-openssl.cnf -new -nodes -keyout keys/quantum2.quantum.dev.key -out csrs/quantum2.quantum.dev.csr -subj "/C=US/ST=New York/L=New York City/O=quantum/OU=development/CN=quantum2.quantum.dev"
yes | openssl ca -config etcd-openssl.cnf -passin pass:quantum -extensions v3_client -keyfile keys/ca.key -cert certs/ca.crt -out certs/quantum2.quantum.dev.crt -infiles csrs/quantum2.quantum.dev.csr


export SAN="IP:127.0.0.1, IP:172.19.0.2, IP:172.19.0.3, IP:172.19.0.4, IP:172.19.0.5, IP:::1, IP:fd00:dead:beef::2, IP:fd00:dead:beef::3, IP:fd00:dead:beef::4, IP:fd00:dead:beef::5"

# Create ec CA cert
yes | openssl ecparam -out keys/ec-secp521r1.pem -name secp521r1
yes | openssl req -config etcd-openssl.cnf -sha384 -passout pass:quantum -new -x509 -extensions v3_ca -newkey ec:keys/ec-secp521r1.pem -keyout keys/ec-ca.key -out certs/ec-ca.crt -subj "/C=US/ST=New York/L=New York City/O=quantum/OU=development/CN=ec-ca.quantum.dev"

# Create ec server certificate
yes | openssl req -config etcd-openssl.cnf -sha384 -new -nodes -newkey ec:keys/ec-secp521r1.pem -keyout keys/ec-server.key -out csrs/ec-server.csr -subj "/C=US/ST=New York/L=New York City/O=quantum/OU=development/CN=ec-server"
yes | openssl ca -config etcd-openssl.cnf -passin pass:quantum -extensions v3_server -keyfile keys/ec-ca.key -cert certs/ec-ca.crt -out certs/ec-server.crt -infiles csrs/ec-server.csr

# Create ec client certificate
yes | openssl req -config etcd-openssl.cnf -sha384 -new -nodes -newkey ec:keys/ec-secp521r1.pem -keyout keys/ec-client.key -out csrs/ec-client.csr -subj "/C=US/ST=New York/L=New York City/O=quantum/OU=development/CN=ec-client"
yes | openssl ca -config etcd-openssl.cnf -passin pass:quantum -extensions v3_client -keyfile keys/ec-ca.key -cert certs/ec-ca.crt -out certs/ec-client.crt -infiles csrs/ec-client.csr

popd 2>&1 > /dev/null
