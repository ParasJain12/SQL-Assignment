1. -- New Customers Acquired in June 2023
-- Business Problem:
-- The marketing team ran a campaign in June 2023 and wants to see how many new customers signed up during that period.

-- Fields to Retrieve:

-- PARTY_ID
-- FIRST_NAME
-- LAST_NAME
-- EMAIL
-- PHONE
-- ENTRY_DATE

Solution:-
select p.party_id, p.first_name, p.last_name,
       pr.role_type_id AS role_type,
       cm.info_string AS EmailAddress,
       t.contact_number AS Phone,
       p.created_stamp
FROM PERSON p
JOIN PARTY_ROLE pr ON p.party_id = pr.party_id
LEFT JOIN PARTY_CONTACT_MECH pcm ON p.party_id = pcm.party_id
LEFT JOIN CONTACT_MECH cm ON pcm.contact_mech_id = cm.contact_mech_id
LEFT JOIN TELECOM_NUMBER t ON pcm.contact_mech_id = t.contact_mech_id
where pr.role_type_id = 'CUSTOMER' 
AND p.created_stamp BETWEEN '2023-06-01' AND '2023-06-30';
