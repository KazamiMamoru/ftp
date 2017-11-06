ubuntu run ftp server
=====================
#透過 Dockerfile 來 build image，然後使用container來執行image
#ftp://192.168.21.211

#運行docker時，設定21和9999port
#用命令構建和運行：
#docker build -t kazamimamoru/ftp .
#docker run -d -p 21:21 -p 9999:9999 -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /etc/group:/etc/group:ro -v /home:/home kazamimamoru/ftp

FROM ubuntu:16.04
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y -q --no-install-recommends vsftpd
RUN apt-get clean

RUN echo "local_enable=YES" >> /etc/vsftpd.conf
RUN echo "chroot_local_user=YES" >> /etc/vsftpd.conf
RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
RUN echo "write_enable=YES" >> /etc/vsftpd.conf
RUN echo "pasv_enable=YES" >> /etc/vsftpd.conf
RUN echo "pasv_min_port=9999" >> /etc/vsftpd.conf
RUN echo "pasv_max_port=9999" >> /etc/vsftpd.conf
RUN echo "pasv_address=192.168.21.211" >> /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty

EXPOSE 21/tcp
EXPOSE 9999/tcp

CMD vsftpd
