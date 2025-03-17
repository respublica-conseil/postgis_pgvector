# Use the PostGIS image as the base
FROM postgis/postgis:16-3.4

# Avoid warnings and prompts by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# # Install necessary packages
# RUN apt-get update \
#     && apt-get install -yqq --no-install-recommends \
#        build-essential \
#        libpq-dev \
#        postgresql-common \
#        postgresql-server-dev-16 \
#     # Clean up to reduce layer size
#     && rm -rf /var/lib/apt/lists/* \
#     && /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y \
#     && apt-get install -yqq postgresql-16-pgvector \
#     # Clean up unnecessary files
#     && cd - \
#     && apt-get purge -y --auto-remove build-essential postgresql-server-dev-16 libpq-dev

# Install necessary packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       libpq-dev \
       wget \
       git \
       postgresql-server-dev-16 \
    # Clean up to reduce layer size
    && rm -rf /var/lib/apt/lists/* \
    && git clone --branch v0.7.4 https://github.com/pgvector/pgvector.git /tmp/pgvector \
    && cd /tmp/pgvector \
    && make \
    && make install \
    # Clean up unnecessary files
    && cd - \
    && apt-get purge -y --auto-remove build-essential postgresql-server-dev-16 libpq-dev wget git \
    && rm -rf /tmp/pgvector

# Copy initialization scripts
COPY ./docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/
