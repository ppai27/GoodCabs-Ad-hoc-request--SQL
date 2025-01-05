/*
Business Request -5: Identify Month with Highest Revenue for Each City

Generate a report that identifies the month with the highest revenue for each city. For each
city, display the month_name, the revenue amount for that month, and the percentage
contribution of that month's revenue to the city's total revenue.

Fields

city_name
highest_revenue_month
. revenue
· percentage_contribution (%)

*/

WITH city_revenue AS (
    SELECT 
        city_name,
        
        Monthname(date) as month,
        
        ROUND(SUM(distance_travelled_km * fare_amount)/1000000, 2) as revenue_mln,
        
        DENSE_RANK() OVER (PARTITION BY city_name ORDER BY SUM(distance_travelled_km * fare_amount) DESC) as city_month_rank
		
        
    FROM trips_db.fact_trips
    JOIN dim_city USING(city_id)
    GROUP BY city_name, month
),
revenue_contribution AS (
    SELECT 
        city_name,
        month,
        revenue_mln,
        city_month_rank,
        revenue_mln * 100 / Sum(revenue_mln) Over (partition by city_name) as pct
    FROM city_revenue
)
SELECT 
    city_name,
    month,
    revenue_mln,
    ROUND(pct, 2) as percentage_contribution
FROM revenue_contribution
WHERE city_month_rank = 1;
