use testdb;

select * from Client;
SELECT MAX(client_id) as maxClientId FROM Client;


-- Create the Client table
CREATE TABLE Client (
    client_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50)NOT NULL,
    address VARCHAR(100)NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_no VARCHAR(20) NOT NULL,
    creditcard_info VARCHAR(16)
);

-- Create the Tree table
CREATE TABLE Tree (
    tree_id INT PRIMARY KEY,
    size VARCHAR(20),
    height DECIMAL(8, 2),
    location VARCHAR(100) NOT NULL,
    isNearHouse BOOLEAN,
    note TEXT
);

-- Create the Quote table with a foreign key reference to Client
CREATE TABLE Quote (
    quote_id INT PRIMARY KEY,
    client_id INT NOT NULL,
    request_date DATE NOT NULL,
    note TEXT,
    treeId INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(client_id),
    FOREIGN KEY (treeId) REFERENCES Tree(tree_id)
);

-- Create the Order table with foreign key references to Quote
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    quote_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (quote_id) REFERENCES Quote(quote_id)
);

-- Create the Bill table with a foreign key reference to Order
CREATE TABLE Bill (
    bill_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    note TEXT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert some sample data into the Client and Tree tables
INSERT INTO Client (client_id, first_name, last_name, address, email, phone_no)
VALUES
    (1, 'John', 'Doe', '123 Main St', 'johndoe@example.com', '555-123-4567'),
    (2, 'Jane', 'Smith', '456 Elm St', 'janesmith@example.com', '555-987-6543');

INSERT INTO Tree (tree_id, size, height, location, isNearHouse, note)
VALUES
    (1, 'Large', 15.5, 'Backyard', true, 'Tall oak tree'),
    (2, 'Medium', 8.2, 'Front yard', false, 'Small apple tree');

-- Insert some sample data into the Quote table
INSERT INTO Quote (quote_id, client_id, request_date, note, treeId, status)
VALUES
    (1, 1, '2023-10-24', 'Tree trimming request', 1, 'Pending'),
    (2, 2, '2023-10-25', 'Tree removal request', 2, 'Approved');

-- Insert some sample data into the Order table
INSERT INTO Orders (order_id, quote_id, start_date, end_date)
VALUES
    (1, 1, '2023-10-26', '2023-10-28'),
    (2, 2, '2023-10-27', '2023-10-30');

-- Insert some sample data into the Bill table
INSERT INTO Bill (bill_id, order_id, total_amount, status, note)
VALUES
    (1, 1, 500.00, 'Paid', 'Tree trimming service'),
    (2, 2, 750.00, 'Pending', 'Tree removal service');





select * from Bill;
select * from Client;
select * from Orders;
select * from Quote;
select * from Tree;


delete from  User; 
delete from Bill;
delete from Orders;
delete from Quote;
delete from Tree;
delete from Client;
SET SQL_SAFE_UPDATES = 0;
