# Telecom Customer Churn Root Cause Analysis

## End-to-End Data Analyst Project | SQL + Power BI

## 1. Business Problem

A telecom company experiencing a 26.54% customer churn rate needed to identify key churn drivers, detect high-risk customer segments, and quantify revenue exposure in order to reduce recurring revenue loss.

The objective was to perform structured data analysis and provide actionable retention strategies based on measurable insights.

## 2. Dataset Overview

Total Customers: 7,043

Attributes: 21

Target Variable: Churn (Yes/No)

The dataset includes:

Customer demographics

Service subscription details

Contract information

Payment methods

Monthly and total billing data

## 3. Tools & Technologies Used

MySQL – Data cleaning, transformation, and segmentation

Advanced SQL – Aggregations, subqueries, and multi-factor filtering

Power BI – Dashboard design and KPI visualization

DAX – Risk modeling, segmentation logic, and revenue exposure estimation

## 4. Project Workflow
### Phase 1 – Data Preparation (SQL)

Imported raw telecom dataset into MySQL

Cleaned missing TotalCharges values

Converted churn variable into binary flag

Validated tenure and billing ranges

Structured dataset for analytical modeling

### Phase 2 – Core Churn Analysis

Overall churn rate identified: 26.54%

Key findings:

42.7% churn among month-to-month contract customers

47.4% churn within first year of tenure

45.3% churn among electronic check users

Churned customers pay 21% higher monthly charges on average

### Phase 3 – High-Risk Segment Identification

High-risk customers defined as:

Month-to-month contract

Tenure ≤ 12 months

Monthly charges above overall average

Payment method = Electronic check

Results:

High-Risk Customers: 659 (9% of total base)

High-Risk Churn Rate: 69.5%

Risk Multiplier: 2.6x higher than baseline

Contributes approximately 25% of total churn

### Phase 4 – Revenue Exposure Estimation

Monthly revenue exposure within high-risk segment: 53.91K

Estimated monthly revenue at risk (based on churn probability): ~37K

This indicates churn concentration in a small but financially significant customer group.

## 5. Power BI Dashboard Overview
### Page 1 – Churn Drivers Analysis

KPI Summary (Customers, Churn %, Avg Charges)

Contract Type vs Churn Rate

Customer Lifecycle Risk

Billing Behavior Impact

Pricing Sensitivity Analysis

### Page 2 – High-Risk Segment Analysis

High-Risk KPI Summary

Churn Comparison: High-Risk vs Other Customers

Revenue Exposure Metrics

Segment Profile Table

## 6. Key Business Insights

Majority of churn originates from flexible contract customers

Early lifecycle customers show highest attrition risk

Billing behavior significantly impacts churn probability

9% of customers account for 25% of churn impact

Targeted intervention can meaningfully reduce revenue loss

## 7. Strategic Recommendations

Introduce contract conversion incentives

Implement early-stage retention engagement programs

Promote automatic payment methods

Optimize pricing bundles for high-charge customers

## 8. Repository Structure
telecom-customer-churn-root-cause-analysis/
│
├── data/
├── sql/
├── dashboard/
├── screenshots/
├── churn_dashboard_summary.pdf
└── README.md

## 9. Project Outcomes

This project demonstrates:

End-to-end analytical workflow

Strong SQL-based segmentation

Business-focused KPI modeling

Revenue risk quantification

Executive-level dashboard storytelling

## Author

Karthick Ravi
Data Analyst | SQL | Power BI | Business Analytics
