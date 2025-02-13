-- 7. Retrieve the Current Facility (Physical or Virtual) of Open Orders
-- Business Problem:
-- The business wants to know where open orders are currently assigned, whether in a physical store or a virtual facility (e.g., a distribution center or online fulfillment location).

-- Fields to Retrieve:

-- ORDER_ID
-- ORDER_STATUS
-- FACILITY_ID
-- FACILITY_NAME
-- FACILITY_TYPE_ID

Solution:-
select oh.order_id,
       oh.status_id AS order_status,
       ii.facility_id,
       f.facility_name,
       f.facility_type_id
from Order_Header oh
JOIN inventory_item_detail iid on iid.order_id = oh.order_id
JOIN inventory_item ii on ii.inventory_item_id = iid.inventory_item_id
JOIN Facility f on f.facility_id = ii.facility_id
where oh.status_Id = 'ORDER_APPROVED';
