#!/usr/bin/env bash

# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eEuo pipefail

PORT="${PORT:-8080}"

RESPONSE="$(cat <<EOF
HTTP/1.1 200 OK
Connection: keep-alive

Hello World!\r\n
EOF
)"

echo "Listening on ${PORT}..."
while { echo -en "$RESPONSE"; } | nc -l -s "0.0.0.0" -p "${PORT}"; do
  echo "================================"
done
