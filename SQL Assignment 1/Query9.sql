-- 9. Orders Completed Hourly
-- Business Problem:
-- Operations teams may want to see how orders complete across the day to schedule staffing.

-- Fields to Retrieve:

-- TOTAL ORDERS
-- HOUR

Solution:-
select count(order_id) as total_order,
       hour(Status_Datetime) as hr
from Order_Status os 
where status_id = 'Order_Completed' group by hr;
