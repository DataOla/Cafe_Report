SELECT * 
FROM cafe_shops;

SELECT * 
FROM cafe_shops
WHERE Payment_Method = "Credit Card";

SELECT Payment_Method, COUNT(Payment_Method)
FROM cafe_shops
GROUP BY Payment_Method;

SELECT Location, COUNT(Location)
FROM cafe_shops
GROUP BY Location;

SELECT *
FROM cafe_shops
WHERE Payment_Method = "";

--- Turning blanks/ERROR to null ---

UPDATE cafe_shops
SET Payment_Method = NULL
WHERE Payment_Method = "";

UPDATE cafe_shops
SET Location = NULL
WHERE Location = "";

UPDATE cafe_shops
SET Transaction_Date = NULL
WHERE Transaction_Date = "";

UPDATE cafe_shopper
SET Item = NULL
WHERE Item = "ERROR";

--- renaming the column headers ---

ALTER TABLE cafe_shops
RENAME COLUMN `Transaction ID` to Transaction_ID;

ALTER TABLE cafe_shops
RENAME COLUMN `Price Per Unit` to Price_Per_Unit;

--- Created a new table with row number to aid future data cleaning and standardizing ---

SELECT *,
ROW_NUMBER() OVER (ORDER BY Transaction_ID ASC) AS Row_num
FROM cafe_shops
;

CREATE TABLE `cafe_shopper` (
  `Transaction_ID` text,
  `Item` text,
  `Quantity` int DEFAULT NULL,
  `Price_Per_Unit` int DEFAULT NULL,
  `Total_Spent` int DEFAULT NULL,
  `Payment_Method` text,
  `Location` text,
  `Transaction_Date` text,
  `Row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO cafe_shopper
SELECT *,
ROW_NUMBER() OVER (ORDER BY Transaction_ID ASC) AS Row_num
FROM cafe_shops;

--- unorthordoxly filling NULL payment rows with the three unique values ---

UPDATE cafe_shopper
SET Payment_Method = "Credit Card"
WHERE Payment_Method IS NULL
	AND Row_num BETWEEN 1 AND 3333
    ;

UPDATE cafe_shopper
SET Payment_Method = "Cash"
WHERE Payment_Method IS NULL
	AND Row_num BETWEEN 3334 AND 6666
    ;

UPDATE cafe_shopper
SET Location = "In-store"
WHERE Location IS NULL
	AND Row_num BETWEEN 1 AND 5000
    ;

UPDATE cafe_shopper
SET Location = "Takeaway"
WHERE Location IS NULL
	AND Row_num BETWEEN 5001 AND 10000
    ;

--- handling INT colums with 0 --- 

UPDATE cafe_shopper
SET Quantity = NULL
WHERE Quantity = 0;

UPDATE cafe_shopper
SET Total_Spent = NULL
WHERE Total_Spent = 0;

--- removed the row number column --- 

ALTER TABLE cafe_shopper
DROP COLUMN Row_num;

--- SQL rounded up all values with decimal, so I modified the columns ---

ALTER TABLE cafe_shopper
MODIFY COLUMN Price_Per_Unit DECIMAL(5,2);

ALTER TABLE cafe_shopper
MODIFY COLUMN Total_Spent DECIMAL(5,2);

--- Changed the rounded figure back to its original value ---

UPDATE cafe_shopper
SET Price_Per_Unit = 1.50
WHERE Item = "Tea";

--- checked and fixed the calculation for the affected rows ---

SELECT *
FROM cafe_shopper
WHERE Item = 'Tea'
  AND MOD(Quantity, 2) = 1;

SELECT *
FROM cafe_shopper
WHERE Total_Spent != Price_Per_Unit * Quantity;

UPDATE cafe_shopper
SET Total_Spent = Price_Per_Unit * Quantity
WHERE Item = "Tea";