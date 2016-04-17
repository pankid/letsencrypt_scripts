#!/bin/sh
ACME_TINY="/usr/local/bin/acme-tiny/acme_tiny.py"
PYTHON="/usr/bin/python2.7"
ACCOUNT_KEY="/etc/letsencrypt/letsencrypt_account.key"
CHALLENG_DIR="/var/www/challenges/"
LETSENCRYPT_PEM="https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem"
INTERMEDIATE_PEM="/etc/letsencrypt/intermediate.pem"
DOMAIN_LIST="/etc/letsencrypt/domain_list.txt"

while read DOMAIN; do

	$PYTHON $ACME_TINY --account-key $ACCOUNT_KEY --csr /etc/letsencyrpt/live/$DOMAIN/$DOMAIN.csr --acme-dir $CHALLENG_DIR > /tmp/$DOMAIN.crt || exit wget -O - $LETSENCRYPT_PEM > $INTERMEDIATE_PEM 
	cat /tmp/$DOMAIN.crt $INTERMEIDATE_PEM > /etc/letsencrypt/live/$DOMAIN/$DOMAIN.pem

done < $DOMAIN_LIST
