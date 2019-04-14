#!/bin/sh
set -e

if [ "$SSL" = "true" ]; then
	echo "Start aria2 with secure config"

	/usr/bin/aria2c --conf-path="/root/conf/aria2.conf" \
	--enable-rpc --rpc-listen-all  \
	--rpc-certificate=/root/conf/key/aria2.crt \
	--rpc-private-key=/root/conf/key/aria2.key \
	--rpc-secret="$RPC_SECRET" --rpc-secure
else
	echo "Start aria2 with standard mode"
	/usr/bin/aria2c --conf-path="/root/conf/aria2.conf" \
	--enable-rpc --rpc-listen-all \
	--rpc-secret="$RPC_SECRET" 
fi
