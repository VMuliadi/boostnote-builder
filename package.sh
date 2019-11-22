#!/bin/bash
current_version=$(curl --silent \
  "https://raw.githubusercontent.com/BoostIO/Boostnote/master/package.json" | \
  jq .version | tr -d '"'
)

docker build -t boostnote-builder .
docker run -v $(pwd):/Boostnote/dist/ boostnote-builder
sudo chown -R ${USER}: .
tar -cvf Boostnote-${current_version}-linux-x64.tar.gz Boostnote-linux-x64/
rm -rf Boostnote-linux-x64
