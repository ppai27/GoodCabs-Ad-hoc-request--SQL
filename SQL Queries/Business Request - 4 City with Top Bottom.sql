/*
Business Request - 4: Identify Cities with Highest and Lowest Total New
Passengers

Generate a report that calculates the total new passengers for each city and ranks them
based on this value. Identify the top 3 cities with the highest number of new passengers as
well as the bottom 3 cities with the lowest number of new passengers, categorising them as
"Top 3" or "Bottom 3" accordingly.

Fields

city_name
. total_new_passengers
. city_category ("Top 3" or "Bottom 3")

*/


WITH new_passengers AS (
    SELECT 
        city_name,
        SUM(new_passengers) as total_new_passengers,
        RANK() OVER(ORDER BY SUM(new_passengers) DESC) as city_rank
    FROM trips_db.fact_passenger_summary
    JOIN dim_city USING(city_id)
    GROUP BY city_name
)
 
SELECT 
    city_name,
    total_new_passengers,
    CASE 
        WHEN city_rank <= 3 THEN 'Top 3'
        WHEN city_rank >= (SELECT COUNT(*) - 2 FROM new_passengers) THEN 'Bottom 3'
    END as city_category
FROM new_passengers
WHERE city_rank <= 3 
   OR city_rank >= (SELECT COUNT(*) - 2 FROM new_passengers);
 
 
 
 
 
 