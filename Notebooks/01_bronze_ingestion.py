from pyspark.sql.functions import current_timestamp, lit


file_path = "/Volumes/projects/rent_project/rent_raw_data/46100092.csv" 
rent_df = spark.read \
.option("header", "true") \
.option("inferSchema", "true") \
.csv("/Volumes/projects/rent_project/rent_raw_data/46100092.csv")    .withColumnRenamed("Rental unit type", "Rental_unit_type")


rent_df.printSchema() 
rent_df.show(10) 

rent_df.select("VALUE", "UOM", "Estimates", "Rental_unit_type", "GEO", "REF_DATE").show(20, truncate = False) 

rent_df.write.format("delta").mode("overwrite").saveAsTable("projects.rent_project.bronze_rent_raw") 

print(f"Total rown written: {rent_df.count()}")