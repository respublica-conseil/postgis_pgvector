# postgis_pgvector

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[![Push to Docker Hub](https://github.com/respublica-conseil/postgis_pgvector/actions/workflows/docker-hub.yml/badge.svg)](https://github.com/respublica-conseil/postgis_pgvector/actions/workflows/docker-hub.yml)
[![postgis_pgvector on Docker Hub](https://img.shields.io/docker/v/valazj/postgis_pgvector?label=postgis_pgvector&logo=docker)](https://hub.docker.com/r/valazj/postgis_pgvector)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/valazj/postgis_pgvector/latest)](https://hub.docker.com/r/valazj/postgis_pgvector)


## Purpose

This is a Docker image that allows using PostGIS + pgvector for your Github Action 
workflows.

## Installed versions

- PostgreSQL : v16
- PostGIS : v3.5.2 (base image is postgis/postgis:16-3.5)
- pgvector : 0.8.0

## Customization

See [postgis/postgis](https://hub.docker.com/r/postgis/postgis/) documentation to see
environment variables and image usage.

## GH Action usage :

```yaml
   services:
      postgres:
        image: valazj/postgis_pgvector:latest
        env:
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
        ports: ["5432:5432"]
```

## Contributing
Your contributions are welcome! To contribute, please follow the standard fork and pull 
request workflow.

## License
This project is licensed under the MIT License.
