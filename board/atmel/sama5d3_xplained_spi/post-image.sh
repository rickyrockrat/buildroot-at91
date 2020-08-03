#!/usr/bin/env bash
if [ -z "$1" ]; then
	BOARD_DIR="$(dirname $0)"
	ITS_FILE="$BOARD_DIR/uboot.its"
else
	ITS_FILE="$1"
fi
cp "$ITS_FILE" "${BINARIES_DIR}"
cd "${BINARIES_DIR}"
mkimage -f uboot.its uimage.ub
