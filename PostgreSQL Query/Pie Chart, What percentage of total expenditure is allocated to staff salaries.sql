-- -- Create table for personnel costs from Table 25

-- CREATE TABLE public.personnel_cost_percent (
--     institution_number VARCHAR(10),
--     university VARCHAR(10),
--     university_name VARCHAR(100),
--     yr2009 DECIMAL(5,3),
--     yr2010 DECIMAL(5,3),
--     yr2011 DECIMAL(5,3),
--     yr2012 DECIMAL(5,3),
--     yr2013 DECIMAL(5,3),
--     yr2014 DECIMAL(5,3),
--     yr2015 DECIMAL(5,3),
--     yr2016 DECIMAL(5,3)
-- );

SELECT 
    p.university_name,
    ROUND(p.yr2016 * 100, 2) AS staff_salaries_percentage,
    ROUND(100 - (p.yr2016 * 100), 2) AS other_expenditure_percentage,
    -- Staff salaries in Rand terms
    ROUND((f."2016_Expenditure" * p.yr2016) / 1000000.0, 2) AS staff_salaries_millions,
    ROUND(f."2016_Expenditure" / 1000000.0, 2) AS total_expenditure_millions
FROM public.personnel_cost_percent p
JOIN public.university_financial_income_expenditure f ON p.institution_number = f.institution_number
WHERE p.yr2016 IS NOT NULL
ORDER BY staff_salaries_percentage DESC;