#!/bin/bash

# correct rights for gnupg

sudo chown -R $USER:$USER ~/.gnupg
sudo find ~/.gnupg -type d -exec chmod 700 {} \;
sudo find ~/.gnupg -type f -exec chmod 600 {} \;
