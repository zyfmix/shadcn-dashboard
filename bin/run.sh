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

Case=${1:-"dev"}
Env=${2:-"local"}

ebc_debug "解析命令参数> run.sh $Case $Env"

{ [ "$Env" != "local" ] && [ "$Env" != "dev" ] && [ "$Env" != "tmp" ] && [ "$Env" != "test" ] && [ "$Env" != "beta" ] && [ "$Env" != "prod" ] && [ "$Env" != "private" ]; } && echo "参数[1: $1]不合法!" && exit

case "$Case" in
dev)
  yarn dev
 ;;
start)
  yarn build
  yarn start
  ;;
update)
  # check updatable
  ncu
  # exec update
  #ncu -u
  ;;
test)
 ;;
*)
  echo "[参数命令不合法]case: $Case [start,build,test]"
  exit 1
  ;;
esac
