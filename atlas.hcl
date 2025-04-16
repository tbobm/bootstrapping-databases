env "local" {
  url = "postgres://user:pass@db:5432/local_db?sslmode=disable"

  migration {
    dir = "file://migrations"
    format = "golang-migrate"
  }
}
