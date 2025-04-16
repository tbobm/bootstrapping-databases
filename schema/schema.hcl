schema "public" {
  charset = "UTF8"
  collate = "en_US.utf8"
}

table "papers" {
  schema = schema.public
  column "id" {
    type = serial
    primary_key = true
  }
  column "title" {
    type = varchar(255)
    null = false
  }
}

table "mentions" {
  schema = schema.public
  column "id" {
    type = serial
    primary_key = true
  }
  column "paper_id" {
    type = int
    null = false
  }
  column "document" {
    type = text
    null = false
  }

  foreign_key "mentions_paper_fk" {
    columns = [column.paper_id]
    ref_table = table.papers
    ref_columns = [column.id]
    on_delete = "CASCADE"
  }
}

