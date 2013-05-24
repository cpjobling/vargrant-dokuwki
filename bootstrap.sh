#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
apt-get install -y php5 php5-gd
apt-get install -y git

# Install Dokuwiki
DOC_ROOT=/var/www
cd ${DOC_ROOT}
if [ ! -d ${DOC_ROOT}/dokuwiki ];
then
  git clone git://github.com/splitbrain/dokuwiki.git
  cd dokuwiki
  git checkout -b stable origin/stable
else
  cd ${DOC_ROOT}/dokuwiki
  git pull
fi

# Set up DokuWiki permisions
chown -R www-data:www-data ${DOC_ROOT}/dokuwiki/conf/
chmod 755 ${DOC_ROOT}/dokuwiki/conf/
chmod -R 755 ${DOC_ROOT}/dokuwiki/data/
chown -R www-data:www-data ${DOC_ROOT}/dokuwiki/data/
chmod 2775 ${DOC_ROOT}/dokuwiki/data/{attic,cache,index,locks,media,meta,pages,tmp}
chown www-data:www-data ${DOC_ROOT}/dokuwiki/data/{attic,cache,index,locks,media,meta,pages,tmp}
if [ -e ${DOC_ROOT}/dokuwiki/install.php ]; then
  rm ${DOC_ROOT}/dokuwiki/install.php
fi
ln -sf /vagrant/dokuwki/conf/*.php ${DOC_ROOT}/dokuwiki/conf
chmod 644 ${DOC_ROOT}/dokuwiki/conf/{local.php,users.auth.php,acl.auth.php,plugins.local.php}



