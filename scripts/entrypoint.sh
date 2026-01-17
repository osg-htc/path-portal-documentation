#!/bin/bash

cd /docs/user-documentation

python3 scripts/link-docs.py

echo "I have built the User Documentation"

cd /docs

exec mkdocs "$@"