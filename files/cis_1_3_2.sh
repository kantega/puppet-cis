#!/usr/bin/env bash

SUDO_FILES=$(find /etc/sudoers /etc/sudoers.d -type f)

for file in $SUDO_FILES; do
  grep -Ei '^\s*Defaults\s+(\[^#]+,\s*)?use_pty' $file
  if [ "$?" != "0" ]; then
    exit 1
  fi
done

exit 0
