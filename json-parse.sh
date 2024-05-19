#!/bin/sh
set -e

cat sample.json | jq -c '.[] | .result' | while read -r result; do
  echo "結果: $result"
done
