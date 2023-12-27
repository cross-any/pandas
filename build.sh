#!/bin/bash
docker buildx build --tag registry.cn-beijing.aliyuncs.com/crossany/pandas --platform linux/amd64,linux/arm64  -f Dockerfile  --push .
docker buildx build --tag crossany/pandas --platform linux/amd64,linux/arm64  -f Dockerfile  --push .
docker buildx build --tag crossany/pandas:arm64 --platform linux/arm64  -f Dockerfile  --load .
docker buildx build --tag crossany/pandas:amd64 --platform linux/amd64  -f Dockerfile  --load .
