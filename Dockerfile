FROM adoptopenjdk:8-jdk-hotspot

ARG HOST_UID
ARG HOST_USER

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt -y install git maven nano nodejs \ 
    && rm -rf /var/lib/apt/lists/* \
    && sed -i 's|</settings>|<localRepository>/peregrine/.m2/repository</localRepository></settings>|' /etc/maven/settings.xml

RUN mkdir -p /opt/scripts
COPY scripts/* /opt/scripts/
RUN chmod a+x /opt/scripts/*.sh

ENV PATH=/opt/scripts:${PATH}

RUN useradd -u $HOST_UID --create-home -s /bin/bash $HOST_USER

USER $HOST_UID

WORKDIR /peregrine

EXPOSE 8080

ENTRYPOINT ["bash"]
