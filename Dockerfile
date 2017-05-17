FROM centos:centos7
MAINTAINER Health Catalyst <imran.qureshi@healthcatalyst.com>

## Set a default user. Available via runtime flag `--user docker` 
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory (for rstudio or linked volumes to work properly). 
RUN useradd docker \
	&& mkdir -p /home/docker \
	&& chown docker:docker /home/docker
 
RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all

# install packages for authentication with Active Directory
RUN yum -y install authconfig krb5-workstation pam_krb5 samba-common oddjob-mkhomedir sudo ntp; yum clean all

# create /opt/install folder
# RUN mkdir -p /opt/install/

# add script to create keytab file for kerberos authentication with Active Directory
ADD https://imranq2.github.io/InstallScripts/setupkeytab.txt /opt/install/setupkeytab.sh
ADD https://imranq2.github.io/InstallScripts/signintoactivedirectory.txt /opt/install/signintoactivedirectory.sh

