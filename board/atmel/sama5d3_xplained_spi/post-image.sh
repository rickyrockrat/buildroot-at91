#!/usr/bin/env bash
if [ -z "$2" ]; then
	BOARD_DIR="$(dirname $0)"
	ITS_FILE="$BOARD_DIR/uboot.its"
else
	ITS_FILE="$2"
fi
echo "$0 $@"
echo "Running cp '$ITS_FILE' '${BINARIES_DIR}'"
echo "PATH=$PATH"
cp "$ITS_FILE" "${BINARIES_DIR}"
cd "${BINARIES_DIR}"
mkimage -f uboot.its uimage.ub
