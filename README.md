# Customer-Shopping-Behavior-Analysis

Analysis
📌 Project Overview

This project analyzes customer shopping behavior using transactional data of 3,900 purchases across multiple product categories.
The objective is to uncover insights into spending patterns, customer segmentation, product performance, and subscription trends to support data-driven business decisions.

📊 Dataset Summary
Rows: 3,900
Columns: 18
Key Features:
Demographics: Age, Gender, Location, Subscription Status
Transactions: Item Purchased, Category, Purchase Amount
Behavior: Discount Applied, Previous Purchases, Review Rating, Shipping Type
Missing Values: 37 (Review Rating column)
🧹 Data Cleaning & Preparation (Python)
Loaded dataset using Pandas
Performed initial exploration using .info() and .describe()
Handled missing values using median imputation by category
Standardized column names to snake_case
Feature engineering:
Created age_group column
Created purchase_frequency_days
Removed redundant column (promo_code_used)
Exported cleaned data to SQL Server for further analysis
🛢️ SQL Analysis (Business Insights)

Performed analysis to answer key business questions:

💰 Revenue analysis by gender
🎯 High-spending customers using discounts
⭐ Top-rated products
🚚 Shipping type vs purchase behavior
📦 Subscribers vs non-subscribers comparison
🏷️ Discount dependency of products
👥 Customer segmentation (New / Returning / Loyal)
🛒 Top products per category
🔁 Repeat buyers vs subscription trend
📈 Revenue contribution by age group
📊 Power BI Dashboard

Built an interactive dashboard to visualize insights:

🔹 Key Features:
KPI cards (Revenue, Avg Spend, Customers)
Category & product performance visuals
Customer segmentation insights
Filters for dynamic analysis (Gender, Category, Shipping Type)
🎨 UI/UX Improvements (Your Contribution)
Optimized slicer (filter) design by removing extra spacing
Reduced row padding for compact layout
Improved text fitting inside filters
Removed unnecessary visual clutter (headers, padding)
Enhanced overall dashboard readability and alignment
💡 Business Recommendations
📈 Promote subscriptions with exclusive benefits
🎁 Introduce loyalty programs for repeat customers
⚖️ Optimize discount strategies to protect margins
🛍️ Highlight top-performing and highly rated products
🎯 Focus marketing on high-value customer segments
🛠️ Tech Stack
Python (Pandas, Data Cleaning)
SQL Server (SQL Analysis)
Power BI (Dashboard & Visualization)

<img width="1042" height="570" alt="image" src="https://github.com/user-attachments/assets/8910dfcd-3a94-4865-b3d6-32c9b56f65f5" />

