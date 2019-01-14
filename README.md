c7phpall
===============

Shippable CI image for PHP on CentOS 7. Available PHP versions:

  1. PHP 7.1.25
  2. PHP 7.2.14
  3. PHP 7.3.1
  

Each PHP version is installed with php-build and managed with phpenv. Several 
PHP extensions are also available out of the box. Unless otherwise noted, the 
latest version of the extension at the time the image was built is what is 
available in the image:

  1. PHP 7.1.25, PHP 7.2.14 and 7.3.1

      * amqp
      * bzip
      * intl
      * memcached
      * redis
      * zmq
      
c7phpall Docker Hub repo: [drydock/c7phpall](https://hub.docker.com/r/drydock/c7phpall/)

**Services**

This image is built on top of [c7all](https://github.com/dry-dock/c7all) .Please check 
there for a list of all the services.
