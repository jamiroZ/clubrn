#!/usr/bin/env bash
set -e

echo "=== Creamos la red y los volumenes para contendores ==="
docker network create lbd-net || true
docker volume create nodo1-datos
docker volume create nodo2-datos
docker volume create nodo3-datos

echo "=== Iniciamos nodo1 (Master) y nodo3 (Independiente) ==="
# nodo1: wal_level=replica
docker run -d --name nodo1 --network lbd-net -p 5441:5432 \
  -e POSTGRES_PASSWORD=postgres \
  -v nodo1-datos:/var/lib/postgresql/data \
  postgres:16 \
  -c wal_level=replica \
  -c max_prepared_transactions=10 \
  -c max_wal_senders=5

# nodo3
docker run -d --name nodo3 --network lbd-net -p 5443:5432 \
  -e POSTGRES_PASSWORD=postgres \
  -v nodo3-datos:/var/lib/postgresql/data \
  postgres:16 \
  -c max_prepared_transactions=10

echo "=== Esperamos que nodo1 acepte conexiones ==="
until docker exec nodo1 pg_isready -U postgres > /dev/null 2>&1; do
  sleep 1
done

echo "=== Creamos rol replicador para el nodo1 ==="
docker exec -i nodo1 psql -U postgres -c \
  "CREATE ROLE replicador WITH REPLICATION LOGIN ENCRYPTED PASSWORD 'replicador_pass';"

# Habilitamos el acceso al rol replicador en pg_hba.conf desde cualquier host de la red lbd-net
docker exec -i nodo1 bash -c \
  "echo 'host replication replicador all scram-sha-256' >> /var/lib/postgresql/data/pg_hba.conf"

# Para aplicar cambios en la configuración del nodo1
docker exec -i nodo1 psql -U postgres -c "SELECT pg_reload_conf();"

echo "=== Clonamos nodo1 hacia nodo2 con pg_basebackup ==="
# Contenedor temporal para poblar el volumen nodo2-datos antes de iniciar nodo2
docker run --rm --network lbd-net \
  -e PGPASSWORD=replicador_pass \
  -v nodo2-datos:/var/lib/postgresql/data \
  postgres:16 \
  pg_basebackup -h nodo1 -p 5432 -U replicador \
  -D /var/lib/postgresql/data -Fp -Xs -R

echo "=== Inicia nodo2 (replica nodo1) ==="
docker run -d --name nodo2 --network lbd-net -p 5442:5432 \
  -v nodo2-datos:/var/lib/postgresql/data \
  postgres:16 \
  -c max_prepared_transactions=10

