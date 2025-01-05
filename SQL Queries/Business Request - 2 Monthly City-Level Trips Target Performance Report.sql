/*Business Request - 2: Monthly City-Level Trips Target Performance Report

Generate a report that evaluates the target performance for trips at the monthly and city
level. For each city and month, compare the actual total trips with the target trips and
categorise the performance as follows:

-If actual trips are greater than target trips, mark it as "Above Target".
-If actual trips are less than or equal to target trips, mark it as "Below Target".
Additionally, calculate the % difference between actual and target trips to quantify the
performance gap.

City_name
month_name
actual_trips
target_trips
performance_status
%_difference*/

SELECT 
    c.city_name,
    d.month_name,
    COUNT(t.trip_id) as actual_trips,
    MAX(m.total_target_trips) as target_trips,
  
  CASE
  WHEN COUNT(t.trip_id)> MAX(m.total_target_trips) then "Above Target"
  Else "Below Target"
  END as performance_status,
  
 ROUND((( COUNT(t.trip_id)-MAX(m.total_target_trips))*100)/MAX((m.total_target_trips)),2) as performance_gap_pct

  
FROM trips_db.fact_trips t

JOIN dim_city c 
USING (city_id)

JOIN trips_db.dim_date d 
USING (date)

JOIN targets_db.monthly_target_trips m 
    ON m.city_id = t.city_id and month(t.date) = month(m.month)
    
GROUP BY c.city_name, d.month_name
ORDER BY c.city_name, d.month_name;

