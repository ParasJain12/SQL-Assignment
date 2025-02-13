-- 2. Orders from New York
-- Business Problem:
-- Companies often want region-specific analysis to plan local marketing, staffing, or promotions in certain areas—here, specifically, New York.

-- Fields to Retrieve:

-- ORDER_ID
-- CUSTOMER_NAME
-- STREET_ADDRESS (or shipping address detail)
-- CITY
-- STATE_PROVINCE
-- POSTAL_CODE
-- TOTAL_AMOUNT
-- ORDER_DATE
-- ORDER_STATUS

Solution:-
select oh.order_id,
       pe.first_name || ' ' || pe.last_name  AS Customer_Name,
       pa.address1 AS street_address,
       pa.city,
       pa.state_province_geo_id AS state_province,
       pa.postal_code,
       oh.grand_total as total_amount,
       oh.order_date,
       oh.status_id as Order_status
from Order_Header oh
JOIN ORDER_ROLE orr on oh.order_id = orr.order_id and orr.role_type_id like '%customer'
JOIN Person pe on pe.party_id = orr.party_id
JOIN order_contact_mech ocm ON oh.order_id = ocm.order_id
JOIN contact_mech cm ON ocm.contact_mech_id = cm.contact_mech_id
JOIN postal_address pa ON cm.contact_mech_id = pa.contact_mech_id
WHERE pa.state_province_geo_id = 'NY';
