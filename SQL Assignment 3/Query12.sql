-- 12. Orders Without Picklist
-- Business Problem:
-- A picklist is necessary for warehouse staff to gather items. Orders missing a picklist might be delayed and need attention.

-- Fields to Retrieve:

-- ORDER_ID
-- ORDER_DATE
-- ORDER_STATUS
-- FACILITY_ID
-- DURATION (How long has the order been assigned at the facility)

Solution:-
select oh.order_id,
       oh.order_date,
       oisg.facility_id,
       oh.status_id
       datediff(DATE(oh.entry_date),DATE(oh.entry_date)) as Duration
from Order_Header oh
JOIN Order_Item_Ship_Group oisg on oh.order_id = oisg.order_id
JOIN Picklist pi on pi.facility_id = oisg.facility_id
where pi.status_id is null; 
