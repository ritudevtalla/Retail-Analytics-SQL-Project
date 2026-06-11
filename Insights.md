# Business Insights & Recommendations

## Executive Summary

This project analyzed retail sales transactions, customer purchasing behavior, product performance, and customer segmentation using SQL.

The analysis uncovered high-performing products, top revenue-generating categories, customer loyalty patterns, and overall sales growth trends.

---

# Data Quality Analysis

## Duplicate Records

The duplicate check identified duplicate transaction records:

| Transaction ID | Duplicate Count |
| -------------- | --------------- |
| 4999           | 2               |
| 5000           | 2               |

### Insight

Duplicate transactions were identified and removed to improve reporting accuracy and prevent revenue inflation.

---

# Product Performance Analysis

## Top Revenue Generating Products

| Product ID | Revenue |
| ---------- | ------- |
| 17         | 9450    |
| 87         | 7817    |
| 179        | 7388    |
| 96         | 7132    |
| 54         | 7053    |

### Insight

* Product 17 generated the highest revenue (9450).
* Products 87 and 179 were also strong contributors.
* These products should be prioritized for inventory planning and promotional campaigns.

### Recommendation

Maintain optimal stock levels for these products and use them in bundled marketing campaigns.

---

## Lowest Selling Products

| Product ID | Units Sold |
| ---------- | ---------- |
| 142        | 27         |
| 33         | 31         |
| 174        | 33         |
| 159        | 35         |
| 60         | 35         |

### Insight

These products exhibited the lowest sales volume and may require promotional support or inventory review.

### Recommendation

Evaluate pricing, visibility, and demand forecasting for these products.

---

# Category Performance Analysis

| Category        | Units Sold | Revenue |
| --------------- | ---------- | ------- |
| Home & Kitchen  | 3477       | 217756  |
| Electronics     | 3037       | 177548  |
| Clothing        | 2810       | 162874  |
| Beauty & Health | 3001       | 143825  |

## Insight

* Home & Kitchen generated the highest revenue (217,756).
* Electronics ranked second with revenue of 177,548.
* Beauty & Health generated the lowest revenue among major categories.

### Recommendation

Increase marketing investment in Home & Kitchen and Electronics while evaluating growth opportunities within Beauty & Health.

---

# Sales Trend Analysis

## Daily Sales Trend

Analysis of transaction dates showed consistent daily transaction activity ranging between 24 transactions per day with sales values exceeding 3,000 on most days.

### Insight

The business demonstrates stable sales activity with consistent customer purchasing behavior.

---

# Month-on-Month Growth Analysis

| Month    | Total Sales | Growth % |
| -------- | ----------- | -------- |
| January  | 104289      | -        |
| February | 96691       | -7.29%   |
| March    | 103271      | +6.81%   |
| April    | 101561      | -1.66%   |
| May      | 102999      | +1.42%   |
| June     | 102210      | -0.77%   |
| July     | 90982       | -10.99%  |

## Insight

* March recorded the strongest positive growth (+6.81%).
* July experienced the largest decline (-10.99%).
* Sales remained relatively stable throughout most of the year.

### Recommendation

Investigate the reasons behind July's decline and identify successful strategies implemented during March.

---

# Customer Purchase Frequency Analysis

## High-Frequency Customers

Top customers completed between 11 and 14 transactions.

| Customer ID | Transactions |
| ----------- | ------------ |
| 664         | 14           |
| 936         | 12           |
| 670         | 12           |
| 958         | 12           |

### Insight

A small group of customers demonstrates exceptionally high engagement and contributes significantly to company revenue.

### Recommendation

Implement loyalty rewards and retention campaigns targeting these customers.

---

## Low-Frequency Customers

Several customers completed only a single transaction.

| Customer ID | Transactions |
| ----------- | ------------ |
| 94          | 1            |
| 181         | 1            |
| 979         | 1            |
| 317         | 1            |

### Insight

These customers are at risk of churn and may require personalized engagement strategies.

### Recommendation

Launch reactivation campaigns, discounts, and personalized recommendations.

---

# Repeat Purchase Analysis

Customers repeatedly purchased specific products.

Example:

| Customer ID | Product ID | Times Purchased |
| ----------- | ---------- | --------------- |
| 685         | 192        | 3               |
| 758         | 31         | 2               |
| 75          | 47         | 2               |

### Insight

Certain products encourage repeat purchases and indicate strong customer preference.

### Recommendation

Identify similar products and create cross-selling opportunities.

---

# Customer Loyalty Analysis

Longest customer relationships observed:

| Customer ID | Days Between First and Last Purchase |
| ----------- | ------------------------------------ |
| 215         | 208                                  |
| 414         | 205                                  |
| 664         | 204                                  |

### Insight

Several customers remained active for more than 200 days, demonstrating strong loyalty.

### Recommendation

Develop VIP and loyalty programs for long-term customers.

---

# Customer Segmentation

| Segment | Customers |
| ------- | --------- |
| Medium  | 559       |
| Low     | 423       |
| High    | 7         |

## Insight

* Medium segment represents the largest customer group (559 customers).
* High-value customers are extremely limited (7 customers).
* Low segment still represents a significant portion of the customer base.

### Recommendation

Focus marketing efforts on converting Medium customers into High-value customers while increasing engagement among Low-value customers.

---

# Final Business Recommendations

1. Prioritize inventory for Product 17 and other top-performing products.
2. Increase promotional spending on Home & Kitchen and Electronics categories.
3. Investigate the sales decline observed in July.
4. Reward high-frequency customers through loyalty programs.
5. Re-engage low-frequency customers using personalized campaigns.
6. Focus customer development efforts on the Medium customer segment.
7. Monitor repeat-purchase products for bundling and upselling opportunities.

## Conclusion

The analysis revealed strong performance in the Home & Kitchen category, identified key revenue-generating products, highlighted valuable customer segments, and provided actionable insights for improving customer retention and business growth.
