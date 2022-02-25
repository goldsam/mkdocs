FROM openjdk:18-alpine3.15

LABEL org.opencontainers.image.authors="sam.goldmann@gmail.com"

# System packages and python modules
RUN apk --no-cache add python3 py3-httplib2 py-pip graphviz ttf-dejavu curl git \
    && pip install packaging mkdocs git+https://github.com/goldsam/python-plantuml#egg=plantuml plantuml-markdown mkdocs-material \
    && apk del git

# Plantuml 
ENV PLANTUML_VERSION 1.2022.1
RUN mkdir -p /app \
    && curl -L https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar -o /app/plantuml.jar
ENV PLANTUML_SERVER http://localhost:8001 
ENV PLANTUML_BASE_DIR /docs 

# Volumes & ports
WORKDIR /docs
VOLUME /docs
EXPOSE 8000

# Entrypoint
COPY resources/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
