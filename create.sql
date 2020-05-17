CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    isbn VARCHAR UNIQUE NOT NULL,
    isbn13 VARCHAR,
    original_title VARCHAR NOT NULL,
    authors VARCHAR NOT NULL,
    original_publication_year SMALLINT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL
);


CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users,
    book_id INTEGER REFERENCES books,
    rating SMALLINT NOT NULL CONSTRAINT Invalid_Rating CHECK (rating <=5 AND rating>=1),
    review VARCHAR,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    date DATE DEFAULT CURRENT_DATE
);