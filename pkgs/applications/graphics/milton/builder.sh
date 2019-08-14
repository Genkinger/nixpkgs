source $stdenv/setup
tar -xzf $src
cd $name
bash ./build-lin.sh $cmakeFlags
mkdir -p $out/bin
cp ./build/Milton $out/bin
