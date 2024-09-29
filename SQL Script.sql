CREATE DATABASE library;
USE library;

# Create a database named library and following TABLES in the database

# 1. Branch 
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

# 2. Employee  
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

# 3. Books 
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10,2),
    Status CHAR(3),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

# 4. Customer 
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

# 5. IssueStatus 
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

# 6. ReturnStatus  
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


# Insert values into branch table 
INSERT INTO branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
  (1, 101, 'Near Sakthan Thampuran Palace, Thrissur', '9345678908'),  # 101 102 103 are manager id 
  (2, 102, 'Chamakkad-Amala Rd, Kuttoor, Kuttur', '8765432103'),    
  (3, 103, 'Near Peramangalam Police Station, Peramangalam', '9978901235');
  
SELECT * FROM branch; # show branch table 

# insert values into employee table
INSERT INTO employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES 
	(101,'Anjali V Gopi','Librarian/Manager', 60000.00,1), # manager branch 1 
    (102,'Anjay V Gopi','Librarian/Manager', 60000.00,2), # manager branch 2
    (103,'Sreejith C Babu','Librarian/Manager', 60000.00,3), # manager branch 3
    
    (104,'Akhil R','Library Assistant', 25000.00,1), # branch 1 
    (105,'Ajith V R','Library Assistant', 25000.00,2), # branch 2
    (106,'Sanal C Babu','Library Assistant', 25000.00,3), # branch 3
    
    (107,'Arya R','Library Clerk', 15000.00,1), # branch 1 
    (108,'Athira V A','Library Clerk', 15000.00,2), # branch 2
    (109,'Sadhosh C','Library Clerk', 15000.00,3), # branch 3
    
    (110,'Achu R Babu','Cataloger', 40000.00,1), # branch 1 
    (111,'Alphonsa K R','Cataloger', 40000.00,2), # branch 2
    (112,'Sonu C J','Cataloger', 40000.00,3), # branch 3
    
    (113,'Amal Anand S','Children’s Librarian', 30000.00,1), # branch 1 
    (114,'Sana Jose','Children’s Librarian', 30000.00,2), # branch 2
    (115,'Jomon T J','Children’s Librarian', 30000.00,3), # branch 3
    
    (116,'Amala S Paul','IT Support Specialist', 50000.00,1), # branch 1 
    (117,'Jose M k','IT Support Specialist', 50000.00,2), # branch 2
    (118,'John Tarakan','IT Support Specialist', 50000.00,3), # branch 3
    
    (119,'Paul Wilson','Archivist', 45000.00,1), # branch 1 
    (120,'Mini k R','Archivist', 45000.00,2), # branch 2
    (121,'John K T','Archivist', 45000.00,3), # branch 3
    
    (122,'John Wilson','Circulation Supervisor', 35000.00,1), # branch 1 
    (123,'Nina R J','Circulation Supervisor', 35000.00,2), # branch 2
    (124,'Gopakumar P','Circulation Supervisor', 35000.00,3), # branch 3
    
    (125,'Sreeja Rajen','Custodian/Janitor', 12000.00,1), # branch 1 
    (126,'Thanka P k','Custodian/Janitor', 12000.00,2), # branch 2
    (127,'Priya V R','Custodian/Janitor', 12000.00,3), # branch 3
    
    (128,'Rajen M R','Volunteer Coordinator', 20000.00,1), # branch 1 
    (129,'Kamala S','Volunteer Coordinator', 20000.00,2), # branch 2
    (130,'Veena R Nair','Volunteer Coordinator', 20000.00,3); # branch 3
    
    # Show Employee Table
    SELECT * FROM employee;
    
    
# insert values into books table 
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
# Fiction books
('9780142437339', 'Moby-Dick', 'Fiction', 150.00, 'YES', 'Herman Melville', 'Penguin Classics'),
('9780385333849', 'The Lovely Bones', 'Fiction', 130.00, 'NO', 'Alice Sebold', 'Little, Brown and Company'),
('9780141182803', 'Atonement', 'Fiction', 160.00, 'YES', 'Ian McEwan', 'Anchor Books'),
('9780099518471', 'Catch-22', 'Fiction', 140.00, 'YES', 'Joseph Heller', 'Penguin Books'),
('9780140283334', 'Life of Pi', 'Fiction', 150.00, 'NO', 'Yann Martel', 'Vintage Books'),
('9780060935467', 'The Secret History', 'Fiction', 140.00, 'YES', 'Donna Tartt', 'Vintage'),
('9780374533557', 'Norwegian Wood', 'Fiction', 150.00, 'YES', 'Haruki Murakami', 'Vintage'),

