maintainer       "Miah Johnson"
maintainer_email "miah@chia-pet.org"
license          "Apache 2.0"
name             "collectd"
description      "Install and configure the collectd monitoring daemon"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "2.0.0"

%w( ubuntu centos ).each { |os| supports os }

depends "apt"
depends "yum"
depends "ark", ">= 0.3.0"
depends "build-essential"
depends "logrotate"
depends "runit"
