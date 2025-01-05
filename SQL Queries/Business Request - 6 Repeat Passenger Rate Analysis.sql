/*
Business Request - 6: Repeat Passenger Rate Analysis

Generate a report that calculates two metrics:

1. Monthly Repeat Passenger Rate: Calculate the repeat passenger rate for each city
and month by comparing the number of repeat passengers to the total passengers.
2. City-wide Repeat Passenger Rate: Calculate the overall repeat passenger rate for
each city, considering all passengers across months,

These metrics will provide insights into monthly repeat trends as well as the overall repeat
behaviour for each city.

Fields:
· city_name
. month
· total passengers
· repeat_passengers
. monthly_repeat_passenger_rate (%): Repeat passenger rate at the city and
month level
. city_repeat_passenger_rate (%): Overall repeat passenger rate for each city,
aggregated across months
*/

WITH MonthlyRates AS (
    SELECT 
        city_name,
        MonthNAME(month) as month,
        total_passengers,
        repeat_passengers,
        ROUND((repeat_passengers / total_passengers * 100), 2) AS monthly_repeat_rate
    FROM trips_db.fact_passenger_summary
    join dim_city
    using (city_id)
),
CityRates AS (
    SELECT 
        city_name,
        ROUND((SUM(repeat_passengers) / SUM(total_passengers) * 100), 2) AS city_repeat_rate
     FROM trips_db.fact_passenger_summary
    join dim_city
    using (city_id)
    GROUP BY city_name
)
SELECT 
    m.*,
    c.city_repeat_rate
FROM 
    MonthlyRates m
JOIN 
    CityRates c ON m.city_name = c.city_name
ORDER BY m.city_name
  
