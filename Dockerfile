FROM openjdk:8-jre-alpine

# Install curl
RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

# SOAP UI Version to download
ENV SOAPUI_VERSION 5.5.0

# Download and unarchive SoapUI
RUN mkdir -p /opt &&\
    curl  https://s3.amazonaws.com/downloads.eviware/soapuios/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz \
    | gunzip -c - | tar -xf - -C /opt && \
    ln -s /opt/SoapUI-${SOAPUI_VERSION} /opt/SoapUI

# Set environment
ENV PATH ${PATH}:/opt/SoapUI/bin

WORKDIR /opt/SoapUI/bin

COPY *.jar /opt/SoapUI/lib
COPY *.jar /opt/SoapUI/bin/ext
COPY sqljdbc_auth.dll /opt/SoapUI/lib

ENTRYPOINT ["testrunner.sh"]
