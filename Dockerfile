FROM bitnami/minideb:latest

USER root

# Set locale. Needed for hledger.
ENV LC_ALL C.UTF-8

# Install tools.
RUN apt update -y && apt install wget unzip -y

# Download hledger
RUN cd /tmp && \
    wget https://github.com/simonmichael/hledger/releases/download/1.31/hledger-linux-x64.zip && \
    unzip hledger-linux-x64.zip && \
    tar -xf hledger-linux-x64.tar && \
    chmod +x hledger && \
    chown -R root:root hledger && \
    mv hledger /usr/bin/ && \
    rm -rf hledger-linux-x64.zip hledger-linux-x64.tar hledger-ui hledger-web

# Download hledger-flow.
RUN cd /tmp && \
    wget https://github.com/apauley/hledger-flow/releases/download/v0.15.0/hledger-flow_Linux_x86_64_v0.15.0_2b025fe.tar.gz && \
    tar -xf hledger-flow_Linux_x86_64_v0.15.0_2b025fe.tar.gz && \
    cd hledger-flow_Linux_x86_64_v0.15.0_2b025fe && \
    chmod +x hledger-flow && \
    chown -R root:root hledger-flow && \
    mv hledger-flow /usr/bin/ && \
    cd ../ && \
    rm -rf hledger-flow_Linux_x86_64_v0.15.0_2b025fe hledger-flow_Linux_x86_64_v0.15.0_2b025fe.tar.gz

# Remove unwanted tools.
RUN apt remove wget unzip -y && apt autoremove -y && apt autoclean -y

# Set ledger journal file. Consumers will have to put their ledger journal files at this location.
RUN echo "include /ledger/all-years.journal" > /root/.hledger.journal
