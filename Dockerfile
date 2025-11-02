# Всегда последняя стабильная n8n
FROM n8nio/n8n:latest

# --- FFmpeg (кросс-дистро: apt / apk / microdnf) ---
USER root
RUN set -eux; \
    if command -v apt-get >/dev/null 2>&1; then \
        apt-get update && apt-get install -y --no-install-recommends ffmpeg && rm -rf /var/lib/apt/lists/*; \
    elif command -v apk >/dev/null 2>&1; then \
        apk add --no-cache ffmpeg; \
    elif command -v microdnf >/dev/null 2>&1; then \
        microdnf install -y ffmpeg && microdnf clean all; \
    else \
        echo "No known package manager found (apt, apk, microdnf)"; exit 1; \
    fi
USER node
# --- /FFmpeg ---

# Аргументы для БД (как у тебя было)
ARG PGPASSWORD
ARG PGHOST
ARG PGPORT
ARG PGDATABASE
ARG PGUSER

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=$PGDATABASE
ENV DB_POSTGRESDB_HOST=$PGHOST
ENV DB_POSTGRESDB_PORT=$PGPORT
ENV DB_POSTGRESDB_USER=$PGUSER
ENV DB_POSTGRESDB_PASSWORD=$PGPASSWORD

# Ключ шифрования n8n
ARG ENCRYPTION_KEY
ENV N8N_ENCRYPTION_KEY=$ENCRYPTION_KEY

# Старт n8n
CMD ["n8n", "start"]
