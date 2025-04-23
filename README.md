# Database Bootstrapping - Local and Production setup

This repository provides an example of how to manage PostgreSQL databases
using **schema as code** (with [Atlas](https://atlasgo.io)) and
**infrastructure as code** (via Docker Compose and Terraform).

It supports both local development and cloud deployment with CI/CD workflows.

> Based on the article: [**“Bootstrapping SQL databases for local and production setup”**][article]

## Features

- **Docker Compose** setup for local PostgreSQL + Atlas CLI
- **Atlas** schema definition, migrations, and deployment logic
- **Terraform** resources for:
  - ECS Task Definition to run DB migrations
  - ECR repository to store migration images
- **Github Actions** CI/CD pipeline to:
  - Build + push migration containers
  - Run one-off ECS tasks to apply migrations
  - Validate success or failure automatically

## Local development

### Start local setup

```console
$ docker compose up -d --wait --quiet-pull db
$ docker compose run -it atlas schema inspect -u "postgres://user:pass@db:5432/local_db?sslmode=disable"
...
$ docker compose run -it atlas schema apply -u "postgres://user:pass@db:5432/local_db?sslmode=disable" --file file://schema/schema.hcl --auto-approve
[+] Creating 1/1
 ✔ Container bootstrapping-databases-for-local-and-prod-db-1  Running                                                                                                                    0.0s 
Planning migration statements (2 in total):

  -- create "papers" table:
    -> CREATE TABLE "public"."papers" (
         "id" serial NOT NULL,
         "title" character varying(255) NOT NULL,
         PRIMARY KEY ("id")
       );
  -- create "mentions" table:
    -> CREATE TABLE "public"."mentions" (
         "id" serial NOT NULL,
         "paper_id" integer NOT NULL,
         "document" text NOT NULL,
         PRIMARY KEY ("id"),
         CONSTRAINT "mentions_paper_fk" FOREIGN KEY ("paper_id") REFERENCES "public"."papers" ("id") ON DELETE CASCADE
       );

-------------------------------------------

Applying approved migration (2 statements in total):

  -- create "papers" table
    -> CREATE TABLE "public"."papers" (
         "id" serial NOT NULL,
         "title" character varying(255) NOT NULL,
         PRIMARY KEY ("id")
       );
  -- ok (24.597527ms)

  -- create "mentions" table
    -> CREATE TABLE "public"."mentions" (
         "id" serial NOT NULL,
         "paper_id" integer NOT NULL,
         "document" text NOT NULL,
         PRIMARY KEY ("id"),
         CONSTRAINT "mentions_paper_fk" FOREIGN KEY ("paper_id") REFERENCES "public"."papers" ("id") ON DELETE CASCADE
       );
  -- ok (5.336047ms)

  -------------------------
  -- 10.896794ms
  -- 1 migration
  -- 2 sql statements
```

## Production deployment

> Provision AWS infrastructure using Terraform.

```bash
cd terraform
terraform init
terraform apply
```

Outputs will include:
- ECS Cluster and Task Definition
- ECR repository URL

## Migrations via Github Actions

The included workflow (`.github/workflows/migrate.yml`) can be triggered manually:

1. Builds migration image from latest schema + migration files
2. Pushes to ECR
3. Runs a one-off ECS Fargate task to apply changes
4. Fails safely if the task fails

## Tools Used

- [Atlas](https://atlasgo.io/) – schema and migration management
- [Docker Compose](https://docs.docker.com/compose/) – local dev
- [Terraform](https://www.terraform.io/) – cloud infrastructure
- [Github Actions](https://docs.github.com/en/actions) – deployment automation

## Related

- Blog article: [Bootstrapping SQL Databases][article]
- Atlas documentation: https://atlasgo.io

[article]: https://blog.tbobm.dev/posts/db-bootstrapping/
