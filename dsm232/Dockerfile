FROM ubuntu:14.04
LABEL miantainer="gpioblink <https://github.com/gpioblink>"

# prevent user interaction with tzdata ref: https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update
RUN apt-get install -y patch g++ bison flex gettext texinfo cmake
RUN apt-get install -y wget unrar gcc-multilib python rsync unzip
RUN mkdir /env
WORKDIR /env

RUN wget https://dlink-gpl.s3.amazonaws.com/GPL1300078/DSM-232_A1_GPL_FWv1.02.00.rar \
    && unrar x DSM-232_A1_GPL_FWv1.02.00.rar
RUN tar xf DSM232-A1_FOSS_20130819.tgz
RUN tar xf arm-2010q1.tgz -C /opt

WORKDIR /env/ott

# inject m4-1.4.17 to avoid an error ref: https://lists.gnu.org/archive/html/bug-m4/2012-08/msg00006.html
RUN wget -O crisprelease/buildroot/tarfiles/m4-1.4.16.tar.bz2 https://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.bz2

# add patch ref: https://kclin.tw/2014/09/05/autoconf-2-65-build-error-must-be-after-defmac-to-use-defmacx/
COPY autoconf-2.65-fix-macro-expression.patch crisprelease/buildroot/package/autoconf

ENV ROOTDIR /env/ott
ENV CROSS_COMPILE arm-none-linux-gnueabi-
ENV CRISP_RELEASE $ROOTDIR/crisprelease
ENV CNC_PLATFORM $ROOTDIR/6611L_TigaMini
ENV CRISP_STAGING $ROOTDIR/mediademo/work/staging
ENV CRISP_APP_OUTPUT_PATH $ROOTDIR/mediademo/work/target
ENV OPENSOURCE_PATH $ROOTDIR/mediademo/work/build
ENV OPENSOURCE_LIB $ROOTDIR/mediademo/work/target/usr/lib
ENV PATH /opt/arm-2010q1/bin:$CRISP_RELEASE/tools/bin/:$ROOTDIR/tools:$PATH

CMD ["./buildgpl.sh", "all"]
