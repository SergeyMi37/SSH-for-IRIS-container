ARG IMAGE=intersystemsdc/iris-community:latest
FROM $IMAGE

USER root

COPY ssh/ssh* /
RUN apt-get update \
 && apt-get install ssh -y \
 && /sshini.sh
 
ENTRYPOINT /iris-main -a /sshstart.sh

WORKDIR /opt/irisbuild
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisbuild
USER ${ISC_PACKAGE_MGRUSER}

COPY src src
COPY module.xml module.xml
COPY iris.script iris.script

RUN iris start IRIS \
    && iris session IRIS < iris.script \
    && iris stop IRIS quietly 
