-- Alternative with quoted column names
SELECT 
    s.university_name,
    
    -- Surplus/Deficit trend (as percentages)
    s."2009_Surplus_Def" * 100 AS surplus_2009,
    s."2016_Surplus_Def" * 100 AS surplus_2016,
    (s."2016_Surplus_Def" - s."2009_Surplus_Def") * 100 AS surplus_change,
    
    -- Income source changes
    (d."Government funds_2016" - d."Government funds_2009") * 100 AS gov_funding_change,
    (d."Student fees_2016" - d."Student fees__2009") * 100 AS student_fees_change,
    (d."Private income_2016" - d."Private income_2009") * 100 AS private_income_change,
    
    -- Growth metrics
    ((f."2016_Income"::numeric / NULLIF(f."2009_Income"::numeric, 0)) - 1) * 100 AS income_growth_percent,
    ((f."2016_Expenditure"::numeric / NULLIF(f."2009_Expenditure"::numeric, 0)) - 1) * 100 AS expenditure_growth_percent,
    
    
    -- Current year income sources
    fs."Government funds" * 100 AS gov_pct_2016,
    fs."Student fees" * 100 AS fees_pct_2016,
    fs."Private income" * 100 AS private_pct_2016
    
FROM public.university_surplus_deficit s
JOIN public.university_financial_income_expenditure f ON s.institution_number = f.institution_number
JOIN public.university_funding_sources_detailed d ON s.institution_number = d.institution_number
LEFT JOIN public.research_output_per_staff r ON s.institution_number = r.institution_number
LEFT JOIN public.university_funding_sources_summary fs ON s.institution_number = fs.institution_number
WHERE s."2009_Surplus_Def" IS NOT NULL AND s."2016_Surplus_Def" IS NOT NULL
ORDER BY surplus_change DESC;