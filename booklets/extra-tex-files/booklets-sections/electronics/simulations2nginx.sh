#!/bin/sh

dir=$(realpath $(dirname "$0"))

grep -v '^#' "$dir/simulations.txt" | while read id url; do
	if [ "$id" != "" ]; then
		echo 'rewrite   ^/'"$id"'$    http://cs.opcode.eu.org/circuitjs.html?'"$url"';'
	fi
done
