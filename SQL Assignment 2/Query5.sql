-- 5. Lost and Damaged Inventory
-- Business Problem:
-- Warehouse managers need to track “shrinkage” such as lost or damaged inventory to reconcile physical vs. system counts.

-- Fields to Retrieve:

-- INVENTORY_ITEM_ID
-- PRODUCT_ID
-- FACILITY_ID
-- QUANTITY_LOST_OR_DAMAGED
-- REASON_CODE (Lost, Damaged, Expired, etc.)
-- TRANSACTION_DATE

Solution:-
select iiv.inventory_item_id,
       ii.product_id,
       ii.facility_id,
       iiv.created_tx_stamp as Transaction_Date,
       iiv.variance_reason_id as reason_code
from inventory_item_variance iiv
JOIN inventory_item ii on ii.inventory_item_id = iiv.inventory_item_id
where iiv.variance_reason_id = 'VAR_LOST' or iiv.variance_reason_id = 'VAR_DAMAGED';
