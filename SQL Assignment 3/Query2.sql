-- 2. Completed Return Items
-- Business Problem:
-- Customer service and finance often need insights into returned items to manage refunds, replacements, and inventory restocking.

-- Fields to Retrieve:

-- RETURN_ID
-- ORDER_ID
-- PRODUCT_STORE_ID
-- STATUS_DATETIME
-- ORDER_NAME
-- FROM_PARTY_ID
-- RETURN_DATE
-- ENTRY_DATE
-- RETURN_CHANNEL_ENUM_ID

Solution:-
select rh.return_id,
       ri.order_id,
       oh.product_store_id,
       rs.status_datetime,
       oh.order_name,
       rh.from_party_id,
       rh.return_date,
       rh.entry_date,
       rh.return_channel_enum_id
from return_header rh
JOIN return_item ri on ri.return_id = rh.return_id
JOIN order_header oh on oh.order_id = ri.order_id
JOIN return_status rs on rs.return_id = rh.return_id
where rh.status_Id = 'RETURN_COMPLETED';
