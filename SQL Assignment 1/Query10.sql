-- 10. BOPIS Orders Revenue (Last Year)
-- Business Problem:
-- BOPIS (Buy Online, Pickup In Store) is a key retail strategy. Finance wants to know the revenue from BOPIS orders for the previous year.

-- Fields to Retrieve:

-- TOTAL ORDERS
-- TOTAL REVENUE

Solution:
select count(oh.order_id) as total_order, 
       sum(oh.grand_total) as total_Revenue
from order_item_ship_group oisg 
JOIN order_header oh on oisg.order_id = oh.order_id
where oisg.shipment_method_type_id = 'STOREPICKUP' and oh.sales_channel_enum_id = 'WEB_SALES_CHANNEL'
and oh.order_date >= curdate() - INTERVAL 1 YEAR;
