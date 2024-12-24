-- Question: https://leetcode.com/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=top-sql-50

SELECT ROUND(AVG(
    CASE
       WHEN order_date=customer_pref_delivery_date THEN 1
       ELSE 0
    END
)*100,2) AS immediate_percentage
FROM (
    SELECT d1.customer_id,d1.order_date,d1.customer_pref_delivery_date 
    FROM Delivery d1
    JOIN (
        SELECT customer_id,MIN(order_date) AS first_order_date
        FROM Delivery
        GROUP BY customer_id
        ) d2
    ON d1.customer_id=d2.customer_id AND d1.order_date=d2.first_order_date
)  AS sortedTable;

-- SELECT customer_id,MIN(order_date),customer_pref_delivery_date FROM Delivery GROUP BY customer_id;
--  ORDER BY customer_id,order_date;
