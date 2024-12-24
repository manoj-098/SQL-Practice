-- Question: https://leetcode.com/problems/monthly-transactions-i/?envType=study-plan-v2&envId=top-sql-50

--My Sol[1]
SELECT DISTINCT DATE_FORMAT(trans_date, '%Y-%m') AS month,country,
COUNT(*) AS trans_count,
SUM(state='approved') AS approved_count ,
SUM(amount) AS trans_total_amount,
SUM(
    CASE state
        WHEN 'approved' THEN amount
        ELSE 0
    END
) AS approved_total_amount 
FROM Transactions
GROUP BY country,DATE_FORMAT(trans_date, '%Y-%m');
