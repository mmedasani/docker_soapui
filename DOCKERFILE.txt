FROM openjdk:8-jre-alpine

# Install curl
RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

# SOAP UI Version to download
ENV SOAPUI_VERSION 5.2.1

# Download and unarchive SoapUI
RUN mkdir -p /opt &&\
    curl  http://cdn01.downloads.smartbear.com/soapui/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz \
    | gunzip -c - | tar -xf - -C /opt && \
    ln -s /opt/SoapUI-${SOAPUI_VERSION} /opt/SoapUI

COPY get_driver.sh /opt/SoapUI/get_driver.sh

RUN chmod +x /opt/SoapUI/get_driver.sh
	
# Set environment
ENV PATH ${PATH}:/opt/SoapUI/bin

WORKDIR /opt/SoapUI/bin

COPY driver/* /opt/SoapUI/bin/ext
COPY driver/* /opt/SoapUI/jre/lib/ext

ENTRYPOINT ["testrunner.sh"]