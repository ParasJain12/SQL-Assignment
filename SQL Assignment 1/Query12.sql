-- 12. Product Threshold Value
-- Business Problem The retailer has set a threshild value for products that are sold online, in order to avoid over selling.

-- Fields to Retrieve:

-- PRODUCT ID
-- THRESHOLD

Solution:-
select pf.PRODUCT_ID ,pf.FACILITY_ID ,pf.MINIMUM_STOCK as THRESHOLD
from product_facility pf 
JOIN facility f 
on f.facility_id=pf.FACILITY_ID
where f.FACILITY_TYPE_ID = 'CONFIGURATION' and pf.MINIMUM_STOCK is not null order by THRESHOLD DESC;
