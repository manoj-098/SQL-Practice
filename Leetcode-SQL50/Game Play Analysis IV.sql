-- Question: https://leetcode.com/problems/game-play-analysis-iv/?envType=study-plan-v2&envId=top-sql-50

SELECT ROUND(COUNT(A1.player_id)/(SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction
FROM (
    SELECT player_id, MIN(event_date) AS event_date
    FROM Activity
    GROUP BY player_id
) AS A1
JOIN Activity A2
ON A1.player_id=A2.player_id AND DATEDIFF(A2.event_date,A1.event_date)=1;
