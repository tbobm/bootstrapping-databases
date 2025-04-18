schema "public" {
}

table "papers" {
  schema = schema.public
  column "id" {
    type = serial
  }
  column "title" {
    type = varchar(255)
    null = false
  }
  primary_key {
    columns = [column.id]
  }
}

table "mentions" {
  schema = schema.public
  column "id" {
    type = serial
  }
  column "paper_id" {
    type = int
    null = false
  }
  column "document" {
    type = text
    null = false
  }
  primary_key {
    columns = [column.id]
  }

  foreign_key "mentions_paper_fk" {
    columns = [column.paper_id]
    ref_columns = [table.papers.column.id]
    on_delete = "CASCADE"
  }
}

