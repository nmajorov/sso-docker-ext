FROM  registry.access.redhat.com/redhat-sso-7/sso72-openshift:latest


USER jboss


ADD themes/ $JBOSS_HOME/themes/

COPY /extensions /extensions


#chown -R jboss:root $JBOSS_HOME

RUN $JBOSS_HOME/bin/add-user-keycloak.sh -r master  -u admin -p Sion2018!

# Prepare for configuration
ENV DEFAULT_LAUNCH $JBOSS_HOME/bin/openshift-launch.sh
ENV DEFAULT_LAUNCH_NOSTART $JBOSS_HOME/bin/openshift-launch-nostart.sh
RUN cp $DEFAULT_LAUNCH $DEFAULT_LAUNCH_NOSTART
RUN sed -i '/^.*standalone.sh/s/^/echo/' $DEFAULT_LAUNCH_NOSTART
RUN sed -i '/^.*wait/s/^/echo/' $DEFAULT_LAUNCH_NOSTART
RUN $DEFAULT_LAUNCH_NOSTART



# Configure
RUN $JBOSS_HOME/bin/jboss-cli.sh --file=/extensions/actions.cli
#RUN $DEFAULT_LAUNCH
