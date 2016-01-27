rm -rf openssl-1.0.2e
tar -zxf openssl-1.0.2e.tar.gz

. ./setenv-reset.sh
. ./setenv-android.sh

cd openssl-1.0.2e

perl -pi -e 's/SHARED_LIBS=\n/SHARED_LIBS=\$(SHARED_CRYPTO) \$(SHARED_SSL)\n/' Makefile.org

perl -pi -e 's/install: all install_docs install_sw/install: install_sw/g' Makefile.org

./config fips no-ssl2 no-ssl3 no-comp no-hw no-engine \
 --openssldir=${PWD}/../openssl/arm7 \
 --with-fipsdir=${PWD}/../fips/arm7 \
 --with-fipslibdir=${PWD}/../fips/arm7/lib/


make depend
make all
make install