# Non-fiction books
('9780525566153', 'Educated: A Memoir', 'Non-fiction', 160.00, 'YES', 'Tara Westover', 'Random House'),
('9780143039433', 'The Tipping Point', 'Non-fiction', 180.00, 'NO', 'Malcolm Gladwell', 'Back Bay Books'),
('9780385346658', 'Born a Crime', 'Non-fiction', 175.00, 'YES', 'Trevor Noah', 'Spiegel & Grau'),
('9780812981605', 'The Warmth of Other Suns', 'Non-fiction', 180.00, 'NO', 'Isabel Wilkerson', 'Vintage'),
('9780143127550', 'Just Mercy', 'Non-fiction', 150.00, 'YES', 'Bryan Stevenson', 'Spiegel & Grau'),
('9780143119753', 'Grit: The Power of Passion and Perseverance', 'Non-fiction', 180.00, 'YES', 'Angela Duckworth', 'Scribner'),
('9780143110439', 'Into the Wild', 'Non-fiction', 140.00, 'YES', 'Jon Krakauer', 'Anchor Books'),

# Biography
('9780385514231', 'Steve Jobs', 'Biography', 175.00, 'NO', 'Walter Isaacson', 'Simon & Schuster'),
('9780812993547', 'The Wright Brothers', 'Biography', 160.00, 'NO', 'David McCullough', 'Simon & Schuster'),
('9781812981605', 'Becoming', 'Biography', 180.00, 'YES', 'Michelle Obama', 'Crown Publishing'),
('9780307389642', 'Unbroken', 'Biography', 170.00, 'YES', 'Laura Hillenbrand', 'Random House'),
('9780802144652', 'The Glass Castle', 'Biography', 145.00, 'YES', 'Jeannette Walls', 'Scribner'),

# Science
('9780393354324', 'Sapiens: A Brief History of Humankind', 'Science', 200.00, 'YES', 'Yuval Noah Harari', 'Harper'),
('9780062316097', 'The Immortal Life of Henrietta Lacks', 'Science', 180.00, 'NO', 'Rebecca Skloot', 'Crown Publishing'),
('9780141040340', 'Guns, Germs, and Steel', 'Science', 180.00, 'YES', 'Jared Diamond', 'W. W. Norton & Company'),

# Self-Help
('9780062315007', 'Quiet: The Power of Introverts', 'Self-Help', 160.00, 'YES', 'Susan Cain', 'Broadway Books'),
('9780062457714', 'Everything Is F*cked: A Book About Hope', 'Self-Help', 160.00, 'YES', 'Mark Manson', 'HarperOne'),
('9780385348659', 'The Subtle Art of Not Giving a F*ck', 'Self-Help', 150.00, 'YES', 'Mark Manson', 'HarperOne'),
('9780385484510', 'The Four Agreements', 'Self-Help', 130.00, 'YES', 'Don Miguel Ruiz', 'Amber-Allen Publishing'),
('9780399592522', 'Atomic Habits', 'Self-Help', 175.00, 'YES', 'James Clear', 'Penguin Random House'),

# History
('9780195170274', 'The History of the Ancient World', 'History', 180.00, 'NO', 'Susan Wise Bauer', 'W.W. Norton'),
('9780307387424', 'Team of Rivals: The Political Genius of Abraham Lincoln', 'History', 190.00, 'YES', 'Doris Kearns Goodwin', 'Simon & Schuster'),
('9780345478045', '1776', 'History', 180.00, 'NO', 'David McCullough', 'Simon & Schuster'),
('9780143118298', 'The Silk Roads: A New History of the World', 'History', 170.00, 'YES', 'Peter Frankopan', 'Vintage'),

# Philosophy
('9780140449334', 'The Republic', 'Philosophy', 120.00, 'YES', 'Plato', 'Penguin Classics'),
('9780140449266', 'Meditations', 'Philosophy', 110.00, 'YES', 'Marcus Aurelius', 'Penguin Classics'),
('9780140449136', 'The Odyssey', 'Philosophy', 130.00, 'NO', 'Homer', 'Penguin Classics'),

