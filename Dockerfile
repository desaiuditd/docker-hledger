FROM alpine:3.15.0

USER root

RUN cd /tmp && \
    wget https://github.com/apauley/hledger-flow/releases/download/v0.15.0/hledger-flow_Linux_x86_64_v0.15.0_2b025fe.tar.gz && \
    tar -xf hledger-flow_Linux_x86_64_v0.15.0_2b025fe.tar.gz && \
    cd hledger-flow_Linux_x86_64_v0.15.0_2b025fe && \
    chmod +x hledger-flow && \
    chown -R root:root hledger-flow && \
    mv hledger-flow /usr/bin/ && \
    cd ../ && \
    rm -rf hledger-flow_Linux_x86_64_v0.15.0_2b025fe hledger-flow_Linux_x86_64_v0.15.0_2b025fe.tar.gz
