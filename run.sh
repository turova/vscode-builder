#!/usr/bin/env bash

git clone https://github.com/microsoft/vscode
cd vscode
git checkout 1.16.1

# Add extension gallery support
sed -i "s/^}/\t,\"extensionsGallery\": {\n\t\t\"serviceUrl\": \"https:\/\/marketplace.visualstudio.com\/_apis\/public\/gallery\",\n\t\t\"cacheUrl\": \"https:\/\/vscode.blob.core.windows.net\/gallery\/index\",\n\t\t\"itemrl\": \"https:\/\/marketplace.visualstudio.com\/items\"\n\t}\n}/g" product.json

./scripts/npm.sh install --arch=x64 --unsafe-perm

# Build code-oss
gulp vscode-linux-x64-min

# Build DEB
gulp vscode-linux-x64-build-deb
cp .build/linux/deb/amd64/deb/*.deb /out

# Build RPM
#gulp vscode-linux-x64-build-rpm
#cp ./.build/linux/rpm/x86_64/*.rpm /out

# Uncomment this to keep the container running after the build finishes
#while true; do echo "Done..." && sleep 1000; done