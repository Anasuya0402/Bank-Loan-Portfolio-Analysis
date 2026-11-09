
-- Q1. Calculate the total number of loan applications

SELECT
    COUNT(*) AS total_loan_applications
FROM cleaned_financial_loan;

SELECT
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_amount)::numeric, 2) AS avg_loan_amount,
    ROUND(AVG(int_rate)::numeric * 100, 2) AS avg_interest_rate_pct,
    ROUND(AVG(annual_income)::numeric, 2) AS avg_annual_income
FROM cleaned_financial_loan;



-- Query 2: Loan Status Analysis

SELECT
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM cleaned_financial_loan
GROUP BY loan_status
ORDER BY total_loans DESC;



-- Query 3: Loan Performance by Grade

SELECT
    grade,
    COUNT(*) AS total_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Fully Paid'
    ) AS fully_paid_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS charged_off_loans,
    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(
            COUNT(*) FILTER (
                WHERE loan_status IN ('Fully Paid', 'Charged Off')
            ), 0
        ),
        2
    ) AS charged_off_rate_pct
FROM cleaned_financial_loan
GROUP BY grade
ORDER BY grade;



-- Query 4: Loan Performance by Purpose

SELECT
    purpose,
    COUNT(*) AS total_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS charged_off_loans,
    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(
            COUNT(*) FILTER (
                WHERE loan_status IN ('Fully Paid', 'Charged Off')
            ), 0
        ),
        2
    ) AS charged_off_rate_pct
FROM cleaned_financial_loan
GROUP BY purpose
ORDER BY charged_off_rate_pct DESC NULLS LAST;



-- Query 5: Loan Performance by Home Ownership

SELECT
    home_ownership,
    COUNT(*) AS total_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Fully Paid'
    ) AS fully_paid_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS charged_off_loans,
    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(
            COUNT(*) FILTER (
                WHERE loan_status IN ('Fully Paid', 'Charged Off')
            ), 0
        ),
        2
    ) AS charged_off_rate_pct
FROM cleaned_financial_loan
GROUP BY home_ownership
ORDER BY total_loans DESC;



-- Query 6: Loan Performance by Income Group

WITH income_data AS (
    SELECT
        CASE
            WHEN annual_income < 40000 THEN 'Low Income'
            WHEN annual_income < 80000 THEN 'Middle Income'
            WHEN annual_income < 120000 THEN 'Upper Middle'
            WHEN annual_income < 200000 THEN 'High Income'
            ELSE 'Very High Income'
        END AS income_group,
        loan_status
    FROM cleaned_financial_loan
    WHERE annual_income IS NOT NULL
)
SELECT
    income_group,
    COUNT(*) AS total_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Fully Paid'
    ) AS fully_paid_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS charged_off_loans,
    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(
            COUNT(*) FILTER (
                WHERE loan_status IN ('Fully Paid', 'Charged Off')
            ), 0
        ),
        2
    ) AS charged_off_rate_pct
FROM income_data
GROUP BY income_group
ORDER BY charged_off_rate_pct DESC NULLS LAST;


-- Query 7: Loan Performance by Interest Rate

WITH interest_data AS (
    SELECT
        CASE
            WHEN int_rate < 0.10 THEN 'Below 10%'
            WHEN int_rate < 0.15 THEN '10% - 15%'
            WHEN int_rate < 0.20 THEN '15% - 20%'
            ELSE '20% and Above'
        END AS interest_group,
        loan_status
    FROM cleaned_financial_loan
    WHERE int_rate IS NOT NULL
)
SELECT
    interest_group,
    COUNT(*) AS total_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS charged_off_loans,
    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(
            COUNT(*) FILTER (
                WHERE loan_status IN ('Fully Paid', 'Charged Off')
            ), 0
        ),
        2
    ) AS charged_off_rate_pct
FROM interest_data
GROUP BY interest_group
ORDER BY charged_off_rate_pct DESC NULLS LAST;


-- Check DTI values and their scale

SELECT
    MIN(dti) AS minimum_dti,
    MAX(dti) AS maximum_dti,
    ROUND(AVG(dti)::numeric, 4) AS average_dti,
    COUNT(*) FILTER (
        WHERE dti IS NULL
    ) AS missing_dti
FROM cleaned_financial_loan;



-- Query 8: Loan Performance by DTI Category

