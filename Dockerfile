FROM  redhat-sso-7/sso72-openshift:latest


USER jboss

ADD themes/ $JBOSS_HOME/themes/  

#chown -R jboss:root $JBOSS_HOME

RUN $JBOSS_HOME/bin/add-user-keycloak.sh -r master  -u admin -p Sion2018!
