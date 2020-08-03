#!/usr/bin/env bash
TOP_DIR=$(dirname "$BR2_CONFIG")
if [ -z "$2" ]; then
	BOARD_DIR="$(dirname $0)"
	ITS_FILE="$BOARD_DIR/uboot.its"
else
	ITS_FILE="$TOP_DIR/$2"
fi
#set
#echo "$0 $@"
#echo "Running cp '$ITS_FILE' '${BINARIES_DIR}'"
#echo "PATH=$PATH"
cp "$ITS_FILE" "${BINARIES_DIR}"
cd "${BINARIES_DIR}"
mkimage -f uboot.its uimage.ub
