#!/bin/bash
oc process -f sso72-oracle.json \
-p IMAGE_STREAM_NAMESPACE=sso-build \
-p SSO_TRUSTSTORE=truststore.jks \
-p HTTPS_NAME=jboss -p HTTPS_PASSWORD=mykeystorepass \
-p SSO_ADMIN_USERNAME=admin -p SSO_ADMIN_PASSWORD=Sion2018! \
-p DB_DATABASE=testdb -p DB_PASSWORD=tiget -p DB_USERNAME=scott
