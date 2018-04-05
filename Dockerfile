FROM  registry.access.redhat.com/redhat-sso-7/sso72-openshift:latest


USER jboss

RUN rm -fr $JBOSS_HOME/themes/rh-sso

ADD themes/ $JBOSS_HOME/themes/  


#chown -R jboss:root $JBOSS_HOME

RUN $JBOSS_HOME/bin/add-user-keycloak.sh -r master  -u admin -p Sion2018!
