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
