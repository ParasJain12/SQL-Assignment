-- 3. Top-Selling Product in New York
-- Business Problem:
-- Merchandising teams need to identify the best-selling product(s) in a specific region (New York) for targeted restocking or promotions.

-- Fields to Retrieve:

-- PRODUCT_ID
-- INTERNAL_NAME
-- TOTAL_QUANTITY_SOLD
-- CITY / STATE (within New York region)
-- REVENUE (optionally, total sales amount)

Solution:-
select p.product_Id,
       p.internal_name,
       sum(oi.quantity) as Total_Quantity_Sold,
       sum(oh.grand_total) as Total_Revenue
from Order_Item oi 
JOIN Product p on p.product_id = oi.product_id
JOIN Order_Header oh on oh.order_id = oi.order_id
JOIN Order_contact_mech ocm on ocm.order_id = oh.order_id and ocm.contact_mech_purpose_type_id like '%location'
JOIN postal_address pa on pa.contact_mech_id = ocm.contact_mech_id
where pa.state_province_geo_id = 'NY' AND  oi.status_id = 'ITEM_COMPLETED'
group by p.product_id;
