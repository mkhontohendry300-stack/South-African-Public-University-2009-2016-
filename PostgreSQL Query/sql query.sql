-- For stacked column chart showing income sources for all universities in 2016
SELECT 
    university_name,
    ROUND("Government funds" * 100, 2) AS government_percentage,
    ROUND("Student fees" * 100, 2) AS student_fees_percentage,
    ROUND("Private income" * 100, 2) AS private_income_percentage
FROM public.university_funding_sources_summary
WHERE "Government funds" IS NOT NULL
ORDER BY government_percentage DESC;