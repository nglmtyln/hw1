.mode column
.headers off

DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS portrayals;
DROP TABLE IF EXISTS credits;

CREATE TABLE studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
  );

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year INTEGER,
  mpaa TEXT,
  studio_id INTEGER
  );

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE portrayals (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_name TEXT,
  actor_id INTEGER
  );

CREATE TABLE credits (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_id INTEGER,
  portrayal_id INTEGER
  );

INSERT INTO studios (name)    
    VALUES ("Warner Bros.")
           ;

INSERT INTO movies (title , year , mpaa, studio_id )    
    VALUES ("Batman Begins", 2005, "PG-13", 1),
           ("The Dark Knight", 2008, "PG-13", 1),
           ("The Dark Knight Rises", 2012, "PG-13", 1)
           ;

INSERT INTO actors (name )    
    VALUES ("Christian Bale"),
           ("Michael Caine"),
           ("Liam Neeson"),
           ("Katie Holmes"),
           ("Gary Oldman"),
           ("Heath Ledger"),
           ("Aaron Eckhart"),
           ("Maggie Gyllenhaal"),
           ("Tom Hardy"),
           ("Joseph Gordon-Levitt"),
           ("Anne Hathaway")
           ;


INSERT INTO portrayals (character_name , actor_id)    
    VALUES ("Bruce Wayne", 1),
           ("Alfred", 2),
           ("Ra's Al Ghul", 3),
           ("Rachel Dawes", 4),
           ("Comissioner Gordon", 5),
           ("Joker", 6),
           ("Harvey Dent", 7),
           ("Rachel Dawes", 8),
           ("Bane", 9),
           ("John Blake", 10),
           ("Selina Kyle", 11)
           ;
           

INSERT INTO credits (movie_id, portrayal_id)    
    VALUES (1, 1),
           (1, 2),
           (1, 3),
           (1, 4),
           (1, 5),
           (2, 1),
           (2, 6),
           (2, 7),
           (2, 2),
           (2, 8),
           (3, 1),
           (3, 5),
           (3, 9),
           (3, 10),
           (3, 11)
           ;
           

.print "Movies"
.print "======"
.print ""

SELECT title, year, mpaa, studios.name 
FROM movies INNER JOIN studios ON movies.studio_id = studios.id
;

.print ""
.print "Top Cast"
.print "========"
.print ""

SELECT movies.title, portrayals.character_name, actors.name
FROM movies 
    INNER JOIN credits ON movies.id = credits.movie_id
    INNER JOIN portrayals ON credits.portrayal_id = portrayals.id
    INNER JOIN actors on portrayals.actor_id = actors.id

;