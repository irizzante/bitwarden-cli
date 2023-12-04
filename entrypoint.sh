#!/bin/bash

set -e

bw config server ${BW_HOST}

bw login --apikey

sessionCmd=$(bw unlock --passwordenv BW_PASSWORD | grep "export BW" | cut -d' ' -f2-)

$sessionCmd

bw unlock --check

echo 'Running `bw server` on port 8087'
bw serve --hostname 0.0.0.0 #--disable-origin-protection