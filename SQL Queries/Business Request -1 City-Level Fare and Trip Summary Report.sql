/*Business Request - 1: City-Level Fare and Trip Summary Report

Generate a report that displays the total trips, average fare per km, average fare per trip, and
the percentage contribution of each city's trips to the overall trips, This report will help in
assessing trip volume, pricing efficiency, and each city's contribution to the overall trip count.

Fields:

. city_name
· total_trips
· avg_fare_per_km
· avg_fare_per_trip
· %_contribution_to_total_trips */

SELECT 
city_name,
count(trip_id) as total_trips,
ROUND(sum(fare_amount)/sum(distance_travelled_km),2) as avg_fare_per_km,
ROUND(sum(fare_amount)/count(trip_id),2) as avg_fare_per_trip,
ROUND(count(city_id)*100/(SELECT COUNT(*) FROM trips_db.fact_trips) ,2)  as pct_contribution_to_total_trips

FROM trips_db.fact_trips

join dim_city
using (city_id)
group by city_name;