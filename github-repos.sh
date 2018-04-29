#!/usr/bin/env bash

set -eEuo pipefail

curl () {
  declare -a curl_args=(-sSL)
  if [[ -n "${GITHUB_PAT:-}" ]] ; then
    curl_args+=("-H" "Authorization: token $GITHUB_PAT")
  fi
  command curl "${curl_args[@]}" "$@"
}

next_page_url () {
  declare current_url="$1"
  curl -I "$current_url" \
    | grep -E '^Link:' \
    | grep -Eo '<[^[:space:]]+>; rel="next"' \
    | sed -e 's/^<//; s/>; rel="next"//' || true
}

function join_by {
  local IFS="$1"; shift
  echo "$*"
}

main () {
  declare github_user="${1:-}"
  if [[ -z "$github_user" ]] ; then
    >&2 echo "Syntax: ${BASH_SOURCE[0]##*/} <github_user>"
    exit 64
  fi

  declare api_url="https://api.github.com"
  declare query_url="$api_url/users/$github_user/repos?type=sources&private=false&per_page=100"
  declare -a fields=(name description language html_url created_at updated_at)
  declare jq_fields="$(join_by , "${fields[@]/#/.}")"

  join_by , "${fields[@]}"

  while [[ -n "$query_url" ]] ; do
    curl "$query_url" \
      | jq -r '.[]|select(.fork==false)|select(.private==false)|['$jq_fields']|"\"" + join("\",\"") + "\""'
    query_url="$(next_page_url "$query_url")"
  done

  exit 0
}

main "$@"
