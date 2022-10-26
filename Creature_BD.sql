CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musicant (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS MusicantGenre (
	Genre_id INTEGER REFERENCES Genre(id),
	Musicant_id INTEGER REFERENCES Musicant(id),
	CONSTRAINT pk_GenreMusicant PRIMARY KEY (Genre_id, Musicant_id)
);


CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) unique NOT NULL,
	year_of_release INTEGER 
);


CREATE TABLE IF NOT EXISTS MusicantAlbum (
	Album_id INTEGER REFERENCES Album(id),
	Musicant_id INTEGER REFERENCES Musicant(id),
	CONSTRAINT pk_MusicantAlbum PRIMARY KEY (Album_id, Musicant_id)
);


CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	duration DECIMAL,
	Album_id INTEGER REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) unique NOT NULL,
	year_of INTEGER
);

CREATE TABLE IF NOT EXISTS TrackCollection (
	Track_id INTEGER REFERENCES Track(id),
	Collection_id INTEGER REFERENCES Collection(id),
	CONSTRAINT pk_TrackCollection PRIMARY KEY (Track_id, Collection_id)
);