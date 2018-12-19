FROM circleci/openjdk:11.0.1-jdk
MAINTAINER jorritvdven <jorrit@jorritvdven.nl>

ENV PLANTUML_VERSION 1.2018.13
RUN sudo apt install graphviz \
    && sudo mkdir /opt/plantuml \
    && sudo curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /usr/share/java/plantuml.jar

COPY plantuml.sh /usr/local/bin/plantuml
RUN sudo chmod +x /usr/local/bin/plantuml

USER circleci
CMD ["/bin/sh"]