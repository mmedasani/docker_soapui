FROM openjdk:8-jre-alpine

# Install curl
RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

# SOAP UI Version to download
ENV SOAPUI_VERSION 5.4.0

# Download and unarchive SoapUI
RUN mkdir -p /opt &&\
    curl  https://s3.amazonaws.com/downloads.eviware/soapuios/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz \
    | gunzip -c - | tar -xf - -C /opt && \
    ln -s /opt/SoapUI-${SOAPUI_VERSION} /opt/SoapUI

# Set environment
ENV PATH ${PATH}:/opt/SoapUI/bin

WORKDIR /opt/SoapUI/bin

RUN ls /opt/SoapUI/bin

RUN mkdir -p /opt/SoapUI/bin &&\
    curl https://download.microsoft.com/download/3/F/7/3F74A9B9-C5F0-43EA-A721-07DA590FD186/sqljdbc_6.2.2.1_enu.tar.gz  \
    | gunzip -c - |tar -xf - -C /opt/SoapUI/bin && \
    ln -s /opt/SoapUI/bin/sqljdbc_6.2/enu/* /opt/SoapUI/bin

ENTRYPOINT ["testrunner.sh"]

