# forensics

## apfs

* install for Linux  
```shell
sudo apt-get update
sudo apt-get install libattr1-dev
sudo apt-get install libicu-dev
git clone https://github.com/sgan81/apfs-fuse
cd apf-fuse
mkdir build
cd build
cmake ..
make
ewfmount <image name> <mount point>
```

## 参考にしたサイト

http://az4n6.blogspot.com/2018/01/mounting-apfs-image-in-linux.html