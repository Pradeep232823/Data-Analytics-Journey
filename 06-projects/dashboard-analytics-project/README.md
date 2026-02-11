# 🛒 Retail Sales & Profit Performance Dashboard  
### Executive Overview | 2023–2025

---

## 📌 Business Objective

The objective of this project is to analyze multi-store retail sales performance and provide an executive-level overview of:

- Revenue growth
- Profitability
- Regional performance
- Product contribution
- Customer segment trends
- Payment behavior impact

This dashboard is designed to help management make data-driven strategic decisions.

---

## 📊 Dataset Description

The dataset consists of retail transaction data across multiple stores and years (2023–2025).

### Tables Used

#### 1️⃣ Customers
- CustomerID  
- FirstName  
- LastName  
- Gender  
- BirthDate  
- City  
- JoinDate  

#### 2️⃣ Products
- ProductID  
- ProductName  
- Category  
- SubCategory  
- UnitPrice  
- CostPrice  

#### 3️⃣ Stores
- StoreID  
- StoreName  
- City  
- Region  

#### 4️⃣ Transactions (Fact Table)
- TransactionID  
- Date  
- CustomerID  
- ProductID  
- StoreID  
- Quantity  
- Discount  
- PaymentMethod  

---

## 🧩 Data Model

A **Star Schema** was implemented:

- **Fact Table:** Transactions  
- **Dimension Tables:** Customers, Products, Stores  

### Relationships

- Transactions → Customers (CustomerID)
- Transactions → Products (ProductID)
- Transactions → Stores (StoreID)

This structure ensures scalable, clean analytical reporting.

---

## 🛠 Tools Used

- Power BI
- Data Modeling
- DAX (Data Analysis Expressions)
- Interactive Slicers & Filters

---

## 📈 Key KPIs Created

- **Total Revenue**
- **Total Profit**
- **Profit Margin %**
- **Total Transactions**

### Core Business Logic

- **Revenue** = Quantity × UnitPrice × (1 − Discount)  
- **Cost** = Quantity × CostPrice  
- **Profit** = Revenue − Cost  
- **Profit Margin %** = Profit / Revenue  

---

## 📊 Dashboard Components

### KPI Cards
- Total Revenue: **14.30M**
- Total Profit: **3.83M**
- Profit Margin: **26.75%**
- Total Transactions: **5K**

### Visualizations Included

- Revenue by Product
- Revenue by Category
- Revenue by Region
- Revenue by Gender
- Monthly Revenue Trend
- Profit by Payment Method
- Profit Margin % by Gender

### Interactive Filters

- Year
- Region
- Store
- Category
- Gender
- Payment Method

---

## 📌 Key Insights

- Total revenue reached **14.30M** across 3 years.
- Profitability remained strong with a **26.75% margin**.
- East region contributed the highest revenue share.
- Electronics and Fashion categories drive the majority of revenue.
- Revenue peaks observed in **April and December**, indicating seasonal trends.
- Profit margins remain consistent across gender segments.
- Payment methods show relatively balanced profit contribution.

---

## 💡 Business Recommendations

- Increase marketing focus on high-performing categories (Electronics & Fashion).
- Expand operations in high-performing regions (East).
- Plan promotional campaigns during peak months (April & December).
- Optimize discount strategies to maintain strong profit margins.
- Analyze underperforming products for pricing or bundling opportunities.

---

## 🖼 Dashboard Preview

![Retail Sales Dashboard](../../assets/powerbi/retail_sales_dashboard.jpg)

*Figure: Executive dashboard highlighting revenue, profit, regional and product performance.*

---

## 🎯 Project Outcome

This project demonstrates:

- Strong data modeling skills
- Advanced KPI creation using DAX
- Business-focused analytical thinking
- Interactive dashboard design
- Executive-level data storytelling

This dashboard is designed for management review and strategic planning.