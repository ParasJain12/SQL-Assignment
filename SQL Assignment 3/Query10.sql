-- 10. Total Items in Various Virtual Facilities
-- Business Problem:
-- Virtual facilities (such as online-only fulfillment centers) handle a different inventory process. The company wants a snapshot of total stock across these virtual locations.

-- Fields to Retrieve:

-- PRODUCT_ID
-- FACILITY_ID
-- FACILITY_TYPE_ID
-- QOH (Quantity on Hand)
-- ATP (Available to Promise)

Solution:-
select ii.product_id,
       ii.facility_id,
       f.facility_type_id,
       ii.quantity_on_hand_total,
       ii.available_to_promise_total
from Inventory_Item ii
JOIN facility f on f.facility_id = ii.facility_id
where f.facility_type_id = 'VIRTUAL_FACILITY' or f.facility_type_id = 'CONFIGURATION';
