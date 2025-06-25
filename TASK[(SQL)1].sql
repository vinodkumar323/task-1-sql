CREATE DATABASE IF NOT EXISTS LibraryRaw;
USE LibraryRaw;

CREATE TABLE IF NOT EXISTS RawLibrary (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Category VARCHAR(100),
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Publisher VARCHAR(150),
    YearPublished SMALLINT,
    CopiesAvailable INT DEFAULT 1
);

ALTER TABLE RawLibrary MODIFY COLUMN YearPublished SMALLINT;


USE LibraryRaw;
SELECT * FROM library_dataset_random  LIMIT 10;

SELECT DATABASE();

INSERT INTO RawLibrary (BookID, Title, Author, Category, ISBN, Publisher, YearPublished, CopiesAvailable) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '9780060935467', 'J.B. Lippincott & Co.', 1960, 5),
(2, '1984', 'George Orwell', 'Dystopian', '9780451524935', 'Secker & Warburg', 1949, 8),
(3, 'Pride and Prejudice', 'Jane Austen', 'Classic', '9780141439518', 'T. Egerton', 1813, 4),
(4, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '9780743273565', 'Charles Scribner\'s Sons', 1925, 7),
(5, 'Moby Dick', 'Herman Melville', 'Adventure', '9781503280786', 'Harper & Brothers', 1851, 3),
(6, 'War and Peace', 'Leo Tolstoy', 'Historical', '9781853260629', 'The Russian Messenger', 1869, 2),
(7, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '9780316769488', 'Little, Brown and Company', 1951, 6),
(8, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', '9780547928227', 'George Allen & Unwin', 1937, 10),
(9, 'Fahrenheit 451', 'Ray Bradbury', 'Dystopian', '9781451673319', 'Ballantine Books', 1953, 5),
(10, 'Jane Eyre', 'Charlotte Brontë', 'Classic', '9780142437209', 'Smith, Elder & Co.', 1847, 4),
(11, 'Brave New World', 'Aldous Huxley', 'Science Fiction', '9780060850524', 'Chatto & Windus', 1932, 6),
(12, 'Animal Farm', 'George Orwell', 'Political Satire', '9780451526342', 'Secker & Warburg', 1945, 9),
(13, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', '9780618640157', 'George Allen & Unwin', 1954, 7),
(14, 'The Odyssey', 'Homer', 'Epic', '9780140268867', 'Ancient Greece', 800, 2),
(15, 'Crime and Punishment', 'Fyodor Dostoevsky', 'Philosophical', '9780140449136', 'The Russian Messenger', 1866, 3),
(16, 'Wuthering Heights', 'Emily Brontë', 'Classic', '9780141439556', 'Thomas Cautley Newby', 1847, 4),
(17, 'The Brothers Karamazov', 'Fyodor Dostoevsky', 'Philosophical', '9780374528379', 'The Russian Messenger', 1880, 2),
(18, 'Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Fantasy', '9780590353427', 'Bloomsbury', 1997, 15),
(19, 'The Alchemist', 'Paulo Coelho', 'Fiction', '9780061122415', 'HarperTorch', 1988, 12),
(20, 'The Da Vinci Code', 'Dan Brown', 'Thriller', '9780307474278', 'Doubleday', 2003, 8),
(21, 'The Hunger Games', 'Suzanne Collins', 'Dystopian', '9780439023528', 'Scholastic Press', 2008, 10),
(22, 'A Tale of Two Cities', 'Charles Dickens', 'Historical', '9780486417769', 'Chapman & Hall', 1859, 5),
(23, 'Les Misérables', 'Victor Hugo', 'Historical', '9780451419439', 'A. Lacroix, Verboeckhoven & Cie.', 1862, 4),
(24, 'Don Quixote', 'Miguel de Cervantes', 'Classic', '9780060934347', 'Francisco de Robles', 1605, 3),
(25, 'The Fault in Our Stars', 'John Green', 'Young Adult', '9780142424179', 'Dutton Books', 2012, 6),
(26, 'Gone Girl', 'Gillian Flynn', 'Thriller', '9780307588371', 'Crown Publishing Group', 2012, 7),
(27, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Mystery', '9780307454546', 'Norstedts Förlag', 2005, 8),
(28, 'The Shining', 'Stephen King', 'Horror', '9780307743657', 'Doubleday', 1977, 6),
(29, 'The Chronicles of Narnia', 'C.S. Lewis', 'Fantasy', '9780064471190', 'Geoffrey Bles', 1956, 11),
(30, 'The Fault in Our Stars', 'John Green', 'Young Adult', '9780525478812', 'Dutton Books', 2012, 9);

SELECT * FROM RawLibrary LIMIT 10;




CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL UNIQUE
);

-- Publishers table
CREATE TABLE Publishers (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    PublisherName VARCHAR(150) NOT NULL UNIQUE
);

-- Categories table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT NOT NULL,
    PublisherID INT NOT NULL,
    CategoryID INT NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    YearPublished SMALLINT,
    CopiesAvailable INT DEFAULT 1,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);


INSERT INTO Authors (AuthorName) VALUES
('Harper Lee'), ('George Orwell'), ('Jane Austen'), ('J.R.R. Tolkien');


INSERT INTO Publishers (PublisherName) VALUES
('J.B. Lippincott & Co.'), ('Secker & Warburg'), ('T. Egerton'), ('George Allen & Unwin');


INSERT INTO Categories (CategoryName) VALUES
('Fiction'), ('Dystopian'), ('Classic'), ('Fantasy');


INSERT INTO Books (Title, AuthorID, PublisherID, CategoryID, ISBN, YearPublished, CopiesAvailable)
VALUES (
    'To Kill a Mockingbird',
    (SELECT AuthorID FROM Authors WHERE AuthorName = 'Harper Lee'),
    (SELECT PublisherID FROM Publishers WHERE PublisherName = 'J.B. Lippincott & Co.'),
    (SELECT CategoryID FROM Categories WHERE CategoryName = 'Fiction'),
    '9780060935467',
    1960,
    5
);

select*from books ;

select*from authors ;

select*from categories;

select*from publishers ;