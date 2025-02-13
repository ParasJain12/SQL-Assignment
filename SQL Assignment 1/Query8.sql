-- 8. Payment Captured but Not Shipped
-- Business Problem:
-- Finance teams want to ensure revenue is recognized properly. If payment is captured but no shipment has occurred, it warrants further review.

-- Fields to Retrieve:

-- ORDER_ID
-- ORDER_STATUS
-- PAYMENT_STATUS
-- SHIPMENT_STATUS

Solution:-
select oh.order_id, 
       oh.status_id AS Order_Status,
       opp.status_id AS Payment_Status,
       s.status_id AS Shipment_Status
from Order_Payment_Preference opp 
JOIN order_header oh on opp.order_id = oh.order_id
JOIN shipment s on s.primary_order_id = opp.order_id
where s.status_id != 'SHIPMENT_SHIPPED' AND opp.status_id = 'PAYMENT_SETTLED';
