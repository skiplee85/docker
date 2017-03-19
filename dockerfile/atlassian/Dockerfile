FROM java:8
RUN sed -i 's/http:\/\/deb.debian.org\/debian/http:\/\/mirrors.aliyun.com\/debian/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y tcl expect

ENV INSTALL_PATH /opt/
ENV INSTALL_CONFLUENCE atlassian-confluence-5.6.6-x64.bin
ENV INSTALL_JIRA atlassian-jira-software-7.2.2-x64.bin

# COPY  $INSTALL_CONFLUENCE $INSTALL_PATH
# COPY  $INSTALL_JIRA $INSTALL_PATH
RUN wget https://www.atlassian.com/software/confluence/downloads/binary/$INSTALL_CONFLUENCE $INSTALL_PATH
RUN wget https://downloads.atlassian.com/software/jira/downloads/$INSTALL_JIRA $INSTALL_PATH
COPY install.sh /opt/
RUN chmod +x /opt/* 

# install confluence
RUN /opt/install.sh $INSTALL_PATH$INSTALL_CONFLUENCE\
    && /etc/init.d/confluence stop\
    && rm -rf /opt/atlassian/confluence/confluence/WEB-INF/lib/atlassian-extra*
COPY confluence/* /opt/atlassian/confluence/confluence/WEB-INF/lib/
COPY mysql-connector-java-5.1.39-bin.jar /opt/atlassian/confluence/confluence/WEB-INF/lib/

# install jira
RUN /opt/install.sh $INSTALL_PATH$INSTALL_JIRA
COPY jira/* /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/
COPY mysql-connector-java-5.1.39-bin.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/

# port
EXPOSE 8080 8090

# clean
RUN rm -rf /opt/atlassian-*

WORKDIR /opt/
COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
