##############################
# mysql Dockerfile
################################

# Use BlueData base image 
FROM bluedata/centos7

# Install packages with silent (unattended) option
RUN sudo yum -y install http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm \
&& sudo yum -y install mysql-community-server

COPY setup.sh /
