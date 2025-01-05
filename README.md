# 1. Project Title

**Goodcabs Tier-2 City Analytics**  
Using SQL to analyze trip data, new vs. repeat passenger trends, and performance against monthly targets across ten tier-2 cities.

---

## 2. Project Description / Motivation

**Business Context:**  
• Goodcabs, a cab service specializing in tier-2 cities, aims to evaluate performance across city-level trip volume, new passenger growth, and repeat passenger loyalty.  
• Management also wants to monitor monthly targets (trips, new passengers, average ratings) to guide strategic decisions and operational improvements.

**Importance:**  
• By identifying top-performing cities, high repeat usage, and areas struggling to meet targets, Goodcabs can allocate resources, tailor marketing efforts, and refine driver/passenger engagement strategies.

**Key Goals:**  
• Assess city-level trip metrics: total trips, fare structure, and contribution to overall volume.  
• Compare actual vs. targeted performance: highlight cities/months “Above” or “Below” target.  
• Analyze repeat passenger trip frequency: gauge loyalty patterns for 2 to 10 trips.  
• Identify top/bottom cities by new passenger count for market expansion or retention strategies.  
• Pin down revenue peaks per city/month for strategic promotions or pricing.

---

## 3. Key Features and Highlights

• Comprehensive analysis on **new vs. repeat** passenger trends.  
• Month-to-month **target vs. actual** trip comparisons.  
• Detailed breakdown of **repeat passenger** trip frequencies (2–10 trips).  
• Insights on **revenue peaks** per city and month.

---

## 4. Data and Schema Overview

### Databases and Tables

- **trips_db** – Contains both detailed and aggregated trip/passenger data.  
  - **dim_city:** City reference (e.g., city_id, city_name)  
  - **dim_date:** Date reference table (e.g., date, start_of_month, month_name)  
  - **fact_trips (detailed):** Trip ID, date, distance, fare, and ratings  
  - **fact_passenger_summary (aggregated):** Monthly total/new/repeat passenger counts  
  - **dim_repeat_trip_distribution (aggregated):** Distribution of how many repeat passengers took 2, 3, … up to 10 trips in a month  

- **targets_db** – Holds Goodcabs’ monthly performance targets  
  - **city_target_passenger_rating:** Target average rating per city  
  - **monthly_target_new_passengers:** Monthly target for new passenger acquisition  
  - **monthly_target_trips:** Monthly target for total trips  

### ER Diagram or Relationships (High-Level)

- **fact_trips** joins with **dim_city** on `city_id` and with **dim_date** on `date`.  
- **fact_passenger_summary** and **dim_repeat_trip_distribution** join with **dim_city** on `city_id` and use `month` for time-based grouping.  
- **targets_db** tables relate to the same `city_id` and `month` fields for target comparisons.
- 
![image](https://github.com/user-attachments/assets/88c99e96-7b54-42e3-9295-c758611cd819)

---

## 5. Methodology

1. **Data Import & Setup**  
   • Imported the `trips_db` and `targets_db` schemas into MySQL Workbench.  
   • Validated column data types and established foreign keys for consistency.

2. **Reference Documents**  
   • Consulted the *problem statement* to align analyses with Goodcabs’ KPIs (e.g., new vs. repeat passenger growth).  
   • Followed *ad-hoc requests* to produce query-based reports.  
   • Used *meta_data.txt* for clarity on table structures and fields.

3. **SQL Query Development**  
   • Consolidated all *ad-hoc request queries* in **Consolidate-File.txt**.  
   • Employed aggregate functions and joins to compare actual vs. target results, calculate distribution percentages, and rank city performance.  
   • Incorporated window functions (e.g., `RANK()`, `DENSE_RANK()`) for advanced grouping (top/bottom queries, best revenue months).

4. **Analysis & Insights Extraction**  
   • Verified query outputs, ensuring accurate monthly passenger rates and city-level trip counts.  
   • Presented final metrics (e.g., highest revenue month, city with best repeat passenger rate) as actionable insights.  
   • Noted that some cities lag behind targets, prompting deeper marketing or operational strategies.

5. **Reporting & Visualization**  
   • Created a BI or presentation layer (Power BI/Tableau/Excel) to visualize:  
     ➡ Trip volumes per city/month  
     ➡ “Above Target” vs. “Below Target” color-coded statuses  
     ➡ Repeat passenger frequency charts  
     ➡ Revenue distribution  
   • These visuals form the basis of the final stakeholder presentation.
---
## 6. Results

Below are six key result areas corresponding to each business request.  

1. **City-Level Fare and Trip Summary**  
   - *![image](https://github.com/user-attachments/assets/4816311e-6a7f-4146-a9c0-16a7c1277a3a)*

2. **Monthly City-Level Trips Target Performance**  
   - *![image](https://github.com/user-attachments/assets/efce573a-41b5-488a-a70f-1d1495ce253f)*

3. **City-Level Repeat Passenger Trip Frequency**  
   - *![image](https://github.com/user-attachments/assets/b7d1ff3f-ab49-4e1d-9d7b-cf7a764d08eb)*

4. **Identifying Highest and Lowest Total New Passengers**  
   - *![image](https://github.com/user-attachments/assets/16c3976f-89cc-4ef2-9781-64b561a15f98)*

5. **Month with Highest Revenue (Per City)**  
   - *![image](https://github.com/user-attachments/assets/29ba5b7c-2b88-423a-a4ff-d8097c054b7b)*

6. **Repeat Passenger Rate Analysis**  
   - *![image](https://github.com/user-attachments/assets/b6feb475-df3a-40dd-8b77-b372ba9a9c76)*

---

