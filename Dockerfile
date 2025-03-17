# Use the PostGIS image as the base
FROM postgis/postgis:16-3.5

# Avoid warnings and prompts by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Adapted from https://github.com/pgvector/pgvector/blob/master/Dockerfile
RUN apt-get update && \
    apt-mark hold locales && \
    apt-get install -y --no-install-recommends build-essential postgresql-server-dev-16 libpq-dev wget git && \
    git clone --branch v0.8.0 https://github.com/pgvector/pgvector.git /tmp/pgvector && \
    cd /tmp/pgvector && \
    make clean && \
    make OPTFLAGS="" && \
    make install && \
    mkdir /usr/share/doc/pgvector && \
    cp LICENSE README.md /usr/share/doc/pgvector && \
    rm -r /tmp/pgvector && \
    apt-get remove -y build-essential postgresql-server-dev-16 wget git && \
    apt-get autoremove -y && \
    apt-mark unhold locales && \
    rm -rf /var/lib/apt/lists/*

# Copy initialization scripts
COPY ./docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/
