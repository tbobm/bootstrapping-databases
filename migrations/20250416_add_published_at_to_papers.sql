-- modify: add 'published_at' to papers
ALTER TABLE papers
ADD COLUMN published_at TIMESTAMP;
