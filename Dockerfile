FROM cimg/base:stable
MAINTAINER jorritvdven <ja.ven@portofrotterdam.com>

ENV PLANTUML_VERSION 1.2020.2
RUN sudo apt install openjdk-13-jdk graphviz \
    && sudo mkdir /opt/plantuml \
    && sudo curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /usr/share/java/plantuml.jar

COPY plantuml.sh /usr/local/bin/plantuml
RUN sudo chmod +x /usr/local/bin/plantuml

USER circleci
CMD ["/bin/sh"]