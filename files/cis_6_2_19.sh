#!/bin/bash

shadow_group=$(grep ^shadow:[^:]*:[^:]*:[^:]+ /etc/group)
shadow_user=$(awk -F: '($4 == "<shadow-gid>") { print }' /etc/passwd)
echo $shadow_group $shadow_user
