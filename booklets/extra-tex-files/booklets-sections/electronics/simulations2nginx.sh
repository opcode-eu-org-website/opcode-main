#!/bin/sh

dir=$(realpath $(dirname "$0"))

while read id url; do
	echo 'rewrite   ^/'"$id"'$    https://www.falstad.com/circuit/circuitjs.html?'"$url"';'
done < "$dir/simulations.txt"