# Fantasy
('9780060853983', 'Good Omens', 'Fantasy', 160.00, 'YES', 'Neil Gaiman & Terry Pratchett', 'William Morrow'),
('9780006479888', 'The Hobbit', 'Fantasy', 150.00, 'YES', 'J.R.R. Tolkien', 'Houghton Mifflin'),
('9780553573404', 'A Game of Thrones', 'Fantasy', 180.00, 'NO', 'George R. R. Martin', 'Bantam Books'),
('9780439139601', 'Harry Potter and the Goblet of Fire', 'Fantasy', 140.00, 'YES', 'J.K. Rowling', 'Bloomsbury'),

# Programming
('9780132350884', 'Clean Code: A Handbook of Agile Software Craftsmanship', 'Programming', 200.00, 'YES', 'Robert C. Martin', 'Prentice Hall'),
('9780201616224', 'The Pragmatic Programmer', 'Programming', 180.00, 'NO', 'Andrew Hunt & David Thomas', 'Addison-Wesley'),
('9780596007126', 'Head First Design Patterns', 'Programming', 210.00, 'YES', 'Eric Freeman & Elisabeth Robson', 'O\'Reilly Media'),
('9780134685991', 'Effective Java', 'Programming', 190.00, 'YES', 'Joshua Bloch', 'Addison-Wesley'),
('9781491950357', 'Python for Data Analysis', 'Programming', 180.00, 'NO', 'Wes McKinney', 'O\'Reilly Media'),

# Electronics
('9780131687800', 'The Art of Electronics', 'Electronics', 250.00, 'YES', 'Paul Horowitz & Winfield Hill', 'Cambridge University Press'),
('9780073529600', 'Microelectronic Circuits', 'Electronics', 230.00, 'NO', 'Adel S. Sedra & Kenneth C. Smith', 'Oxford University Press'),
('9781118702062', 'Electronics for Dummies', 'Electronics', 180.00, 'YES', 'Cathleen Shamieh', 'Wiley'),
('9780073380546', 'Digital Design', 'Electronics', 210.00, 'YES', 'Morris Mano', 'Pearson'),
('9780132141071', 'Fundamentals of Microelectronics', 'Electronics', 220.00, 'NO', 'Behzad Razavi', 'Wiley');

# Show books Table 
SELECT * FROM books;  

# Insert values into customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
	(1, 'Anjali Nair', 'Pokkattumuri, Thrissur', '2020-01-15'),
	(2, 'Aishwarya Menon', 'Puthur, Thrissur', '2023-02-20'),
	(3, 'Divya Nair', 'Mannuthy, Thrissur', '2023-03-05'),
	(4, 'Gayatri Menon', 'Kunnathunadu, Thrissur', '2023-04-10'),
	(5, 'Lakshmi Nair', 'Irinjalakuda, Thrissur', '2022-05-25'),
	(6, 'Meera Menon', 'Ollur, Thrissur', '2023-06-15'),
	(7, 'Nivedita Nair', 'Pudukad, Thrissur', '2021-07-22'),
	(8, 'Priya Menon', 'Guruvayur, Thrissur', '2021-08-30'),
	(9, 'Sreelakshmi Nair', 'Chalakudy, Thrissur', '2024-05-10'),
	(10, 'Asha Menon', 'Mulankunnathukavu, Thrissur', '2023-09-25'),
	(11, 'Anu Menon', 'Kuttur, Thrissur', '2022-03-18'),
	(12, 'Bindu Nair', 'kottekkad, Thrissur', '2021-11-05'),
	(13, 'Chandrika Menon', 'Kunnamkulam, Thrissur', '2024-02-12'),
	(14, 'Deepa Nair', 'kottekkad, Thrissur', '2020-09-28'),
	(15, 'Eesha Menon', 'Chavakkad, Thrissur', '2023-07-04'),
	(16, 'Fathima Nair', 'kuttur, Thrissur', '2021-05-19'),
	(17, 'Ganga Menon', 'Puthukkad, Thrissur', '2024-01-25'),
	(18, 'Hema Nair', 'Ayyanthole, Thrissur', '2020-08-11'),
	(19, 'Indira Menon', 'Vadanappally, Thrissur', '2020-12-22'),
	(20, 'Janaki Nair', 'kuttur, Thrissur', '2024-04-29');
    
