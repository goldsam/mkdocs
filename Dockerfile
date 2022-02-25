FROM openjdk:18-alpine3.15

LABEL org.opencontainers.image.authors="sam.goldmann@gmail.com"

ENV MKDOCS_VERSION 1.2.3
ENV PLANTUML_MARKDOWN_VERSION 3.5.1
ENV MKDOCS_MATERIAL_VERSION 8.2.1

# System packages
RUN apk --no-cache add python3 py3-httplib2 py-pip graphviz ttf-dejavu curl

# Python modules
RUN echo -e "packaging\nmkdocs==${MKDOCS_VERSION}\nplantuml-markdown==${PLANTUML_MARKDOWN_VERSION}\nmkdocs-material==${MKDOCS_MATERIAL_VERSION}\n" > /tmp/requirements.txt \
    && pip install -r /tmp/requirements.txt \
    && rm -f /tmp/requirements.txt

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
