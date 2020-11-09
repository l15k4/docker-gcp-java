#!/bin/bash -x


docker run --rm -e KUBERNETES_MEMORY_LIMIT=1048576000 $1 || exit 1
docker run --rm -e KUBERNETES_MEMORY_LIMIT=1048576000 -e MIN_NON_HEAP_SIZE_MB=200 $1 || exit 1
docker run --rm -e KUBERNETES_MEMORY_LIMIT=1048576000 -e HEAP_SIZE_RATIO=40 $1 || exit 1
docker run --rm -e KUBERNETES_MEMORY_LIMIT=1048576000 -e HEAP_SIZE_RATIO=30 -e MIN_NON_HEAP_SIZE_MB=900 $1 || exit 1

docker run --rm -e KUBERNETES_MEMORY_LIMIT=1048576000 -e PROFILER_ENABLE=true $1 || exit 1