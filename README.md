# Boostrapping databases for local and prod

## Content

- infra: infrastructure as code for RDS / ECS migration task
- db-as-code: setup for managing databases using atlas
- cicd: example automation and tooling for handling databases with github action

## Setup

```console
$ docker compose up -d --wait --quiet-pull db
$ docker compose run -it atlas schema inspect -u "postgres://user:pass@db:5432/local_db?sslmode=disable"
```
