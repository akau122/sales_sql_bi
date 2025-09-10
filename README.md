# Sales Data Analysis (SQL + Power BI)

##  Project Overview
This project demonstrates an end-to-end **sales data analysis** pipeline using **PostgreSQL** for data cleaning & transformation and **Power BI** for dashboarding & visualization.  

The dataset contains sales transactions from **six countries**: Canada, India, China, Nigeria, UK, and US.  
The goal was to consolidate, clean, and analyze the data to uncover **business insights** such as revenue trends, profit margins, top products, and sales performance by region.  

---

##  Tech Stack
- **PostgreSQL** → Data integration, cleaning, KPI calculations  
- **Power BI** → Interactive dashboard & reporting  
- **Excel/CSV** → Raw data source  

---

##  Steps Performed

### 1. Data Integration
- Combined six country-specific sales tables using `UNION ALL` into a single `sales_data` table.  

### 2. Data Cleaning & Transformation
- Handled missing values (`Price Per Unit`, `Quantity Purchased`).  
- Detected duplicate `Transaction IDs`.  
- Created calculated fields:
  - `Total Amount = (Price Per Unit × Quantity) – Discount`
  - `Profit = Total Amount – (Cost Price × Quantity)`

### 3. SQL Business Queries
- **Revenue & Profit by Country**  
- **Top 5 Products** (units sold)  
- **Best Sales Representatives**  
- **Top Store Locations** by sales & profit  
- **Key Metrics** (Min, Max, Avg Sales & Profit)  

### 4. Power BI Dashboard
- KPIs:
  - **Total Sales**: 4.14M  
  - **Total Profit**: 959K  
  - **Total Orders**: 3K  
  - **Average Order Value**: 1.38K  
- Visual breakdowns:
  - Sales by Country  
  - Sales by Store Location  
  - Monthly & Daily Sales Trends  
  - Category-wise Sales (Home & Kitchen, Clothing, Electronics, etc.)  
  - Payment Method Preferences (Cash, Credit Card, Mobile Payment)  

---

##  Dashboard Preview
*(Insert screenshot here)*  

---

##  Key Insights
- **Canada & US** generated the highest revenue.  
- **Home & Kitchen, Clothing, Electronics** were top-performing categories.  
- **Mobile Payment** was the most preferred method.  
- **Saturday & Sunday** recorded peak sales.  
- Profit margins varied significantly by country, indicating scope for optimization.  

---

##  How to Use
1. Run `country_analysis.sql` in PostgreSQL to clean and prepare the dataset.  
2. Export the processed table into Power BI.  
3. Explore the dashboard with filters (Country, Store, Category, Payment Method, Date).  

---

##  Project Value
This project simulates a **real-world business scenario** and highlights how data analysts can:
- Clean & transform raw sales data  
- Create KPIs and business metrics using SQL  
- Build an interactive dashboard for decision-making  

---

## Future Improvements
- Add **sales forecasting** using time-series models.  
- Perform **customer segmentation** based on buying patterns.  
- Automate data refresh between SQL and Power BI.  
