CREATE DATABASE LIBRARY;
USE LIBRARY;

CREATE TABLE PUBLISHER (
    Publisher_name VARCHAR(255) PRIMARY KEY,
    Address VARCHAR(255),
    Phone VARCHAR(15)
);

CREATE TABLE BOOK (
    Book_id INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Publisher_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (Publisher_name) REFERENCES	PUBLISHER(Publisher_name) ON DELETE CASCADE
);


CREATE TABLE BOOK_AUTHORS (
    Book_id INT,
    Author_name VARCHAR(255),
    PRIMARY KEY (Book_id, Author_name),
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id) ON DELETE CASCADE
);

CREATE TABLE LIBRARY_BRANCH (
    Branch_id INT PRIMARY KEY,
    Branch_name VARCHAR(255),
    Address VARCHAR(255)
);




CREATE TABLE BOOK_COPIES (
    Book_id INT,
    Branch_id INT,
    No_of_copies INT,
    PRIMARY KEY (Book_id, Branch_id),
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id) ON DELETE CASCADE,
    FOREIGN KEY (Branch_id) REFERENCES LIBRARY_BRANCH(Branch_id) ON DELETE CASCADE
);

CREATE TABLE BORROWER (
    Card_no INT PRIMARY KEY,
    Borrower_name VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(15)
);



CREATE TABLE BOOK_LOANS (
    Book_id INT,
    Branch_id INT,
    Card_no INT,
    Date_out DATE,
    Due_date DATE,
    PRIMARY KEY (Book_id, Branch_id, Card_no),
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id) ON DELETE CASCADE,
    FOREIGN KEY (Branch_id) REFERENCES LIBRARY_BRANCH(Branch_id) ON DELETE CASCADE,
    FOREIGN KEY (Card_no) REFERENCES BORROWER(Card_no) ON DELETE CASCADE
);

INSERT INTO PUBLISHER (Publisher_name, Address, Phone)
VALUES ('SCOTT TIGER', '1745 Broadway, New York, NY 10019', '212-782-9000');
publisherpublisher
INSERT INTO PUBLISHER (Publisher_name, Address, Phone)
VALUES ('Saher Zayed', '195 Broadway, New York, NY 10007', '212-207-7000');
SELECT * FROM library.publisher;

UPDATE PUBLISHER
SET Phone = '212-555-1234'
WHERE Publisher_name = 'Saher Zayed';



INSERT INTO BOOK (book_id, Title, Publisher_name)
VALUES ('1234', 'Ju$t f0r SQL', 'Saher Zayed');

DELETE FROM PUBLISHER
WHERE Publisher_name = 'Saher Zayed';


-- Inserting books
INSERT INTO BOOK (Book_id, Title, Publisher_name)
VALUES (1, 'The Lost Tribe', 'Saher Zayed'),
       (2, 'The Shining', 'SCOTT TIGER');
       
-- Inserting book authors
INSERT INTO BOOK_AUTHORS (Book_id, Author_name)
VALUES (1, 'John Smith'),       -- Author of "The Lost Tribe"
       (2, 'Stephen King');     -- Author of "The Shining"
       
-- Inserting library branches
INSERT INTO LIBRARY_BRANCH (Branch_id, Branch_name, Address)
VALUES (1, 'Sharpstown', '123 Sharpstown Blvd'),
       (2, 'Central', '456 Central Ave');
-- Inserting book copies into library branches
INSERT INTO BOOK_COPIES (Book_id, Branch_id, No_of_copies)
VALUES (1, 1, 3),  -- 3 copies of "The Lost Tribe" in Sharpstown
       (1, 2, 5),  -- 5 copies of "The Lost Tribe" in Central
       (2, 1, 2); -- 2 copies of "The Shining" in Sharpstown
	
-- Inserting borrowers
INSERT INTO BORROWER (Card_no, Borrower_name, Address, Phone)
VALUES (101, 'Alice Johnson', '789 Wonderland St', '123-456-7890'),
       (102, 'Bob Smith', '101 Main St', '987-654-3210'),
       (103, 'Charlie Brown', '500 Peanuts Ln', '555-555-5555');
-- Inserting book loans
-- Alice has loaned a book from Sharpstown (The Lost Tribe)
INSERT INTO BOOK_LOANS (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (1, 1, 101, '2024-10-10', '2024-10-16'),  -- Loan for "The Lost Tribe" by Alice from Sharpstown, due today
       (2, 1, 102, '2024-10-05', '2024-10-15');  -- Loan for "The Shining" by Bob from Sharpstown, due yesterday













