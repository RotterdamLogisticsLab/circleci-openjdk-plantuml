FROM cimg/base:2021.02
MAINTAINER jorritvdven <ja.ven@portofrotterdam.com>

ENV PLANTUML_VERSION 1.2021.1
RUN echo oracle-java15-installer shared/accepted-oracle-license-v1-2 select true | sudo /usr/bin/debconf-set-selections \
	&& sudo add-apt-repository ppa:linuxuprising/java \
	&& sudo apt-get update \
	&& sudo apt-get install -y oracle-java15-installer graphviz \
    && sudo mkdir /opt/plantuml \
    && sudo curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /usr/share/java/plantuml.jar \
    && sudo rm -rf /var/lib/apt/lists/*

COPY plantuml.sh /usr/local/bin/plantuml
RUN sudo chmod +x /usr/local/bin/plantuml

USER circleci
CMD ["/bin/sh"]
