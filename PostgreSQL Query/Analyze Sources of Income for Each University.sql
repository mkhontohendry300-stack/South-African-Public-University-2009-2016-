-- Analyze sources of income with both percentages and actual amounts
SELECT 
    fs.university_name,
    -- Percentages
    ROUND(fs."Government funds" * 100, 2) AS gov_percentage,
    ROUND(fs."Student fees" * 100, 2) AS fees_percentage,
    ROUND(fs."Private income" * 100, 2) AS private_percentage,
    -- Actual amounts (in millions)
    ROUND(fd."2016_Income" / 1000000.0, 2) AS total_income_millions,
    ROUND((fd."2016_Income" * fs."Government funds") / 1000000.0, 2) AS gov_amount_millions,
    ROUND((fd."2016_Income" * fs."Student fees") / 1000000.0, 2) AS fees_amount_millions,
    ROUND((fd."2016_Income" * fs."Private income") / 1000000.0, 2) AS private_amount_millions,
    -- Funding profile
    CASE 
        WHEN fs."Government funds" > 0.5 THEN 'Government Dependent'
        WHEN fs."Student fees" > 0.4 THEN 'Tuition Dependent'
        WHEN fs."Private income" > 0.3 THEN 'Privately Funded'
        ELSE 'Balanced Funding'
    END AS funding_profile
FROM public.university_funding_sources_summary fs
JOIN public.university_financial_income_expenditure fd ON fs.institution_number = fd.institution_number
ORDER BY total_income_millions DESC;