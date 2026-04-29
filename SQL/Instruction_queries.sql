-- AVG Rent Price Per city: 
SELECT City, Unit_type, Bedrooms,
       AVG(avg_asking_rent) AS overall_avg
FROM projects.rent_project.gold_rent_aggregated
GROUP BY City, Unit_type, Bedrooms
ORDER BY overall_avg DESC 

-- Year over Year Change in Price 
SELECT Year, Month, City, Unit_type, Bedrooms, YOY_pct_change 
FROM projects.rent_project.gold_rent_aggregated 
WHERE YOY_pct_change IS NOT NULL 
ORDER BY YOY_pct_change DESC;  


--Most expensive cities: 
SELECT City, ROUND(AVG(avg_asking_rent), 2) AS avg_rent 
FROM projects.rent_project.gold_rent_aggregated 
GROUP BY City 
ORDER BY avg_rent DESC; 


