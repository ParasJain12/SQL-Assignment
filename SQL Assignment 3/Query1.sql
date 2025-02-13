-- 1. Completed Sales Orders (Physical Items)
-- Business Problem:
-- Merchants need to track only physical items (requiring shipping and fulfillment) for logistics and shipping-cost analysis.

-- Fields to Retrieve:

-- ORDER_ID
-- ORDER_ITEM_SEQ_ID
-- PRODUCT_ID
-- PRODUCT_TYPE_ID
-- SALES_CHANNEL_ENUM_ID
-- ORDER_DATE
-- ENTRY_DATE
-- STATUS_ID
-- STATUS_DATETIME
-- ORDER_TYPE_ID
-- PRODUCT_STORE_ID

Solution:-
select oi.order_id,
       oi.order_item_seq_id,
       oi.product_id,
       p.product_type_id,
       oh.sales_channel_enum_id,
       oh.order_date,
       oh.entry_date,
       oh.status_id,
       os.status_datetime,
       oh.order_type_id,
       oh.product_store_id
from Order_Item oi
JOIN Order_Header oh on oh.order_id = oi.order_id
JOIN Product p on p.product_id = oi.product_id
JOIN Product_Type pt on pt.product_type_id = p.product_type_id
JOIN Order_status os on os.order_id = oi.order_id and os.status_id = oh.status_id
where oh.status_id = 'ORDER_COMPLETED' and pt.is_physical = 'Y';
