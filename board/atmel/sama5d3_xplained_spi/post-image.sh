#!/usr/bin/env bash
BOARD_DIR="$(dirname $0)"
cp "$BOARD_DIR/uboot.its" .
mkimage -f uboot.its uimage.ub