WITH dti_data AS (
    SELECT
        CASE
            WHEN dti < 0.10 THEN 'Low'
            WHEN dti < 0.20 THEN 'Medium'
            WHEN dti < 0.30 THEN 'High'
            ELSE 'Very High'
        END AS dti_category,
        CASE
            WHEN dti < 0.10 THEN 1
            WHEN dti < 0.20 THEN 2
            WHEN dti < 0.30 THEN 3
            ELSE 4
        END AS category_order,
        loan_status
    FROM cleaned_financial_loan
    WHERE dti IS NOT NULL
)
SELECT
    dti_category,
    COUNT(*) AS total_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Fully Paid'
    ) AS fully_paid_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS charged_off_loans,
    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(
            COUNT(*) FILTER (
                WHERE loan_status IN ('Fully Paid', 'Charged Off')
            ), 0
        ),
        2
    ) AS charged_off_rate_pct
FROM dti_data
GROUP BY dti_category, category_order
ORDER BY category_order;


-- Query 9: Loan Performance by Employment Length

SELECT
    emp_length,
    COUNT(*) AS total_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Fully Paid'
    ) AS fully_paid_loans,
    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS charged_off_loans,
    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(
            COUNT(*) FILTER (
                WHERE loan_status IN ('Fully Paid', 'Charged Off')
            ), 0
        ),
        2
    ) AS charged_off_rate_pct
FROM cleaned_financial_loan
GROUP BY emp_length
ORDER BY total_loans DESC;


-- Query 10: Loan Performance by Verification Status

SELECT
    verification_status,
    COUNT(*) AS total_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Fully Paid'
    ) AS fully_paid_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS charged_off_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Current'
    ) AS current_loans,

    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(
            COUNT(*) FILTER (
                WHERE loan_status IN ('Fully Paid', 'Charged Off')
            ), 0
        ),
        2
    ) AS charged_off_rate_pct

FROM cleaned_financial_loan

GROUP BY verification_status

ORDER BY charged_off_rate_pct DESC NULLS LAST;


-- Query 11: Loan Performance by State

SELECT
    address_state,
    COUNT(*) AS total_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Fully Paid'
    ) AS fully_paid_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS charged_off_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Current'
    ) AS current_loans,

    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(
            COUNT(*) FILTER (
                WHERE loan_status IN ('Fully Paid', 'Charged Off')
            ), 0
        ),
        2
    ) AS charged_off_rate_pct

FROM cleaned_financial_loan

WHERE address_state IS NOT NULL

GROUP BY address_state

ORDER BY total_loans DESC;


-- Query 12: Loan Performance by Loan Term

SELECT
    term AS loan_term,
    COUNT(*) AS total_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Fully Paid'
    ) AS fully_paid_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS charged_off_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Current'
    ) AS current_loans,

    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(
            COUNT(*) FILTER (
                WHERE loan_status IN ('Fully Paid', 'Charged Off')
            ), 0
        ),
        2
    ) AS charged_off_rate_pct

FROM cleaned_financial_loan

GROUP BY term

ORDER BY term;



-- Query 13: Monthly Loan Application Trends (Corrected)

SELECT
    DATE_TRUNC(
        'month',
        TO_DATE(issue_date, 'DD-MM-YYYY')
    )::date AS loan_month,

    COUNT(*) AS total_loans,

    ROUND(
        SUM(loan_amount)::numeric, 2
    ) AS total_funded_amount,

    ROUND(
        AVG(loan_amount)::numeric, 2
    ) AS avg_loan_amount

FROM cleaned_financial_loan

WHERE issue_date IS NOT NULL

GROUP BY 1

ORDER BY loan_month;


-- Query 14: Total Funded Amount and Payments

SELECT
    COUNT(*) AS total_loans,

    ROUND(
        SUM(loan_amount)::numeric, 2
    ) AS total_funded_amount,

    ROUND(
        SUM(total_payment)::numeric, 2
    ) AS total_amount_received,

    ROUND(
        AVG(loan_amount)::numeric, 2
    ) AS avg_loan_amount,

    ROUND(
        AVG(total_payment)::numeric, 2
    ) AS avg_total_payment

FROM cleaned_financial_loan;


-- Query 15: Final Portfolio Risk Summary

SELECT
    COUNT(*) AS total_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Fully Paid'
    ) AS fully_paid_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS charged_off_loans,

    COUNT(*) FILTER (
        WHERE loan_status = 'Current'
    ) AS current_loans,

    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(COUNT(*), 0),
        2
    ) AS portfolio_charge_off_pct,

    ROUND(
        COUNT(*) FILTER (
            WHERE loan_status = 'Charged Off'
        ) * 100.0 /
        NULLIF(
            COUNT(*) FILTER (
                WHERE loan_status IN ('Fully Paid', 'Charged Off')
            ), 0
        ),
        2
    ) AS resolved_loan_charge_off_rate_pct

FROM cleaned_financial_loan;
