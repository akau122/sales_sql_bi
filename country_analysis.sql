CREATE TABLE public."sales_data" as
select * from public."Canada"
UNION ALL
SELECT * FROM public."India sales"
Union all
SELECT * FROM public."Nigeria sales"
Union all
SELECT * FROM public."china sales"
Union all
SELECT * FROM public."uk sales"
Union all
SELECT * FROM public."us sales"



-- Finding an null values

select * 
from public."sales_data"
where
    "Country" is null
	or "Price Per Unit" is null
	or "Quantity Purchased" is null
	or "Cost Price" is null
	or "Discount Applied" is null;


--suppose correct quantity was = 3

update public."sales_data"
set "Quantity Purchased" = 3
where "Transaction ID" = '00a30472-89a0-4688-9d33-67ea8ccf7aea'


--Fill null value of PPU with average value

update public."sales_data"
set "Price Per Unit" = (
    SELECT AVG("Price Per Unit")
	from public."sales_data"
	where "Price Per Unit" is not null
)
where "Transaction ID" = '001898f7-b696-4356-91dc-8f2b73d09c63';


--Duplicates

select "Transaction ID", Count(*)
from public."sales_data"
group by "Transaction ID"
having count(*)>1;


--New column showing total amount

Alter table public."sales_data" add
column"Total Amount" Numeric(10,2);

update public."sales_data"
set "Total Amount"=("Price Per Unit" * "Quantity Purchased") - "Discount Applied";


--Profit calculation

alter table public."sales_data" add
column "Profit" Numeric(10,2);

update public."sales_data"
set "Profit"="Total Amount" - ("Cost Price" * "Quantity Purchased");


--Sales and Profit by country

SELECT 
    "Country", 
    SUM("Total Amount") AS "Total Revenue",
    SUM("Profit") AS "Total Profit"
FROM public."sales_data"
WHERE "Date" BETWEEN '2025-02-10' AND '2025-02-14'
GROUP BY "Country"
ORDER BY "Total Revenue" DESC;


--Top 5 products

SELECT 
    "Product Name", 
    SUM("Quantity Purchased") AS "Total Units Sold"
FROM public."sales_data"
WHERE "Date" BETWEEN '2025-02-10' AND '2025-02-14'
GROUP BY "Product Name"
ORDER BY "Total Units Sold" DESC
LIMIT 5;

--best sales representative

SELECT 
    "Sales Representative", 
    SUM("Total Amount") AS "Total Sales"
FROM public."sales_data"
WHERE "Date" BETWEEN '2025-02-10' AND '2025-02-14'
GROUP BY "Sales Representative"
ORDER BY "Total Sales" DESC
LIMIT 5;


---Store locations generating highest sales

SELECT 
    "Store Location", 
    SUM("Total Amount") AS "Total Sales",
    SUM("Profit") AS "Total Profit"
FROM public."sales_data"
WHERE "Date" BETWEEN '2025-02-10' AND '2025-02-14'
GROUP BY "Store Location"
ORDER BY "Total Sales" DESC
limit 5;

--Key sales and profit insights

SELECT 
    MIN("Total Amount") AS "Min Sales Value",
    MAX("Total Amount") AS "Max Sales Value",
    AVG("Total Amount") AS "Avg Sales Value",
    SUM("Total Amount") AS "Total Sales Value",
    MIN("Profit") AS "Min Profit",
    MAX("Profit") AS "Max Profit",
    AVG("Profit") AS "Avg Profit",
    SUM("Profit") AS "Total Profit"
FROM public."sales_data"
WHERE "Date" BETWEEN '2025-02-10' AND '2025-02-14';



