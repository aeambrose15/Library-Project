CREATE DATABASE Library_Project;

USE Library_Project;

/******************************************************
	 * Build database tables and define ther schema
	 ******************************************************/
	
	CREATE TABLE tbl_Library_Branch (
              Branch_id INT PRIMARY KEY NOT NULL IDENTITY(100,1),
              Branch_Name VARCHAR(50) NOT NULL,
              Branch_Address VARCHAR(50) NOT NULL
       );

	CREATE TABLE tbl_Publisher (
              Publisher_Name VARCHAR(150) PRIMARY KEY NOT NULL,
              Publisher_Address VARCHAR(100) NOT NULL,
              Publisher_PhoneNumber VARCHAR(50) NOT NULL
       );

	CREATE TABLE tbl_Book (
              Book_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
              Title VARCHAR(50) NOT NULL,
			  Publisher_Name Varchar(150) Foreign Key REFERENCES tbl_Publisher(Publisher_Name) NOT NULL, 
       );

	CREATE TABLE tbl_Book_Authors (
              Book_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
              Author_Name VARCHAR(50) NOT NULL
       );


	CREATE TABLE tbl_Book_Copies (
			  No_of_Copies INT NOT NULL, 
		      Book_id INT Foreign Key REFERENCES tbl_book(Book_id) NOT NULL,
			  Branch_id INT Foreign Key REFERENCES tbl_Library_Branch(Branch_id) NOT NULL   
       );

	  
	CREATE TABLE tbl_Borrower (
				Card_No INT PRIMARY KEY NOT NULL IDENTITY (500,1),
				Borrower_Name VARCHAR(50) NOT NULL,
				Borrower_Address VARCHAR(100) NOT NULL,
				Borrower_Phone VARCHAR(50) NOT NULL
		);

	CREATE TABLE tbl_Book_Loans (
			Book_id INT Foreign Key REFERENCES tbl_book(Book_id) NOT NULL,
			Branch_id INT Foreign Key REFERENCES tbl_Library_Branch(Branch_id) NOT NULL,
			Card_No INT Foreign Key REFERENCES tbl_Borrower(Card_No) NOT NULL,
			Date_out VARCHAR(50) NOT NULL, 
			Date_in VARCHAR(50) NOT NULL
		);



