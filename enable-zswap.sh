#!/bin/sh

echo "zstd" > /sys/module/zswap/parameters/compressor
echo "Y" > /sys/module/zswap/parameters/shrinker_enabled
echo "Y" > /sys/module/zswap/parameters/enabled
