-- 4. Store-Specific (Facility-Wise) Revenue
-- Business Problem:
-- Different physical or online stores (facilities) may have varying levels of performance. The business wants to compare revenue across facilities for sales planning and budgeting.

-- Fields to Retrieve:

-- FACILITY_ID
-- FACILITY_NAME
-- TOTAL_ORDERS
-- TOTAL_REVENUE
-- DATE_RANGE

Solution:-
select 
    f.facility_id as facility_id,
    f.facility_name as facility_name,
    count(oh.order_id) as total_orders,
    sum(oh.grand_total) as total_revenue,
    concat(min(oh.entry_date), ' to ', max(oh.entry_date)) as date_range
from order_header oh
JOIN order_item_ship_group oisg on oh.order_id = oisg.order_id and oh.status_id = 'ORDER_COMPLETED'
JOIN facility f on oisg.facility_id = f.facility_id 
group by f.facility_id
order by total_revenue desc;
