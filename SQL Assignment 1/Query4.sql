-- 4. Product IDs Across Systems
-- Business Problem:
-- To sync an order or product across multiple systems (e.g., Shopify, HotWax, ERP/NetSuite), the OMS needs to know each system’s unique identifier for that product. This query retrieves the Shopify ID, HotWax -- ID, and ERP ID (NetSuite ID) for all products.

-- Fields to Retrieve:

-- PRODUCT_ID (internal OMS ID)
-- SHOPIFY_ID
-- HOTWAX_ID
-- ERP_ID or NETSUITE_ID (depending on naming)

Solution:- 
SELECT 
    p.PRODUCT_ID as Hotwax_ID,
    gi_erp.ID_VALUE AS ERP_ID,
    gi_prod.ID_VALUE AS SHOPIFY_PROD_ID
FROM product p
JOIN good_identification gi_erp 
    ON gi_erp.PRODUCT_ID = p.PRODUCT_ID 
    AND gi_erp.GOOD_IDENTIFICATION_TYPE_ID = 'ERP_ID'
JOIN good_identification gi_prod 
    ON gi_prod.PRODUCT_ID = p.PRODUCT_ID 
    AND gi_prod.GOOD_IDENTIFICATION_TYPE_ID = 'SHOPIFY_PROD_ID';


