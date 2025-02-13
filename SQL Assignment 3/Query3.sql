-- 3.Single-Return Orders (Last Month)
-- Business Problem:
-- The mechandising team needs a list of orders that only have one return.

-- Fields to Retrieve:

-- PARTY_ID
-- FIRST_NAME

Solution:-
select rh.from_party_id as Party_Id,
       pe.first_name
from Return_Header rh 
JOIN return_item ri on ri.return_id = rh.return_id
JOIN party p on p.party_id = rh.from_party_id
JOIN Person pe on pe.party_id = rh.from_party_id
group by rh.from_party_id,pe.first_name
having count(rh.return_id) = 1;
