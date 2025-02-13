-- 6. Orders with Multiple Returns
-- Business Problem:
-- Analyzing orders with multiple returns can identify potential fraud, chronic issues with certain items, or inconsistent shipping processes.

-- Fields to Retrieve:

-- ORDER_ID
-- RETURN_ID
-- RETURN_DATE
-- RETURN_REASON
-- RETURN_QUANTITY

Solution:-
select ri.order_id,
       rh.return_id,
       rh.return_date,
       ri.return_reason_id as return_reason,
       ri.return_quantity
from return_header rh
JOIN return_item ri on ri.return_id = rh.return_id;
