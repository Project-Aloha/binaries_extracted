#!/bin/bash
# AI generated.

binaries_dirs=$(find . -type d -name Binaries)

if [ -z "$binaries_dirs" ]; then
  echo "未找到名为Binaries的目录"
  exit 1
fi

for binaries_dir in $binaries_dirs; do
  parent_dir=$(dirname "$binaries_dir")

  eval $(strings "$binaries_dir/QcomPkg/XBLCore/XBLCore.te" | grep BOOT.XF)
  echo $QC_IMAGE_VERSION_STRING

  mv "$binaries_dir" "$parent_dir/$QC_IMAGE_VERSION_STRING"
done
