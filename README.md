# vscode-builder
Docker container and associated scripts to build a vscode-oss DEB and RPM from source

## Directions

```
git clone 
cd vscode-builder
./build.sh
#When script finishes, a .deb installer will appear in ./out/
```

## Notes
* Uncomment "Build RPM" section in run.sh to build a .rpm
* Uncomment the last line to keep container alive after build finishes
* The resulting installer has support for the extension gallery (ability to install extensions directly from the vscode UI). Comment the ```Add extension gallery support``` section to disable.
* Currently, the resulting .deb and .rpm files will be owned by root
