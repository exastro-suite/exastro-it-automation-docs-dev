#!/bin/sh

if [ -z "$sphinx_port" ]; then
  sp_port=8000
else
  sp_port=$sphinx_port
fi
echo ${sp_port}"port process kill."
lsof -i :$sp_port | grep -c $sp_port && kill -9 `lsof -i :$sp_port|grep $sp_port|awk '{print $2}'`

version=`git branch --contains | cut -d " " -f 2`

make html-all

echo "start sphinx_autobuild."
python -msphinx_autobuild /workspace/src/dummy /workspace/docs/ --port=$sp_port &
python -msphinx_autobuild  -D language="en" /workspace/src/${version} /workspace/docs/en/${version} --watch /workspace/src/locale/${version}/en --port=0 &
python -msphinx_autobuild  -D language="ja" /workspace/src/${version} /workspace/docs/ja/${version} --port=0