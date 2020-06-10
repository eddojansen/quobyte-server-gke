FROM quay.io/quobyte/quobyte-server:2.23.4
RUN yum install -y wget
RUN wget -O /etc/yum.repos.d/quobyte.repo  https://packages.quobyte.com/repo/3/2dc3276fa0Cf532119d046eb9c35ed4c/rpm/CentOS_7/quobyte.repo 
RUN yum install -y quobyte-client quobyte-nfs
ADD ./templates/RF3.cfg /RF3.cfg
ADD ./templates/RF1.cfg /RF1.cfg
ADD ./templates/EC42.cfg /EC42.cfg
ADD ./templates/S3-objects.cfg /S3-objects.cfg
ADD ./templates/system.cfg /system.cfg
ADD ./main.sh /opt/main.sh
ENV QUOBYTE_SERVICES="registry api metadata data webconsole s3 nfs"
CMD ["/opt/main.sh"]
