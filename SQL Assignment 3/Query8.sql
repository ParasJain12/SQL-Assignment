-- 8. List of Warehouse Pickers
-- Business Problem:
-- Warehouse managers need a list of employees responsible for picking and packing orders to manage shifts, productivity, and training needs.

-- Fields to Retrieve:

-- PARTY_ID (or Employee ID)
-- NAME (First/Last)
-- ROLE_TYPE_ID (e.g., “WAREHOUSE_PICKER”)
-- FACILITY_ID (assigned warehouse)
-- STATUS (active or inactive employee)

Solution:-
select p.facility_id,
       pr.party_id,
       pr.role_type_id,
       pe.first_name || ' '  || pe.last_name as Full_Name,
       pty.status_id
from picklist p
JOIN picklist_role pr on pr.picklist_id = p.picklist_id
JOIN person pe on pe.party_id = pr.party_id
JOIN party pty on pty.party_id = pr.party_id;
