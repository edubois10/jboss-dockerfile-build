#start from eap73-openshift
FROM registry.redhat.io/jboss-eap-7/eap73-openjdk11-openshift-rhel8@sha256:16a31849c900f7935b3bb0e1d3d37267b4f4d0063e8a04a57af08ef337f15c92

# file author / maintainer
USER root
# Copy war to deployments folder

RUN echo "Starting the copy process"

COPY deployments/* /deployments/
COPY toOverlay/* /tmp/
COPY extensions/actions.cli /tmp/
#COPY ./deployments/ROOT.war $JBOSS_HOME/standalone/deployments/ROOT.war

##RUN ls /deployments
# User root to modify war owners


# Modify owners war
RUN chown jboss:jboss /deployments/ROOT.war && \
    chmod -R 775 /opt/eap && \
    chmod -R 775 /tmp
##RUN chown jboss:jboss $JBOSS_HOME/standalone/deployments/ROOT.war


# Important, use jboss user to run image
RUN $JBOSS_HOME/bin/jboss-cli.sh --file=/tmp/actions.cli}
##RUN $JBOSS_HOME/bin/jboss-cli.sh -c connect

##RUN $JBOSS_HOME/bin/jboss-cli.sh -c --file=/tmp/customize-index-html.cli


# The command is not available in the current context (e.g. required subsystems or connection to the 
# controller might be unavailable).
# error: build error: error building at STEP "RUN $JBOSS_HOME/bin/jboss-cli.sh 
# --file=/tmp/customize-index-html.cli": error while running runtime: exit status 1