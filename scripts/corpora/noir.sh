#!/usr/bin/env bash

set -e

repos=(
    "noir-lang/noir"
)
mkdir -p noir-lang
for repo in "${repos[@]}"; do
  base=$(basename "${repo}")
  echo $base
  if ! [[ -d "${base}" ]]; then
    git clone --jobs 4 --depth 1 "https://github.com/${repo}"
  fi
  for f in $(find "${base}" -type f -name "*.nr"); do
    echo "${f}"
    cp "${f}" noir-lang/"${base}-$(sha256sum "${f}" | head -c 5)-$(basename "${f}")"
  done
done