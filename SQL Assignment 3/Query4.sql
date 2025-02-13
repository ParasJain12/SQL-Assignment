-- 4. Returns and Appeasements
-- Business Problem:
-- The retailer needs the total amount of items, were returned as well as how many appeasements were issued.

-- Fields to Retrieve:

-- TOTAL RETURNS
-- RETURN $ TOTAL
-- TOTAL APPEASEMENTS
-- APPEASEMENTS $ TOTAL

Solution:-
select count(ri.return_id) as TotalReturn,
       sum(ri.return_price * return_quantity) as Return_Total,
       count(ra.return_id) as TotalAppeasement,
       sum(ra.amount) as Appeasement_Total
from Return_item ri 
JOIN return_adjustment ra on ra.return_id = ri.return_id
where ra.return_adjustment_type_id = 'APPEASEMENT';
