#!/bin/bash -e

LC_ALL="en_US.UTF-8"
export LANG=en_GB.utf8

sudo yum install autoconf libtool re2c bison libzip libzip-devel libxml2-devel bzip2-devel libcurl-devel libpng-devel cmake libicu-devel gcc-c++ libmcrypt-devel libwebp-devel libjpeg-devel openssl-devel openldap-devel freetype-devel.x86_64 libtidy.x86_64 libtidy-devel.x86_64 libxslt.x86_64 libxslt-devel.x86_64 glibc-utils.x86_64 -y
ln -s /usr/lib64/libldap.so /usr/include/libldap.so && ln -s /usr/lib64/liblber.so /usr/include/liblber.so

#Download pickle
git clone https://github.com/FriendsOfPHP/pickle.git /tmp/pickle
ln -s /tmp/pickle/bin/pickle /usr/bin/

echo "============ Installing phpenv ============="
git clone git://github.com/CHH/phpenv.git $HOME/phpenv
$HOME/phpenv/bin/phpenv-install.sh
echo 'export PATH=$HOME/.phpenv/bin:$PATH' >> /etc/drydock/.env
echo 'export PATH=$HOME/.phpenv/libexec:$PATH' >> /etc/drydock/.env
rm -rf $HOME/phpenv

export PATH=$HOME/.phpenv/bin:$PATH
echo "PATH=$HOME/.phpenv/bin:$PATH"
export PATH=$HOME/.phpenv/libexec:$PATH
echo "PATH=$HOME/.phpenv/libexec:$PATH"
eval "$(phpenv init -)"

# Install php-build
echo "============ Installing php-build =============="
git clone git://github.com/php-build/php-build.git $HOME/php-build
$HOME/php-build/install.sh
rm -rf $HOME/php-build

# Install librabbitmq
echo "============ Installing librabbitmq ============"
cd /tmp && wget -nv https://github.com/alanxz/rabbitmq-c/releases/download/v0.7.1/rabbitmq-c-0.7.1.tar.gz
tar xzf rabbitmq-c-0.7.1.tar.gz
mkdir build && cd build
cmake /tmp/rabbitmq-c-0.7.1
cmake -DCMAKE_INSTALL_PREFIX=/usr/local /tmp/rabbitmq-c-0.7.1
cmake --build . --target install
cd /tmp/rabbitmq-c-0.7.1
autoreconf -i
./configure
make
make install
cd /

for file in /c7phpall/version/*.sh;
do
  . $file
done

# Cleaning package lists
echo "================= Cleaning package lists ==================="
yum clean all
yum autoremove

cd /
