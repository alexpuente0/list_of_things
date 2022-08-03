

  CREATE TABLE author(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name  varchar,
    last_name varchar,
  )

CREATE TABLE game(
  id INT GENERATED ALWAYS IDENTITY PRIMARY KEY,
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
  );

  CREATE TABLE genre(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name  TEXT NOT NULL,
  )

CREATE TABLE music_album(
  id INT GENERATED ALWAYS IDENTITY PRIMARY KEY,
  gener INT,
  author INT,
  label INT,
  publish_date DATE,
  archived BOOLEAN,
  on_soptify BOOLEAN,
  CONSTRAINT gener_fk FOREIGN KEY(gener) REFERENCES gener(id),
  CONSTRAINT author_fk FOREIGN KEY(author) REFERENCES author(id),
  CONSTRAINT label_fk FOREIGN KEY(label) REFERENCES label(id)
  );

CREATE TABLE label(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title TEXT,
  color TEXT,
);

CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT,
  author_id INT,
  label_id INT,
  publish_date DATE,
  publisher TEXT,
  cover_state TEXT,
  archived BOOLEAN DEFAULT false,
  CONSTRAINT genre_fk FOREIGN KEY(genre) REFERENCES genre(id),
  CONSTRAINT author_fk FOREIGN KEY(author) REFERENCES author(id),
  CONSTRAINT label_fk FOREIGN KEY(label) REFERENCES label(id)
);
