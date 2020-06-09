## Try Build
```bash
nix build -f demo.nix
```

## Try Shell (Manual)
```bash
nix-shell
git clone https://github.com/awslabs/aws-lambda-cpp
pushd aws-lambda-cpp
mkdir release
pushd release
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j
popd
popd
mkdir debug
cd debug
cmake -DCMAKE_PREFIX_PATH=`pwd`/../aws-lambda-cpp/release ..
make -j
```
