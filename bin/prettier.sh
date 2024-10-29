#!/usr/bin/env bash
set -e

# 脚本路径
sc_dir="$(
  cd "$(dirname "$0")" >/dev/null 2>&1 || exit
  pwd -P
)"

# 去掉路径后缀
rs_path=${sc_dir/zsa-admin*/zsa-admin}

# 引入头文件
source $rs_path/bin/libs/headers.sh

Case=${1:-"write"}

ebc_debug "解析命令参数> prettier.sh $Case"

case "$Case" in
write)
  npx prettier . --write
  ;;
check)
  npx prettier . --check
  ;;
*)
  echo "[参数命令不合法]case: $Case [start,test]"
  exit 1
  ;;
esac
