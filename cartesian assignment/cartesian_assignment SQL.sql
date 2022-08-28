Create database Product;
Use  Product;
create table purchase_history(
Bills_Id long,
Customer int,
Product_Id int,
Sale_Qty int,
Bill_Amount int,
Bill_Date date);

create table product_cat (
product_id int,
dep_id int,
cat_id int
);

create view top2 as
(select product_cat.cat_id, product_cat.product_id,  
DENSE_RANK() over ( partition by product_cat.cat_id order by purchase_history.Bill_date desc) trending
from product_cat
left join purchase_history
on purchase_history.Product_Id = product_cat.product_id 
);

select * from top2;

SELECT *
FROM   top2 s
WHERE 
        (
            SELECT  COUNT(*) 
            FROM    top2 f
            WHERE f.cat_id = s.cat_id AND 
                  f.trending <= s.trending
        ) <= 3;




CREATE TABLE Customer (Customer_Id varchar(255));
INSERT INTO Customer VALUES('Abhinash'),('Vipin'),('Mahesh'),('Bijoy'),('Bhabani'),('Ashutosh');
    
CREATE TABLE Voucher (Voucher_Id varchar(255) UNIQUE);
INSERT INTO Voucher VALUES('ABXFH'),('SDFGH'),('ERTYY'),('PPLKM');
    
    

 
create view cte
as ( select * , row_number() over (order by customer_id) rr from customer)
;

create view cte2
as ( select *, row_number() over (order by voucher_id) rr from voucher)
;

select c1.Customer_Id, c2.Voucher_Id
from cte c1
join cte2 c2 on c1.rr=c2.rr
 ;
 
