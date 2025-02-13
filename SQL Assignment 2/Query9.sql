-- 9. Order Item Current Status Changed Date-Time
-- Business Problem:
-- Operations teams need to audit when an order item’s status (e.g., from “Pending” to “Shipped”) was last changed, for shipment tracking or dispute resolution.

-- Fields to Retrieve:

-- ORDER_ID
-- ORDER_ITEM_SEQ_ID
-- CURRENT_STATUS_ID
-- STATUS_CHANGE_DATETIME
-- CHANGED_BY

Solution:-
select oi.order_id, 
       oi.order_item_seq_id,
       oi.status_id as current_status_id,
       oi.last_updated_stamp as status_change_datetime,
       oi.change_by_user_login_id as changed_by
from order_item oi;
