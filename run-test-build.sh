# clean
obd cluster destroy final_2022
killall -9 clang
killall -9 clang++

# build
bash build.sh release --init --make -j4

# create image
cd build_release
mkdir -p usr/local/{bin,etc,admin}
mv src/observer/observer usr/local/bin
obd mirror create -n oceanbase-ce -V 4.0.0.0 -p ./usr/local/ -f -t final_2022
cd ..

# deploy
obd cluster autodeploy final_2022 -c final_2022.yaml -f
tools/tpch-tools/bin/create-tpch-tables.sh
