#!/bin/bash -l
cd /Users/mauz/.cocoapods/repos/sozvers-svapps-mirrors-cocoapods/ && git pull

# edit crontab (crontab -e) and add the following line, which will run it every four hours:
# 0 0/4 * * * ~/dev/dotfiles/update_cocoapods.sh