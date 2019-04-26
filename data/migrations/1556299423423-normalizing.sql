-- Makes copy of the database
CREATE DATABASE lab14_normal WITH TEMPLATE lab14;
-- Makes a copy of the table
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
-- Removes all possible variations of bookshelf values from the books table.
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
-- Replace catagories with bookshelf ids.
ALTER TABLE books ADD COLUMN bookshelf_id INT;
-- Adding books in bookshelf table into bookshelf table with the id
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
-- remove the bookshelf id colum from books table
ALTER TABLE books DROP COLUMN bookshelf;
-- Adds foreign key reference from bookshelf to books table
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);