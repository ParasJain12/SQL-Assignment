-- 1. Shipping Addresses for October 2023 Orders
-- Business Problem:
-- Customer Service might need to verify addresses for orders placed or completed in October 2023. This helps ensure shipments are delivered correctly and prevents address-related issues.

-- Fields to Retrieve:

-- ORDER_ID
-- PARTY_ID (Customer ID)
-- CUSTOMER_NAME (or FIRST_NAME / LAST_NAME)
-- STREET_ADDRESS
-- CITY
-- STATE_PROVINCE
-- POSTAL_CODE
-- COUNTRY_CODE
-- ORDER_STATUS
-- ORDER_DATE

Solution:
select  oh.order_id, 
	oh.status_id as order_status, 
        oh.order_date, 
        or2.PARTY_ID as Customer_Id,  
        p.FIRST_NAME || ' ' || p.LAST_NAME as customer_name ,
        pa.address1 as street_address,
        pa.city,
        pa.state_province_geo_id as state_province,
        pa.postal_code,
        pa.country_geo_id as country_code
from order_header oh
JOIN order_role or2 on or2.ORDER_ID = oh.ORDER_ID and or2.ROLE_TYPE_ID like "%customer"
JOIN person p on p.PARTY_ID = or2.PARTY_ID 
JOIN order_contact_mech ocm on ocm.ORDER_ID = oh.ORDER_ID
JOIN contact_mech cm on cm.CONTACT_MECH_ID = ocm.CONTACT_MECH_ID and ocm.CONTACT_MECH_PURPOSE_TYPE_ID = 'SHIPPING_LOCATION'
JOIN postal_address pa on pa.CONTACT_MECH_ID = cm.CONTACT_MECH_ID 
where ((oh.ORDER_DATE between '2023-10-01' and '2023-10-31') and (oh.STATUS_ID = 'ORDER_CREATED'))
or (oh.STATUS_ID = 'ORDER_COMPLETED' and oh.ENTRY_DATE between '2023-10-01' and '2023-10-31');