# Show Customer Table 
SELECT * FROM customer;      

# Insert values into IssueStatus table 
INSERT INTO issuestatus (Issue_Id, Issued_cust, Issue_date, Isbn_book) 
VALUES
    (1, 1, '2024-01-15', '9780140283334'),  
    (2, 2, '2024-02-22', '9780143118298'), 
    (3, 3, '2024-03-10', '9780131687800'), 
    (4, 4, '2024-04-15', '9780553573404'), 
    (5, 5, '2023-05-30', '9780596007126'), 
    (6, 6, '2023-06-20', '9780132141071'),  
    (7, 7, '2024-07-25', '9780143110439'),  
    (8, 8, '2023-08-10', '9780307387424'),  
    (9, 9, '2024-09-05', '9780553573404'),  
    (10, 10, '2023-09-30', '9781491950357'),
    (11, 11, '2024-06-20', '9780141040340'),  
    (12, 12, '2023-07-25', '9780307389642'),  
    (13, 13, '2024-08-10', '9780073380546'),  
    (14, 17, '2024-09-05', '9780143110439'),  
    (15, 20, '2024-09-28', '9780062316097');
    
# Show Issuestatus Table 
SELECT * FROM issuestatus;     

# Insert values into returnstatus table
INSERT INTO returnstatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) 
VALUES
    (1, 1, 'Microelectronic Circuits', '2024-09-23','9780073529600'),  
	(2, 2, 'Python for Data Analysis', '2024-07-28','9781491950357'),  
    (3, 3, 'Clean Code: A Handbook of Agile Software Craftsmanship', '2024-03-25','9780132350884'),  
    (4, 4, 'Steve Jobs', '2024-02-28','9780385514231'),  
    (5, 20, 'A Game of Thrones', '2024-09-28','9780553573404');
    
# Show  returnstatus table
SELECT * FROM returnstatus;


# 1. Retrieve the boobooksk title, category, and rental price of all available books. 
SELECT Book_title, Category, Rental_Price FROM books WHERE Status = 'YES';


# 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM employee ORDER BY Salary DESC;


# 3. Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT books.Book_title, customer.Customer_name
FROM books
INNER JOIN issuestatus ON books.ISBN = issuestatus.Isbn_book
INNER JOIN customer ON issuestatus.Issued_cust = customer.Customer_Id;


# 4. Display the total count of books in each category. 
SELECT Category, COUNT(*) AS 'Number Of Books' 
FROM books
GROUP BY Category;


# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_name AS 'Employee Name' ,Position FROM employee WHERE Salary > 50000;


# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name AS 'Customer name', Reg_date AS'Registered Date'
FROM customer
LEFT JOIN issuestatus ON customer.Customer_Id = issuestatus.Issued_cust 
WHERE issuestatus.Issue_Id IS NULL AND customer.Reg_date < '2022-01-01';


# 7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no AS 'Branch number',  COUNT(*) AS 'Number of Employees'
FROM employee
GROUP BY Branch_no;



# 8. Display the names of customers who have issued books in the month of June 2023.
SELECT Customer_name AS 'Customer Name', issuestatus.Issue_date AS 'Issue Date'
FROM customer
INNER JOIN issuestatus on customer.Customer_Id = issuestatus.Issued_cust 
WHERE MONTH(issuestatus.Issue_date) = 6 AND YEAR(issuestatus.Issue_date) = 2023;


# 9. Retrieve book_title from book table containing history. 
SELECT Book_title AS 'Book titles containing history'
FROM books
WHERE Book_title LIKE '%history%';


# 10.Retrieve the branch numbers along with the count of branch numbers for branches having more than 5 employees
SELECT Branch_no AS 'Branch number' , COUNT(*) AS'Employee count'
FROM employee
GROUP BY Branch_no 
HAVING COUNT(*) > 5;



# 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT employee.Emp_name AS 'Employee Name', branch.Branch_address AS 'Branch Address'
FROM employee
INNER JOIN branch ON employee.Emp_Id = branch.Manager_Id;



# 12.  Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT customer.Customer_name AS 'Customers who have issued books with a rental price higher than Rs. 25'
FROM customer
INNER JOIN issuestatus ON customer.Customer_Id = issuestatus.Issued_cust
INNER JOIN books ON issuestatus.Isbn_book = books.ISBN
WHERE books.Rental_Price > 25;