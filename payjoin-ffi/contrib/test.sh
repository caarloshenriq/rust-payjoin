#!/usr/bin/env bash
set -e

cargo test --package payjoin-ffi --verbose --features=_manual-tls,_test-utils

for binding in dart javascript python; do
    (
        cd "$binding"
        bash ./contrib/test.sh
    )
done
