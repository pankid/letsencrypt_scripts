#!/bin/sh

#https://github.com/diafygi/acme-tiny

SITE=owncloud.nschoonover.com

#get letsencrypt intermeidate cert to create a .pem with both my cert and intermediate for apache2. 
wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > /etc/letsencrypt/intermediate.pem


cat /etc/letsencrypt/live/$SITE/$SITE /etc/letsencrypt/intermediate.pem > /etc/letsencrypt/live/$SITE/$SITE.pem
