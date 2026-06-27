# 📊 Retail Sales Intelligence Dashboard

An end-to-end Business Intelligence project that transforms raw retail sales data into actionable business insights using **Python, PostgreSQL, SQL, and Power BI**.

---

## 🚀 Project Overview

This project demonstrates a complete data analytics workflow:

Raw CSV → Data Cleaning → Feature Engineering → PostgreSQL → SQL Business Analysis → Power BI Dashboard

The objective is to help decision-makers monitor sales performance, customer behavior, regional trends, profitability, and product performance through an interactive dashboard.

---

## 🛠 Tech Stack

- Python
- Pandas
- PostgreSQL
- SQL
- SQLAlchemy
- Power BI
- DAX

---

## 📂 Dataset

Sample Superstore Dataset

- 9,994 Transactions
- 28 Features after preprocessing
- Multiple customer, product, region, and sales attributes

---

## 📈 Project Workflow

### 1. Data Cleaning (Python)

- Loaded raw CSV using Pandas
- Checked missing values and data types
- Created Year, Month, Quarter, and Month Name features
- Calculated Shipping Days
- Calculated Profit Margin
- Created Discount Bucket
- Exported cleaned dataset

---

### 2. PostgreSQL

- Imported cleaned dataset
- Created analytical SQL queries
- Built reusable SQL Views
- Generated business KPIs

---

### 3. SQL Analysis

More than **30 business queries** were written using:

- GROUP BY
- HAVING
- CASE
- Aggregate Functions
- CTEs
- SQL Views

Business questions included:

- Revenue Analysis
- Profit Analysis
- Customer Analysis
- Product Analysis
- Category Analysis
- Regional Analysis
- Monthly Sales Trends

---

### 4. Power BI Dashboard

Interactive dashboard including:

- Total Revenue
- Total Profit
- Total Orders
- Average Order Value
- Profit Margin
- Monthly Sales Trend
- Category Profit
- Region Analysis
- Customer Analysis
- Product Performance

Interactive slicers:

- Region
- Category
- Segment

---

## 📊 Dashboard Preview

(Add dashboard screenshot here)

---

## 📌 Key Insights

- Revenue exceeded **$2.30M**
- Total Profit reached **$286K**
- Technology generated the highest profit
- 8,123 profitable transactions
- 1,871 loss-making transactions
- Customer and product level analysis identified high-value business opportunities

---

## 📁 Repository Structure

```
Retail_Sales_Intelligence/
│
├── sample/
├── Sample_Superstore.csv
├── superstore_cleaned.csv
├── superstore_sql.sql
├── Retail_Sales_Intelligence.pbix
└── README.md
```

---

## 👨‍💻 Author

**Ayushman Dubey**

B.Tech, NIT Raipur
