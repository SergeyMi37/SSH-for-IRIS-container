ARG IMAGE=intersystemsdc/iris-community:2020.3.0.221.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.4.0.524.0-zpm
FROM $IMAGE

USER root

COPY sshstart.sh  /
COPY sshacc.sh /   
RUN apt-get update \
 && apt-get install ssh -y 
 
ENTRYPOINT /iris-main -b /sshstart.sh 

WORKDIR /opt/irisbuild
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisbuild
USER ${ISC_PACKAGE_MGRUSER}

COPY  src src
COPY module.xml module.xml
COPY iris.script iris.script

RUN iris start IRIS \
	&& iris session IRIS < iris.script \
    && iris stop IRIS quietly 

USER root	
RUN /sshstart.sh
