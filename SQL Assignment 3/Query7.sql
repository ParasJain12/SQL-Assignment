-- 7. Store with Most One-Day Shipped Orders (Last Month)
-- Business Problem:
-- Identify which facility (store) handled the highest volume of “one-day shipping” orders in the previous month, useful for operational benchmarking.

-- Fields to Retrieve:

-- FACILITY_ID
-- FACILITY_NAME
-- TOTAL_ONE_DAY_SHIP_ORDERS
-- REPORTING_PERIOD

Solution:-
select oisg.facility_id,
       f.facility_name,
       count(oisg.order_id ) as TotalOneDayShippingOrder,
       concat(min(DATE(oisg.estimated_ship_date)), ' to ', max(DATE(oisg.estimated_ship_date))) as ReportingPeriod
from Order_Item_Ship_Group oisg
JOIN Order_shipment os on os.order_id = oisg.order_id
JOIN Shipment s on s.shipment_id = os.shipment_id
JOIN Facility f on f.facility_id = oisg.facility_id
where oisg.shipment_method_type_id = 'NEXT_DAY' and s.status_id = 'SHIPMENT_SHIPPED'
GROUP BY oisg.facility_id
order by TotalOneDayShippingOrder;