/******************************************************
	 * Now that the tables are built, we populate them
	 ******************************************************/

	INSERT INTO tbl_Library_Branch
		(Branch_Name, Branch_Address)
		VALUES 
		('Sharpstown', '1 A Street Miami, FL 00001'),
		('Central',  '2 B Street Los Angeles, CA 00002'),
		('North', '3 C Street Seattle, WA 00003'),
		('West', '4 D Street Brooklyn, NY 00004')

	SELECT * FROM tbl_Library_Branch;


	INSERT INTO tbl_Publisher
		(Publisher_Name, Publisher_Address, Publisher_PhoneNumber)
		VALUES 
		('PicadorUSA', '16365 James Madison Highway Gordonsville VA 22942','888-330-8477'),
		('Scribner', '150 East Connecticut Ave Southern Pines North Carolina 28387', '910-695-8884'),
		('Anchor', '1030 Hunt Valley Circle New Kensington PA 15068', '800-444-4484'),
		('Thomas Nelson', '501 Nelson Pl Nashville TN 37214', '615-889-9000'),
		('Penguin Books', '375 Hudson St New York NY 10014', '978-750-8400'),
		('Lake Union Publishing', '80 E Rio Salado Pkwy Suite 511 Tempe AZ 85281', '480-275-4280'),
		('Italics Publishing', '123 6th St. Melbourne FL 32904', '800-265-9761'),
		('Ballantine Books', '1745 Broadway New York New York 10019', '212-782-9000'),
		('Atheneum', '375 Hudson St New York NY 10014', '978-750-8400'),
		('Grand Central Publishing', '375 Hudson St New York NY 10014', '978-750-8400'),
		('Simon & Schuster', '375 Hudson St New York NY 10014', '978-750-8400'),
		('Seventh Street Books', '59 John Glenn Dr Amherst NY 14228', '716-691-0133'),
		('Doubleday', '375 Hudson St New York NY 10014', '978-750-8400'),
		('Flatiron Books', '375 Hudson St New York NY 10014', '978-750-8400'),
		('Farrar', '375 Hudson St New York NY 10014', '978-750-8400'),
		('MIRA', '195 Broadway 24th Floo New York, NY 10007', '800-234-5681')
	;
	
	SELECT * FROM tbl_Publisher;

	INSERT INTO tbl_Book
		(Title, Publisher_Name)
		VALUES 
		('The Lost Tribe', 'PicadorUSA'),
		('IT',  'Scribner'),
		('The Shining', 'Anchor'),
		('The Hideaway', 'Thomas Nelson'),
		('We Were the Lucky Ones', 'Penguin Books'),
		('Beneath A scarlet Sky',  'Lake Union Publishing'),
		('Make Your Bed', 'Grand Central Publishing'),
		('Las Vegas Girl', 'Italics Publishing'),
		('Small Great Things',  'Ballantine Books'),
		('The Boy on the Wooden Box', 'Atheneum'),
		('Last Girl Seen', 'Grand Central Publishing'),
		('Proof of Heaven',  'Simon & Schuster'),
		('The Life we Bury', 'Seventh Street Books'),
		('The Rooster Bar', 'Doubleday'),
		('Furiously Happy',  'Flatiron Books'),
		('Before We Were Yours', 'Ballantine Books'),
		('All the Light We Cannot See', 'Scribner'),
		('The 57 Bus',  'Farrar'),
		('Fever 1793', 'Simon & Schuster'),
		('The Orphan’s Tale', 'MIRA')
	;

	SELECT * FROM tbl_Book;

	INSERT INTO tbl_Book_Authors
		(Author_Name)
		VALUES 
		('Mark Lee'),
		('Stephen King'),
		('Stephen King'),
		('Lauren K Denton'),
		('Georgia Hunter'),
		('Mark Sullivan'),
		('William H. McRaven'),
		('Leslie Wolfe'),
		('Jodi Picoult'),
		('Leon Leyson'),
		('Nina Laurin'),
		('Eben Alexander'),
		('Allen Eskens'),
		('John Grisham'),
		('Jenny Lawson'),
		('Lisa Wingate'),
		('Anthony Doerr'),
		('Dashka Slater'),
		('Laurie Halse Anderson'),
		('Pam Jenoff')
	;

	SELECT * FROM tbl_Book_Authors;

	INSERT INTO tbl_Book_Copies
		(No_of_Copies, Book_id, Branch_id)
		VALUES 
		('9', '1', '100'),
		('3', '2', '100'),
		('2', '3', '100'),
		('4', '4', '100'),
		('7', '5', '100'),
		('6', '6', '100'),
		('5', '7', '100'),
		('3', '8', '100'),
		('8', '9', '100'),
		('11', '10', '100'),
		('2', '3', '101'),
		('4', '2', '101'),
		('6', '4', '101'),
		('8', '14', '101'),
		('10', '15', '101'),
		('9', '16', '101'),
		('7', '17', '101'),
		('5', '18', '101'),
		('3', '19', '101'),
		('2', '20', '101'),
		('4', '11', '102'),
		('2', '12', '102'),
		('6', '13', '102'),
		('7', '14', '102'),
		('9', '15', '102'),
		('7', '16', '102'),
		('2', '17', '102'),
		('3', '18', '102'),
		('8', '19', '102'),
		('6', '20', '102'),
		('3', '1', '103'),
		('2', '2', '103'),
		('4', '3', '103'),
		('7', '4', '103'),
		('6', '5', '103'),
		('10', '6', '103'),
		('8', '7', '103'),
		('7', '8', '103'),
		('3', '9', '103'),
		('5', '10', '103')
	;
		
	SELECT * FROM tbl_Book_Copies; 

	 INSERT INTO tbl_Borrower 
			(Borrower_Name, Borrower_Address, Borrower_Phone) 
			VALUES 
			('Sally', '1 Fake Street', '100-100-1000'),
			('Bob', '2 Fake Street', '200-200-2000'),
			('Joe', '3 Fake Street', '300-300-3000'),
			('Kelly', '4 Fake Street', '400-400-4000'),
			('Becky', '5 Fake Street', '500-500-5000'),
			('John', '6 Fake Street', '600-600-6000'),
			('Bill', '7 Fake Street', '700-700-7000'),
			('Jill', '8 Fake Street', '800-800-8000'),
			('Mike', '9 Fake Street', '900-900-9000'),
			('Mary', '10 Fake Street', '100-100-1001'),
			('Jerry', '11 Fake Street', '110-110-1100')
		; 
		
		SELECT * FROM tbl_Borrower

		INSERT INTO tbl_Book_Loans
		(Book_id, Branch_id, Card_No, Date_out, Date_in)
		VALUES
		('1', '100', '500', '3/1/18', '3/16/18'),
		('2', '100', '500', '3/1/18', '3/16/18'),
		('3', '100', '500', '3/1/18', '3/16/18'),
		('4', '100', '500', '3/1/18', '3/16/18'),
		('5', '100', '500', '3/1/18', '3/16/18'),
		('6', '100', '500', '3/1/18', '3/16/18'),
		('7', '100', '500', '3/1/18', '3/16/18'),
		('8', '100', '500', '3/1/18', '3/16/18'),
		('9', '100', '501', '2/10/18', '3/1/18'),
		('10', '100', '501', '2/10/18', '3/1/18'),
		('11', '100', '501', '2/10/18', '3/1/18'),
		('12', '100', '501', '2/10/18', '3/1/18'),
		('13', '101', '502', '1/1/18', '2/1/18'),
		('14', '101', '502', '1/1/18', '2/1/18'),
		('15', '101', '502', '1/1/18', '2/1/18'),
		('16', '101', '502', '1/1/18', '2/1/18'),
		('17', '101', '502', '1/1/18', '2/1/18'),
		('18', '101', '502', '1/1/18', '2/1/18'),
		('19', '101', '502', '3/1/18', '3/10/18'),
		('20', '101', '503', '3/1/18', '3/10/18'),
		('1', '101', '503', '3/1/18', '3/10/18'),
		('2', '101', '503', '3/1/18', '3/10/18'),
		('3', '101', '503', '3/1/18', '3/10/18'),
		('4', '101', '503', '3/1/18', '3/10/18'),
		('1', '102', '504', '1/1/18', '1/5/18'),
		('2', '102', '504', '1/2/18', '1/6/18'),
		('3', '102', '504', '1/3/18', '1/7/18'),
		('4', '102', '505', '1/4/18', '1/8/18'),
		('5', '102', '505', '1/5/18', '1/9/18'),
		('6', '102', '505', '3/1/18', '3/10/18'),
		('7', '102', '506', '3/1/18', '3/10/18'),
		('8', '102', '506', '3/1/18', '3/10/18'),
		('9', '102', '506', '3/1/18', '3/10/18'),
		('10', '102', '507', '3/1/18', '3/10/18'),
		('11', '102', '507', '3/1/18', '3/10/18'),
		('12', '102', '507', '3/1/18', '3/10/18'),
		('1', '103', '508', '3/1/18', '4/5/18'),
		('2', '103', '508', '3/2/18', '4/6/18'),
		('13', '103', '508', '3/3/18', '4/7/18'),
		('14', '103', '508', '3/4/18', '4/8/18'),
		('15', '103', '508', '3/5/18', '4/9/18'),
		('16', '103', '509', '3/6/18', '4/10/18'),
		('17', '103', '509', '3/7/18', '4/11/18'),
		('18', '103', '509', '3/8/18', '4/12/18'),
		('19', '103', '509', '3/9/18', '4/13/18'),
		('20', '103', '509', '3/10/18', '4/14/18'),
		('3', '103', '509', '3/9/18', '4/13/18'),
		('10', '103', '509', '3/10/18', '4/14/18')
	; 

	SELECT * FROM tbl_Book_Loans


	/******************************************************
	 * Stored Procedures
	 ******************************************************/

	/*1. How many copies of the book titled "The Lost Tribe" are owned by the library 
	branch whose name is "Sharpstown"?*/

	GO
	CREATE PROCEDURE dbo.Copies_at_Sharpstown 
	AS 
	SELECT No_of_Copies, tbl_Book.Title, tbl_Library_Branch.Branch_Name
	FROM tbl_Book_Copies
	INNER JOIN tbl_Book ON tbl_Book_Copies.Book_id = tbl_Book.Book_id
	INNER JOIN tbl_Library_Branch ON tbl_Book_Copies.Branch_id = tbl_Library_Branch.Branch_id
	WHERE tbl_Book.Book_id = 1 AND tbl_Library_Branch.Branch_id = 100
	GO

