rm -rf openssl-fips-2.0.11
tar -zxf openssl-fips-2.0.11.tar.gz

. ./setenv-reset.sh
. ./setenv-android.sh

cd openssl-fips-2.0.11

 ./config  
 make
 make install
 cp ./util/incore $FIPSDIR/incore
