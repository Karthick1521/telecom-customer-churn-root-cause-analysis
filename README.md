📊 Telecom Customer Churn Root Cause Analysis

SQL + Power BI | End-to-End Data Analyst Project

🔎 1. Business Problem

A telecom company experiencing a 26.54% customer churn rate aims to:

Identify key drivers of churn

Detect high-risk customer segments

Quantify revenue exposure

Provide actionable retention strategies

The goal is to reduce recurring revenue loss by targeting the most vulnerable customer groups.

📁 2. Dataset Overview

Total Customers: 7,043

Attributes: 21

Target Variable: Churn (Yes/No)

Data includes:

Customer demographics

Service subscriptions

Contract details

Payment methods

Billing amounts

🛠 3. Tools & Technologies

MySQL

Data cleaning

Feature engineering

Segmentation analysis

High-risk profiling

Advanced SQL

Aggregations

Subqueries

Segmentation logic

Power BI

Executive dashboard design

KPI tracking

Business storytelling

DAX

Churn rate modeling

High-risk flag creation

Revenue exposure estimation

🔄 4. Project Workflow
Phase 1 – Data Preparation (SQL)

Imported raw telecom dataset

Handled missing TotalCharges

Converted churn flag to binary

Validated tenure and billing ranges

Phase 2 – Core Churn Analysis

Overall Churn Rate: 26.54%

Key segment analysis revealed:

Driver	Insight
Contract Type	42.7% churn among month-to-month customers
Tenure	47.4% churn within first year
Payment Method	45.3% churn for electronic check users
Pricing	Churned customers pay 21% higher monthly charges
Phase 3 – High-Risk Segment Identification

High-risk defined as:

Month-to-month contract

Tenure ≤ 12 months

Monthly charges above average

Payment method = Electronic check

Results:

659 customers (9% of total base)

69.5% churn rate

2.6x higher than baseline

Contributes ~25% of total churn

Phase 4 – Revenue Risk Estimation

High-risk segment monthly revenue exposure: 53.91K

Estimated revenue at risk (based on churn rate): ~37K monthly

This highlights significant financial impact concentration in a small customer segment.

📊 5. Power BI Dashboard Overview
Page 1 – Churn Drivers

KPI Strip (Total Customers, Churn %, Avg Charges)

Contract Risk Analysis

Lifecycle Risk Analysis

Billing Behavior Impact

Pricing Sensitivity Analysis

Page 2 – High-Risk Segmentation

High-Risk KPI Summary

Churn Multiplier Visualization

High-Risk vs Other Customers Comparison

Revenue Exposure Estimate

🎯 6. Key Business Insights

89% of churn originates from month-to-month contracts

55% of churn occurs within the first year

Electronic check users show significantly higher churn risk

9% of customers account for 25% of churn impact

Targeting this segment could significantly reduce revenue loss

🚀 7. Strategic Recommendations

Contract Conversion Incentives

Promote annual plans for month-to-month users

Early Lifecycle Engagement

90-day onboarding and retention program

Auto-Payment Migration Strategy

Encourage electronic check users to switch to auto-pay

Pricing Optimization

Bundle services for high-charge customers

📂 8. Repository Structure
telecom-customer-churn-root-cause-analysis/
│
├── data/
├── sql/
│   ├── 01_table_creation.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_core_analysis.sql
│   └── 04_high_risk_segmentation.sql
│
├── dashboard/
│   └── telecom_churn_analysis.pbix
│
├── screenshots/
│
├── churn_dashboard_summary.pdf
│
└── README.md

📌 9. What This Project Demonstrates

End-to-end data analysis workflow

Strong SQL-based business segmentation

Ability to translate data into strategic recommendations

Dashboard storytelling for executive decision-making

Revenue risk quantification

💼 10. Author

Karthick Ravi
Data Analyst | SQL | Power BI | Business Analytics
