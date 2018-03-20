FROM openjdk:8-jdk-alpine

ENV RUN_USER            daemon
ENV RUN_GROUP           daemon

ENV JIRA_HOME          /var/atlassian/application-data/jira
ENV JIRA_INSTALL_DIR   /opt/atlassian/jira

VOLUME ["${JIRA_HOME}"]

# Expose HTTP and Synchrony ports
EXPOSE 8080

WORKDIR $JIRA_HOME

CMD ["/entrypoint.sh", "-fg"]
ENTRYPOINT ["/sbin/tini", "--"]

RUN apk update -qq \
    && update-ca-certificates \
    && apk add ca-certificates wget curl openssh bash procps openssl perl ttf-dejavu tini libc6-compat \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
COPY entrypoint.sh              /entrypoint.sh

ARG JIRA_VERSION=7.7.1
ARG DOWNLOAD_URL=https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-${JIRA_VERSION}.tar.gz

RUN mkdir -p            ${JIRA_INSTALL_DIR} \
    && curl -L --silent ${DOWNLOAD_URL} | tar -xz --strip-components=1 -C "$JIRA_INSTALL_DIR" \
    && sed -i -e 's/java version/openjdk version/g' ${JIRA_INSTALL_DIR}/bin/check-java.sh \
    && sed -i -e 's/-Xms\([0-9]\+[kmg]\) -Xmx\([0-9]\+[kmg]\)/-Xms\${JVM_MINIMUM_MEMORY:=\1} -Xmx\${JVM_MAXIMUM_MEMORY:=\2} \${JVM_SUPPORT_RECOMMENDED_ARGS} -Djira.home=\${JIRA_HOME}/g' ${JIRA_INSTALL_DIR}/bin/setenv.sh \
    && sed -i -e 's/port="8080"/port="8080" secure="${catalinaConnectorSecure}" scheme="${catalinaConnectorScheme}" proxyName="${catalinaConnectorProxyName}" proxyPort="${catalinaConnectorProxyPort}"/' ${JIRA_INSTALL_DIR}/conf/server.xml

ADD mysql-connector-java-5.1.38-bin.jar ${JIRA_INSTALL_DIR}/atlassian-jira/WEB-INF/lib/mysql-connector-java-5.1.38-bin.jar
ADD atlassian-extras-3.2.jar ${JIRA_INSTALL_DIR}/atlassian-jira/WEB-INF/lib/atlassian-extras-3.2.jar
ADD atlassian-universal-plugin-manager-plugin-2.22.4.jar ${JIRA_INSTALL_DIR}/atlassian-jira/WEB-INF/atlassian-bundled-plugins/atlassian-universal-plugin-manager-plugin-2.22.4.jar
