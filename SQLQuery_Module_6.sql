Select * from Employee
select *,
case
when Salary<=1000 then 'C'
when Salary<=2000 then 'B'
when Salary <=3000 then 'B+'
when Salary <=4000 then 'A'
else 'A+'
end as Salary_Grd
select * from Employee 
select * from Employee
where EmployeeId = 6
-- Science Book
10 chapters --- 400 pages
1 --- 5-25
2-   26-56
3   -- 57-120
-- Query Optimization ?
Select * from employee
where Employee_Id = 6
--  it will read all 8 records that are available in my table

--== Indexes
	-- They are routes to better performance in SQL Server
	-- Index's helps in faster access by providing swift access to rows in data tables
	-- This is very similar to an index page in a book
	-- Microsoft very often makes changes to the way Indexes are organized and managed
--== Index Structure	 
	-- Indexes are basically created on tables(columns)
	-- They provide faster access to data using the column 
		-- on which the index is created (indexed column)
	-- Indexes are basically B-Tree(Binary Tree) structures which helps us in flattening our tables
		-- and hence providing easy access to the data rows
	-- Without an index, a table is called a heap
	-- We can create indexes on most data columns in a table
	-- We cannot create indexes on Large object data types (LOB)
		-- image data, text data, varchar(max), nvarchar(max)
	-- Indexes are very effective when created on a unique integer column
Heap:
folded all clothes
/*
Employee
(EmployeeId, Name, Designation, Salary, Department)
1 
2
3
4
5
6
7
8
9
10
....
20
SELECT * FROM Employee WHERE EmployeeID = 10
Without Index - 20 Reads -- Table Scan
With Index - 3 Reads - Index Seek
le

1							1-20
2				1-10					11-20
3		1-5				6-10		11-15			16-20
4	1-2		3-5		6-7		8-10 11-12	13-15	16-17	18-20

							8 - (Address Pointer)
							9 - (Address Pointer2)
							10- (Address Pointer3)
							8-x,9-y,10-z
5	1-,2-		3,4,5	6,7		8,9,10 
1-999()
1 2 3 4 5 6 7 8 9 10  -----				999
*/
 
--== Types of Indexes
	-- Clustered Index
		-- The complete data row is actually stored in the leaf node of the index
		-- The indexed column is either arranged in ascending or descending order		
		-- The data is physically sorted in asc or desc in the data file itself
		-- You can have only one clustered index per table
		-- You can include multiple columns in the clustered index, but it is not always recommended.
		-- Table with a clustered index is usually referred to as a clustered table 
	-- Non Clustered Index
		-- Unlike the CI, leaf nodes of NCI does not store the entire data row
		-- Instead it stores a pointer/memory address to the row in the memory
		-- The NCIndexed column data is sorted but on the fly
		-- You can have more than one NCI on a table
		-- SQL Server 2005 supports 249 NCI, SQL Server 2008 supports +999 
--INDEXES ARE A NECESSARY EVIL
 
CREATE TABLE IndexTest (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
 
-- Insert values into the table
DECLARE @i INT = 1;
WHILE @i <= 10000
BEGIN
    INSERT INTO IndexTest (id, name)
    VALUES (@i, 'Vyankat' + CAST(@i AS VARCHAR(5)));
    SET @i = @i + 1;
END;