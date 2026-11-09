# Bank Loan Portfolio Analysis — Key Insights

## Project Overview

This project explores a bank loan dataset to understand loan applications, funding, repayments, and differences across borrower groups. I used Python in a Jupyter Notebook for data preparation, PostgreSQL and SQL for analysis, and Power BI to build a dashboard.

The analysis covers **38,576 loan records**. The original insights file lists **33 analytical fields** and several derived categories; these details should be checked against the final cleaned dataset before publishing.

## Executive KPI Summary

The following rounded values are consistent with the dashboard figures recorded during the project:

| Metric | Result |
|---|---:|
| Total Loan Applications | 38,576 |
| Total Funded Amount | $435.8M |
| Total Amount Received | $473.1M |
| Average Interest Rate | 12.05% |
| Average DTI | 13.33% |

**Additional metrics to verify in SQL before publishing:** The previous insights file reports 86.2% good loans (about 33.2K) and 13.8% bad loans (about 5.3K). Their definitions and calculations should be checked against the final SQL queries.

## Portfolio Performance Insights

### 1. Compare funded amounts with payments received

The dashboard shows approximately **$435.8M funded** and **$473.1M received** across the dataset. Payments received exceed the funded amount in total, but this alone does **not** establish net profit. Costs, fees, timing, and loan status would also need to be considered.

### 2. Review loan status to understand portfolio quality

The loan-status visual helps compare the different repayment outcomes in the dataset. Reviewing the number and amount of fully paid, current, and charged-off loans can show where repayment risk is concentrated.

### 3. Monitor charge-off rates by grade

The Power BI dashboard includes charge-off rate by loan grade. Comparing grades can help identify segments with higher observed losses. These results describe the historical dataset and do not by themselves predict future defaults.

## Borrower and Risk Insights

### 4. Compare debt-to-income categories

The average DTI is approximately **13.33%**. The dashboard also breaks loans into DTI categories, making it easier to compare application patterns across borrower groups. DTI should be interpreted alongside other factors, not used as the only risk measure.

### 5. Examine income and employment groups

The dashboard compares loan activity across income and employment categories. These views can help describe which borrower groups are represented most often. A higher application count does not necessarily mean better repayment performance.

### 6. Use grade information carefully

Loan grades can be compared with funded amounts and charge-off rates to explore differences in the portfolio. Any recommendation to change lending rules would require additional analysis and validation.

## Product and Purpose Insights

### 7. Identify the most common loan purposes

The loan-purpose chart shows how applications are distributed across borrowing reasons. High-volume purposes may be important to the portfolio, but application volume alone cannot show which purpose is most profitable.

### 8. Compare loan activity across borrower characteristics

The home-ownership and grade charts provide additional ways to understand the mix of loans. These comparisons are useful for identifying patterns to investigate further.

## Geographic Insights

### 9. Review state-level lending activity

The state chart shows how loan activity differs by location. States with more applications or funding are important to monitor for concentration. A state with more loans is not automatically a better-performing market.

## Time-Based Insights

### 10. Track monthly loan trends

The monthly trend chart helps show how loan activity changes over time. Comparing months can reveal increases or decreases in applications and funding. Further analysis is needed before describing a pattern as seasonal or explaining its cause.

## Business Recommendations

1. **Monitor repayment outcomes.** Track loan status and charge-off rates regularly, especially across grades.
2. **Compare volume with risk.** Review loan purposes, states, and borrower categories using both application counts and repayment measures.
3. **Investigate high-risk segments.** Use the DTI, grade, and income views to decide which groups need deeper analysis; do not treat a single variable as proof of risk.
4. **Maintain clear KPI definitions.** Document how funded amount, amount received, average interest, DTI, and charge-off rate are calculated.
5. **Refresh the dashboard when new data is available.** Recheck data quality and compare the latest results with previous reporting periods.

## Tools and Technologies

- **Python / Jupyter Notebook:** Data preparation and analysis
- **PostgreSQL / SQL:** Data storage, querying, and KPI analysis
- **Power BI:** Dashboard visuals and reporting
- **GitHub:** Project organization and portfolio presentation

## Final Conclusion

This project brings together Python, SQL, PostgreSQL, and Power BI to explore **38,576 loan records**. The dashboard summarizes funding, payments, interest rates, DTI, loan status, and differences across borrower and geographic segments. The main value of the analysis is a clearer view of lending activity and areas that deserve closer risk monitoring.

*Before publishing: verify the loan-status percentages, any derived-field counts, and any detailed figures against the final cleaned CSV and SQL results. If the source dataset or adapted material comes from another project, follow its license and include appropriate attribution.*
