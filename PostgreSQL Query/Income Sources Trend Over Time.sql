-- For stacked column chart showing trend over time for a specific university
SELECT 
    university_name,
    2009 AS year,
    ROUND("Government funds_2009" * 100, 2) AS government,
    ROUND("Student fees__2009" * 100, 2) AS student_fees,
    ROUND("Private income_2009" * 100, 2) AS private_income
FROM public.university_funding_sources_detailed
WHERE university_name = 'University of Cape Town'

UNION ALL

SELECT university_name, 2010, 
    ROUND("Government funds_2010" * 100, 2), 
    ROUND("Student fees_2010" * 100, 2), 
    ROUND("Private income_2010" * 100, 2)
FROM public.university_funding_sources_detailed
WHERE university_name = 'University of Cape Town'

UNION ALL

SELECT university_name, 2011, 
    ROUND("Government funds_2011" * 100, 2), 
    ROUND("Student fees_2011" * 100, 2), 
    ROUND("Private income_2011" * 100, 2)
FROM public.university_funding_sources_detailed
WHERE university_name = 'University of Cape Town'

UNION ALL

SELECT university_name, 2012, 
    ROUND("Government funds_2012" * 100, 2), 
    ROUND("Student fees_2012" * 100, 2), 
    ROUND("Private income_2012" * 100, 2)
FROM public.university_funding_sources_detailed
WHERE university_name = 'University of Cape Town'

UNION ALL

SELECT university_name, 2013, 
    ROUND("Government funds_2013" * 100, 2), 
    ROUND("Student fees_2013" * 100, 2), 
    ROUND("Private income_2013" * 100, 2)
FROM public.university_funding_sources_detailed
WHERE university_name = 'University of Cape Town'

UNION ALL

SELECT university_name, 2014, 
    ROUND("Government funds_2014" * 100, 2), 
    ROUND("Student fees_2014" * 100, 2), 
    ROUND("Private income_2014" * 100, 2)
FROM public.university_funding_sources_detailed
WHERE university_name = 'University of Cape Town'

UNION ALL

SELECT university_name, 2015, 
    ROUND("Government funds_2015" * 100, 2), 
    ROUND("Student fees_2015" * 100, 2), 
    ROUND("Private income_2015" * 100, 2)
FROM public.university_funding_sources_detailed
WHERE university_name = 'University of Cape Town'

UNION ALL

SELECT university_name, 2016, 
    ROUND("Government funds_2016" * 100, 2), 
    ROUND("Student fees_2016" * 100, 2), 
    ROUND("Private income_2016" * 100, 2)
FROM public.university_funding_sources_detailed
WHERE university_name = 'University of Cape Town'
ORDER BY year;