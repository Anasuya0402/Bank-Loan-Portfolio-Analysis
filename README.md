# Bank Loan Portfolio Analysis

**End-to-End Data Analytics Project using Python, PostgreSQL, SQL, and Power BI**

## Project Overview

This project analyzes a bank loan portfolio to understand loan applications, funded amounts, repayments, borrower characteristics, and overall portfolio performance.

I used Python for data preparation, PostgreSQL for storing the cleaned data, SQL for business analysis, and Power BI to develop an interactive dashboard presenting key portfolio metrics and trends.

**Project Workflow:**

Raw Data → Python Data Cleaning → PostgreSQL → SQL Analysis → Power BI Dashboard → Business Insights

## Project Objectives

- Analyze total loan applications and funded amounts.
- Compare funded amounts with amounts received.
- Understand loan status and portfolio performance.
- Analyze interest rates and debt-to-income (DTI) ratios.
- Explore loan purpose, grade, employment, income, and home ownership.
- Identify trends and patterns that can support lending decisions.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning and preparation |
| Jupyter Notebook | Python analysis |
| Pandas and NumPy | Data manipulation |
| PostgreSQL | Database storage |
| SQL | Business analysis and KPI calculations |
| Power BI | Dashboard development and visualization |
| GitHub | Version control and documentation |

## Dataset Overview

The project uses a financial loan dataset containing borrower and loan-related information.

- Original dataset: `financial_loan.csv`
- Cleaned dataset: `cleaned_financial_loan.csv`
- PostgreSQL table: `cleaned_financial_loan`
- Loan records analyzed: 38,576

The dataset includes loan amount, total payment, loan status, interest rate, DTI, annual income, loan grade, loan purpose, state, and home ownership.

**Dataset Source:** Add the original dataset source and license information here.

## Data Cleaning and Preparation

Data preparation was performed using Python in Jupyter Notebook.

The work included:

- Inspecting the dataset and its structure.
- Checking missing values and duplicate records.
- Preparing columns and data types for analysis.
- Cleaning relevant fields.
- Creating analytical categories and features.
- Exporting the cleaned dataset for further analysis.

The cleaned data was then loaded into PostgreSQL.

## SQL Analysis

PostgreSQL and SQL were used to analyze the loan portfolio.

The analysis includes:

- Total loan applications.
- Total funded amount.
- Total amount received.
- Average interest rate.
- Average DTI.
- Loan status analysis.
- Loan purpose analysis.
- Loan grade analysis.
- Borrower and employment analysis.
- Home ownership and geographic analysis.
- Monthly loan trends.

The SQL queries are available in the `SQL` folder.

## Power BI Dashboard

The project includes a Power BI dashboard developed using the cleaned loan data.

The dashboard presents:

- Total loan applications.
- Total funded amount.
- Total amount received.
- Average interest rate.
- Average DTI.
- Loan status distribution.
- Loan purpose and loan grade analysis.
- DTI category analysis.
- Home ownership and borrower characteristics.
- Monthly loan trends.
- [Bank Loan Portfolio Dashboard](Images/Bank_Loan_Dashboard.png)

### Key Dashboard Metrics

| Metric | Result |
|---|---:|
| Total Loan Applications | 38,576 |
| Total Funded Amount | $435.8M |
| Total Amount Received | $473.1M |
| Average Interest Rate | 12.05% |
| Average DTI | 13.33% |

*Values are rounded where applicable.*

Open the Power BI file using Power BI Desktop.

## Business Insights

The analysis helps explore:

1. The relationship between funded amounts and payments received.
2. Differences in loan performance by loan status.
3. Borrower characteristics across loan grades.
4. Loan distribution across different purposes.
5. Differences in DTI and income categories.
6. Monthly changes in loan applications and funding.

These findings can help support portfolio monitoring and risk assessment.

## Repository Structure

```text
Bank-Loan-Portfolio-Analysis/
│
├── README.md
├── Data/
│   ├── financial_loan.csv
│   └── cleaned_financial_loan.csv
│
├── Notebook/
│   └── Bank_Loan_Analysis.ipynb
│
├── Power BI/
│   └── Bank_Loan_Portfolio_Dashboard.pbix
│
├── SQL/
│   └── Bank_Loan_Portfolio_Analysis.sql
│
└── Report/
    ├── Bank_Loan_Portfolio_Analysis_Report.pdf
    ├── Bank_Loan_Portfolio_Presentation.pptx
    └── Insights.md
```

## How to Explore the Project

**1. Python Notebook**

Open `Notebook/Bank_Loan_Analysis.ipynb` using Jupyter Notebook or JupyterLab.

**2. PostgreSQL Analysis**

Create a PostgreSQL database, load the cleaned dataset into the `cleaned_financial_loan` table, and execute the SQL queries using pgAdmin or another PostgreSQL client.

**3. Power BI Dashboard**

Open `Power BI/Bank_Loan_Portfolio_Dashboard.pbix` using Power BI Desktop.

**4. Project Documentation**

Explore the `Report` folder for the PDF report, PowerPoint presentation, and business insights.

## Security

Database passwords, private connection strings, and other credentials should not be committed to GitHub.

Use placeholders or environment variables for database credentials.

## Author

**Anasuya Singaram**

Data Analytics | Python | SQL | PostgreSQL | Power BI
