install.packages("sqldf")
library(sqldf)
setwd ('C:/Users/P7576/Downloads')
Sales_Record <-read.csv("WA_Sales_Products_2012-14.csv")
dim(Sales_Record) #to view dimensions
head(Sales_Record) #to check the top 6 rows
tail(Sales_Record) #to check the last 6 rows
levels(Sales_Record$Product.line) #to check what r the levels in a coloum
Sales_only_Outdoor_Personal <- sqldf('select * from Sales_Record where "Product.line" in ("Outdoor Protection","Personal Accessories")')
head(Sales_only_Outdoor_Personal)
tail(Sales_only_Outdoor_Personal)
dim(Sales_only_Outdoor_Personal)

##Sqldf AND
Sales_only_Outdoor_Personal_AND_Country_US <- sqldf('select * from Sales_Record where "Product.line" in ("Outdoor Protection", "Personal Accessories") AND 
                                                    "Retailer.country" = "United States"')  
dim(Sales_only_Outdoor_Personal_AND_Country_US)
head(Sales_only_Outdoor_Personal_AND_Country_US)
tail(Sales_only_Outdoor_Personal_AND_Country_US)

##Sqldf OR
Sales_only_Outdoor_Personal_OR_Country_US<- sqldf('select * from Sales_Record where "Product.line" in ("Outdoor Protection", "Personal Accessories") OR 
                                                  "Retailer.country" = "United States"')
dim(Sales_only_Outdoor_Personal_OR_Country_US)
head(Sales_only_Outdoor_Personal_OR_Country_US)
tail(Sales_only_Outdoor_Personal_OR_Country_US)

##Average 
AVG_Revenue_by_country <- sqldf('select "Retailer.country", AVG(Revenue) AS AVG_Revenue FROM "Sales_Record" GROUP BY "Retailer.country"')
dim(AVG_Revenue_by_country)
head(AVG_Revenue_by_country)
head(Sales_Record)
AVG_Sales_Revenue <-sqldf("select AVG(Revenue) from Sales_Record")