EXEC dbo.Copies_at_Sharpstown 


/*2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/

	Go
	Create Procedure dbo.Branches_With_The_Lost_Tribe
	AS
	SELECT No_of_Copies, tbl_Book.Title, tbl_Library_Branch.Branch_id
	FROM tbl_Book_Copies
	INNER JOIN tbl_Book ON tbl_Book_Copies.Book_id = tbl_Book.Book_id
	INNER JOIN tbl_Library_Branch ON tbl_Book_Copies.Branch_id = tbl_Library_Branch.Branch_id
	WHERE tbl_Book.Book_id = 1
	GO

EXEC dbo.Branches_With_The_Lost_Tribe


/* 3. Retrieve the names of all borrowers who do not have any books checked out.*/

	Go
	Create Procedure dbo.No_Borrowers
	AS
	SELECT tbl_Borrower.Borrower_Name AS 'No Books Checked Out'
	FROM tbl_Borrower
	FULL OUTER JOIN tbl_Book_Loans ON tbl_Borrower.Card_No = tbl_Book_Loans.Card_No
	WHERE tbl_Book_Loans.Card_No IS NULL;
	

EXEC dbo.No_Borrowers



/* 4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 
today, retrieve the book title, the borrower's name, and the borrower's address. */


	Go
	Create Procedure dbo.DueDate
	AS
	SELECT Branch_Name, tbl_Book_Loans.Date_in, tbl_Book.Title, tbl_Borrower.Borrower_Name, tbl_Borrower.Borrower_Address
	FROM tbl_Library_Branch
	INNER JOIN tbl_Book_Loans ON tbl_Library_Branch.Branch_id = tbl_Book_Loans.Branch_id
	INNER JOIN tbl_Book ON tbl_Book_Loans.Book_id = tbl_Book.Book_id
	INNER JOIN tbl_Borrower ON  tbl_Book_Loans.Card_No = tbl_Borrower.Card_No 
	WHERE tbl_Library_Branch.Branch_Name = 'Sharpstown' AND tbl_Book_Loans.Date_in = '3/16/18'

	EXEC dbo.DueDate

	/* 5. For each library branch, retrieve the branch name and the total number of books 
	loaned out from that branch. */

	Go
	Create Procedure dbo.Books_Loaned
	AS
	SELECT COUNT(tbl_Book_Loans.Book_id), tbl_Library_Branch.Branch_Name
	FROM tbl_Library_Branch
	INNER JOIN tbl_Book_Loans ON tbl_Library_Branch.Branch_id = tbl_Book_Loans.Branch_id
	GROUP BY tbl_Library_Branch.Branch_Name

	EXEC dbo.Books_Loaned

	/*6. Retrieve the names, addresses, and number of books checked out for all borrowers who 
	have more than five books checked out.*/

	Go
	Create Procedure dbo.Borrowers_With_MoreThan_5
	AS
	SELECT COUNT(tbl_Book_Loans.Book_id) AS [Number of books checked out], tbl_Borrower.Borrower_Name, tbl_Borrower.Borrower_Address
	FROM tbl_Borrower
	INNER JOIN tbl_Book_Loans ON tbl_Book_Loans.Card_No = tbl_Borrower.Card_No
	GROUP BY tbl_Borrower.Borrower_Name, tbl_Borrower.Borrower_Address
	HAVING COUNT(tbl_Book_Loans.Book_id) > 5

	EXEC dbo.Borrowers_With_MoreThan_5


	/* 7.For each book authored (or co-authored) by "Stephen King", retrieve the title and the 
	number of copies owned by the library branch whose name is "Central". */

	Go
	Create Procedure dbo.Central_Copies
	AS
	SELECT tbl_Book.Title, tbl_Book_Copies.No_of_Copies, tbl_Book_Authors.Author_Name, tbl_Library_Branch.Branch_Name
	FROM tbl_Book_Authors
	INNER JOIN tbl_Book ON tbl_Book_Authors.Book_id = tbl_Book.Book_id
	INNER JOIN tbl_Book_Copies ON tbl_Book.Book_id = tbl_Book_Copies.Book_id
	INNER JOIN tbl_Library_Branch ON tbl_Book_Copies.Branch_id = tbl_Library_Branch.Branch_id
	WHERE tbl_Library_Branch.Branch_id = 101 AND tbl_Book_Authors.Author_Name = 'Stephen King'


	EXEC dbo.Central_Copies