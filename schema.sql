CREATE TABLE game(
  id INT GENERATED ALWAYS IDENTITY PRIMARY,
  gener INT,
  author INT,
  label INT,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer INT,
  last_played_at DATE,
  CONSTRAINT gener_fk FOREIGN KEY(gener) REFERENCES gener(id),
  CONSTRAINT author_fk FOREIGN KEY(author) REFERENCES author(id),
  CONSTRAINT label_fk FOREIGN KEY(label) REFERENCES label(id)
  )
