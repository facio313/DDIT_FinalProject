#!/bin/sh
set -eu

page='portfolio-demo/index.html'
styles='portfolio-demo/styles.css'

assert_contains() {
  needle=$1
  file=$2
  if ! grep -Fq -- "$needle" "$file"; then
    printf 'Expected %s to contain: %s\n' "$file" "$needle" >&2
    exit 1
  fi
}

assert_contains 'class="brand bonifacio-return-link" href="https://bonifacio.work/">← Bonifacio</a>' "$page"
assert_contains 'class="bonifacio-return-link" href="https://bonifacio.work/">← Bonifacio</a>' "$page"
assert_contains 'min-width: 44px;' "$styles"
assert_contains 'min-height: 44px;' "$styles"
assert_contains '.bonifacio-return-link:focus-visible' "$styles"

printf 'Bonifacio return-link contract passed.\n'
