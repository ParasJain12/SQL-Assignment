-- 9. Total Facilities That Sell the Product
-- Business Problem:
-- Retailers want to see how many (and which) facilities (stores, warehouses, virtual sites) currently offer a product for sale.

-- Fields to Retrieve:

-- PRODUCT_ID
-- PRODUCT_NAME (or INTERNAL_NAME)
-- FACILITY_COUNT (number of facilities selling the product)
-- (Optionally) a list of FACILITY_IDs if more detail is needed

Solution:-
select p.product_id,
       p.product_name,
       count(p.facility_id) as FacilityCount
from Product p
group by p.product_id;
