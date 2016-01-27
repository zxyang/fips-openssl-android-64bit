rm -rf openssl-1.0.2e
tar -zxf openssl-1.0.2e.tar.gz

. ./setenv-reset.sh
. ./setenv-android64.sh
cd openssl-1.0.2e
  
  perl -pi -e 's/SHARED_LIBS=\n/SHARED_LIBS=\$(SHARED_CRYPTO) \$(SHARED_SSL)\n/' Makefile.org
  perl -pi -e 's/install: all install_docs install_sw/install: install_sw/g' Makefile.org
 
  perl -pi -e 's/"linux-aarch64"/"linux-aarch64" ;;\n aarch64-*-android) OUT="android64-aarch64"/' config

  perl -pi -e 's/"android"/"android64-aarch64","gcc:-mandroid -fPIC -I\\\$(ANDROID_DEV)\/include -B\\\$(ANDROID_DEV)\/lib -O3 -Wall::-D_REENTRANT::-pie%-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:\${aarch64_asm}:linux64:dlfcn:linux-shared:::.so.\\\$(SHLIB_MAJOR).\\\$(SHLIB_MINOR)",\n "android"/' Configure


./config shared fips no-ssl2 no-ssl3 no-comp no-hw no-engine \
 --openssldir=${PWD}/../openssl/arm64 \
 --with-fipsdir=${PWD}/../fips/arm64 \
 --with-fipslibdir=${PWD}/../fips/arm64/lib/

make depend
make 
make install
