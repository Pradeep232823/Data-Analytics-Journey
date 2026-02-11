# 🛒 Supermart Grocery Sales – SQL Analytics Project

## 📌 Business Problem

A retail grocery chain wants to understand its revenue drivers, profitability trends, customer performance, and the impact of discounts on margins.

The objective of this project is to use SQL to extract actionable business insights from transactional sales data and support data-driven decision-making.

---

## 📊 Dataset Description

**Dataset Name:** Supermart Grocery Sales – Retail Analytics Dataset  
**Data Type:** Transaction-level sales data  

### Columns:

- Order ID  
- Customer Name  
- Category  
- Sub Category  
- City  
- Order Date  
- Region  
- Sales  
- Discount  
- Profit  
- State  

Each row represents a single completed order transaction.

---

## 🛠 Tools Used

- MySQL  
- Advanced SQL  
- Window Functions  
- Subqueries  
- Aggregations & Grouping  
- Statistical Correlation  

---

## 🧠 Analysis Approach

1. Calculated revenue after applying discount.
2. Aggregated revenue and profit by category and region.
3. Identified top customers by revenue and profitability.
4. Performed monthly and yearly time-series analysis.
5. Computed Year-over-Year growth using window functions.
6. Calculated running revenue totals within each year.
7. Measured correlation between discount and profit.
8. Evaluated profitability impact of high discounting.

---

## 📈 Key Business Questions Answered

### 1️⃣ What is total revenue and total profit?

Revenue calculated after discount:

```sql
SELECT SUM(sales * (1 - discount)) AS total_revenue
FROM supermart_grocery_sales;
```

---

### 2️⃣ Which categories drive the highest revenue and profit?

- Aggregated sales and profit by category.
- Computed profit margin percentage.

---

### 3️⃣ Which regions contribute the most revenue?

Revenue grouped by region to identify high-performing markets.

---

### 4️⃣ Who are the top customers?

- Top 10 customers by revenue.
- Top 10 customers by profit.
- Customers with high sales but low profit.

---

### 5️⃣ How is revenue growing year-over-year?

Used window function:

```sql
LAG(yearly_revenue) OVER (ORDER BY year)
```

Computed Year-over-Year growth percentage.

---

### 6️⃣ What are the highest revenue months?

Identified top 10 revenue-generating months across all years.

---

### 7️⃣ What is the running revenue trend within each year?

Used window function with partitioning:

```sql
SUM(...) OVER (PARTITION BY year ORDER BY month)
```

Tracked cumulative revenue progression within each year.

---

### 8️⃣ Is there a relationship between discount and profit?

Calculated statistical correlation:

```sql
(avg(discount * profit) - avg(discount) * avg(profit))
/ (stddev_pop(discount) * stddev_pop(profit))
```

Measured how discount levels influence profitability.

---

### 9️⃣ How do high discounts impact revenue?

Calculated revenue generated under discount levels greater than 25% to assess dependency on heavy discounting.

---

## 🔍 Key Insights

- Revenue is concentrated in a few high-performing categories.
- Certain customers generate high sales but low profitability due to discount levels.
- Year-over-year revenue shows growth trends.
- High discount categories show reduced profit margins.
- There is a measurable correlation between discount levels and profitability.
- Seasonal revenue spikes are observed in specific months.

---

## 💡 Business Recommendations

1. Optimize discount strategies in low-margin categories.
2. Focus marketing efforts on high-profit product categories.
3. Monitor customers generating high revenue but low margins.
4. Strengthen presence in high-performing regions.
5. Align promotions with historically high-performing months.

---

## 🚀 Skills Demonstrated

- Revenue and profit analysis  
- Advanced GROUP BY aggregations  
- Window functions (LAG, Running Totals)  
- Subqueries  
- Time-series growth analysis  
- Correlation computation  
- Business-driven SQL problem solving  

---

## 📁 Project Structure

```
sql-analytics-project/
├── data/
│   └── Supermart Grocery Sales - Retail Analytics Dataset.csv
├── sql/
│   └── analysis.sql
└── README.md
```

---

## 📌 Project Outcome

This project demonstrates the ability to:

- Translate business problems into SQL logic  
- Perform advanced analytical queries  
- Use window functions for time-based analysis  
- Evaluate financial impact of discount strategies  
- Deliver structured, insight-driven business recommendations  