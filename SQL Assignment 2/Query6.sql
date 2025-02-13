-- 6. Low Stock or Out of Stock Items Report
-- Business Problem:
-- Avoiding out-of-stock situations is critical. This report flags items that have fallen below a certain reorder threshold or have zero available stock.

-- Fields to Retrieve:

-- PRODUCT_ID
-- PRODUCT_NAME
-- FACILITY_ID
-- QOH (Quantity on Hand)
-- ATP (Available to Promise)
-- REORDER_THRESHOLD
-- DATE_CHECKED

Solution:
select p.product_id,
       p.product_name,
       ii.facility_id,
       ii.quantity_on_hand_total as QOH,
       ii.available_to_promise_total as ATP,
       pf.reorder_quantity as Reorder_Threshold,
       pf.last_updated_stamp as Date_Checked
from product p
JOIN Inventory_Item ii on ii.product_id = p.product_id
JOIN Product_facility pf on pf.product_id = p.product_id;
