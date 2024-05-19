#!/bin/sh
set -e

json='{n "job-a": {n "result": "success",n "outputs": {}n },n "job-b": {n "result": "failure",n "outputs": {}n },n "job-c": {n "result": "skipped",n "outputs": {}n }n}'
fixed_json=$(echo "$json" | sed 's/n//g')

echo $fixed_json | jq -c '.[] | .result' | while read -r result; do
  if [ "$result" != '"success"' ]; then
    echo "job failure" > failure.txt
    break
  fi
done

if [ -e failure.txt ]; then
  echo "job failure"
else
  echo "job success"
fi

rm -f failure.txt

# cat sample.json | jq -c '.[] | .result' | while read -r result; do
#   echo "結果: $result"
# done
