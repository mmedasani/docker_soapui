mkdir tmp \
&& cd tmp \
&& wget https://download.microsoft.com/download/3/F/7/3F74A9B9-C5F0-43EA-A721-07DA590FD186/sqljdbc_6.2.2.1_enu.tar.gz \
&& gzip -d sqljdbc_6.2.2.1_enu.tar.gz \
&& tar -xf sqljdbc_6.2.2.1_enu.tar \
&& mv sqljdbc_6.2/enu/* ../driver/