FROM atlassian/confluence-server:6.6

ADD mysql-connector-java-5.1.38-bin.jar ${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/lib/mysql-connector-java-5.1.38-bin.jar
ADD atlassian-extras-decoder-v2-3.2.jar ${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/lib/atlassian-extras-decoder-v2-3.2.jar
ADD atlassian-universal-plugin-manager-plugin-2.22.5.jar ${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/atlassian-bundled-plugins/atlassian-universal-plugin-manager-plugin-2.22.5.jar

RUN chown -R ${RUN_USER}:${RUN_GROUP} \
    ${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/lib/mysql-connector-java-5.1.38-bin.jar \
    ${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/lib/atlassian-extras-decoder-v2-3.2.jar \
    ${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/atlassian-bundled-plugins/atlassian-universal-plugin-manager-plugin-2.22.5.jar

CMD ["/entrypoint.sh", "-fg"]

ENTRYPOINT ["/sbin/tini", "--"]