-- 3.Products Missing NetSuite ID
-- Business Problem:
-- A product cannot sync to NetSuite unless it has a valid NetSuite ID. The OMS needs a list of all products that still need to be created or updated in NetSuite.

-- Fields to Retrieve:

-- PRODUCT_ID
-- INTERNAL_NAME
-- PRODUCT_TYPE_ID
-- NETSUITE_ID (or similar field indicating the NetSuite ID; may be NULL or empty if missing)

Solution:-
select p.product_id,
       pt.product_type_id,
       p.internal_name,
       gi.id_value AS NetSuite_Id
FROM PRODUCT p
JOIN PRODUCT_TYPE pt on p.product_type_id = pt.product_type_id
JOIN GOOD_IDENTIFICATION gi on p.product_id = gi.product_id 
where good_identification_type_id = 'ERP_ID' AND gi.id_value IS NULL;
