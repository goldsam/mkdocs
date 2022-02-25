# goldsam/mkdocs

[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/goldsam/mkdocs)](https://hub.docker.com/repository/docker/goldsam/mkdocs)

[MkDocs](https://www.mkdocs.org/) with a selection of extensions and supporting tools. 

## Usage

Try the following:

```shell
docker build . -t mkdocs
MSYS_NO_PATHCONV=1 docker run -it --rm -v $(pwd)/demo-project:/docs -p 8000:8000 mkdocs serve 
```
