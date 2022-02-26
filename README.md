# goldsam/mkdocs

[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/goldsam/mkdocs)](https://hub.docker.com/repository/docker/goldsam/mkdocs)

[MkDocs](https://www.mkdocs.org/) with a selection of extensions and supporting tools. 

## Usage

To `serve` MkDocs against a project in the current directory:

```shell
MSYS_NO_PATHCONV=1 docker run -it --rm -v $(pwd):/docs -p 8000:8000 goldsam/mkdocs serve
```

## Python packages

This image provides a numeer of preinstalled Python/mkdocs packages as well as their prerequisite system packages:

|Package|Version Variable|
|-|-|
|[mkdocs](https://github.com/mkdocs/mkdocs)|`MKDOCS_VERSION`|
|[plantuml-markdown](https://github.com/mikitex70/plantuml-markdown)|`PLANTUML_MARKDOWN_VERSION`|
|[mkdocs-material](https://github.com/squidfunk/mkdocs-material)|`MKDOCS_MATERIAL_VERSION`|
|[mkdocs-awesome-pages-plugin](https://github.com/lukasgeiter/mkdocs-awesome-pages-plugin)|`MKDOCS_AWESOME_PAGES_PLUGIN_VERSION`|
|[mkdocs-jupyter](https://github.com/danielfrg/mkdocs-jupyter)|`MKDOCS_JUPYTER_VERSION`|
|[mknotebooks](https://github.com/greenape/mknotebooks)|`MKNOTEBOOKS_VERSION`|
|[mkdocs-macros-plugin](https://github.com/fralau/mkdocs_macros_plugin)|`MKDOCS_MACROS_PLUGIN_VERSION`|

