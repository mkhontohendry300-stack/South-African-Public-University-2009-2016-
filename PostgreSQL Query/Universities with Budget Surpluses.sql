-- Surplus/deficit with both percentage and actual Rand amounts
SELECT 
    s.university_name,
    ROUND(s."2016_Surplus_Def", 2) AS surplus_percentage,
    ROUND(f."2016_Income" / 1000000.0, 2) AS income_millions,
    ROUND(f."2016_Expenditure" / 1000000.0, 2) AS expenditure_millions,
    ROUND((f."2016_Income" - f."2016_Expenditure") / 1000000.0, 2) AS surplus_amount_millions,
    CASE 
        WHEN (f."2016_Income" - f."2016_Expenditure") > 0 THEN 'SURPLUS'
        ELSE 'DEFICIT'
    END AS status
FROM public.university_surplus_deficit s
JOIN public.university_financial_income_expenditure f ON s.institution_number = f.institution_number
WHERE s."2016_Surplus_Def" IS NOT NULL
ORDER BY surplus_amount_millions DESC;