### 使用方法，初次使用时创建容器，使用confluence_keygen.jar破解 ###
docker run -d -p 8090:8090 -p 8080 --name jira_confluence atlassian

### confluence设置 ###
java -jar confluence_keygen.jar

### jira设置 ###
去官网申请30天试用key

### 以后直接启动容器即可 ###
docker start jira_confluence
