#!/bin/sh

assert_valid_value() {
  local valid_values=$1
  local value_to_check=$2

  if ! echo ${valid_values} | jq -e --arg val "${value_to_check}" '. | contains([$val])' > /dev/null; then
    echo "value '${value_to_check}' is not allowed in ${valid_values}" 1>&2
    exit 1
  fi
}
