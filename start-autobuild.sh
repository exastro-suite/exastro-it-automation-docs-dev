#!/bin/sh

lsof -i :8000 | grep -c 8000 && kill -9 `lsof -i :8000|grep 8000|awk '{print $2}'`

python -msphinx_autobuild /workspace/src /workspace/docs