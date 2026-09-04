#!/usr/bin/env bash
set -euo pipefail

readonly chooser_url="https://developer.lazycat.cloud/lazycat-injects/lzc-file-chooser-inject.js"
readonly chooser_sha256="f0cc087e00505308cdf826e9adbef8edf043da2d6430f4be5a6edc5ea98c9637"
readonly chooser_dir="content/lazycat-injects"
readonly chooser_path="${chooser_dir}/lzc-file-chooser-inject.js"

mkdir -p "${chooser_dir}"
temporary_file="$(mktemp)"
trap 'rm -f "${temporary_file}"' EXIT

curl --fail --silent --show-error --location "${chooser_url}" --output "${temporary_file}"
printf '%s  %s\n' "${chooser_sha256}" "${temporary_file}" | sha256sum --check --status
install -m 0644 "${temporary_file}" "${chooser_path}"
