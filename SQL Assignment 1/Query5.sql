-- 5. Completed Orders in August 2023
-- Business Problem:
-- After running similar reports for a previous month, you now need all completed orders in August 2023 for analysis.

-- Fields to Retrieve:

-- PRODUCT_ID
-- PRODUCT_TYPE_ID
-- PRODUCT_STORE_ID
-- TOTAL_QUANTITY
-- INTERNAL_NAME
-- FACILITY_ID
-- EXTERNAL_ID
-- FACILITY_TYPE_ID
-- ORDER_HISTORY_ID
-- ORDER_ID
-- ORDER_ITEM_SEQ_ID
-- SHIP_GROUP_SEQ_ID
Solution:-

select oh.order_id,
       oh.status_id AS Order_Status,
       oi.status_id AS OrderItem_Status,
       p.internal_name,
       p.product_type_id,
       f.facility_id,
       oh.external_id,
       oi.product_id,
       oh.product_store_id,
       oi.quantity as TOTAL_QUANTITY,
       f.facility_type_id,
       ohi.order_history_id,
       oi.order_id,
       oi.order_item_seq_id,
       oisg.ship_group_seq_id,
       oisg.facility_id
from order_header oh
JOIN order_item oi on oi.order_id = oh.order_id
JOIN order_status os on os.order_id = oh.order_id and oh.STATUS_ID = 'order_completed' and os.STATUS_ID = 'order_completed'
JOIN product p on p.product_id = oi.product_id
JOIN order_item_ship_group oisg on oi.order_id = oisg.order_id and oi.SHIP_GROUP_SEQ_ID = oisg.SHIP_GROUP_SEQ_ID
JOIN facility f on f.facility_id = oisg.facility_id
JOIN order_history ohi on oh.order_id = ohi.order_id and oi.ORDER_ITEM_SEQ_ID = ohi.ORDER_ITEM_SEQ_ID
where os.status_datetime BETWEEN '2023-08-01' and '2023-08-30';
