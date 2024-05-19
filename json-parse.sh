#!/bin/sh
set -e

json='
{
  "job-1": {
    "result": "success",
    "outputs": {}
  },
  "job-2": {
    "result": "success",
    "outputs": {}
  },
  "job-3": {
    "result": "success",
    "outputs": {}
  }
}
'

echo $json | jq -c '.[] | .result' | while read -r result; do
  echo $result
  if [ "$result" = '"success"' ]; then
    echo "成功"
    break
  fi
done

# cat sample.json | jq -c '.[] | .result' | while read -r result; do
#   echo "結果: $result"
# done
