FROM ubuntu:14.04
LABEL miantainer="gpioblink <https://github.com/gpioblink>"

# prevent user interaction with tzdata ref: https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update
RUN apt-get install -y patch g++ bison flex gettext texinfo cmake
RUN apt-get install -y wget unrar gcc-multilib python rsync unzip bc
RUN mkdir /env
WORKDIR /env

RUN wget https://dlink-gpl.s3.amazonaws.com/GPL1400174/DSM-260%20A1_ver1.04.00_FOSS.tar.gz \
    && tar xf 'DSM-260 A1_ver1.04.00_FOSS.tar.gz' --strip-components 2
RUN tar xf DSM260-A1_FOSS.tgz
RUN tar xf arm-2010q1.tgz -C /opt
RUN rm -f 'DSM-260 A1_ver1.04.00_FOSS.tar.gz' 'DSM260-A1_FOSS_20130826.tgz' 'arm-2010q1.tgz'
WORKDIR /env/dsm260_GPL

ENV ROOTDIR /env/dsm260_GPL

ENV CROSS_COMPILE arm-none-linux-gnueabi-
ENV ROOTDIR /env/dsm260_GPL/dongle
ENV PATH /opt/arm-2010q1/bin:/env/dsm260_GPL/dongle/security/esp:/env/dsm260_GPL/dongle/tools:/usr/local/Trolltech/QtEmbedded-4.8.2-arm/bin/:$PATH

CMD ./build.sh && cd ./dongle &&./gen.sh
