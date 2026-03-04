-- For line chart comparing surplus/deficit trends across institutions
SELECT 
    university_name,
    2009 AS year,
    ROUND("2009_Surplus_Def", 2) AS surplus_percentage
FROM public.university_surplus_deficit
WHERE "2009_Surplus_Def" IS NOT NULL

UNION ALL

SELECT university_name, 2010, ROUND("2010_Surplus_Def", 2)
FROM public.university_surplus_deficit
WHERE "2010_Surplus_Def" IS NOT NULL

UNION ALL

SELECT university_name, 2011, ROUND("2011_Surplus_Def", 2)
FROM public.university_surplus_deficit
WHERE "2011_Surplus_Def" IS NOT NULL

UNION ALL

SELECT university_name, 2012, ROUND("2012_Surplus_Def", 2)
FROM public.university_surplus_deficit
WHERE "2012_Surplus_Def" IS NOT NULL

UNION ALL

SELECT university_name, 2013, ROUND("2013_Surplus_Def", 2)
FROM public.university_surplus_deficit
WHERE "2013_Surplus_Def" IS NOT NULL

UNION ALL

SELECT university_name, 2014, ROUND("2014_Surplus_Def", 2)
FROM public.university_surplus_deficit
WHERE "2014_Surplus_Def" IS NOT NULL

UNION ALL

SELECT university_name, 2015, ROUND("2015_Surplus_Def", 2)
FROM public.university_surplus_deficit
WHERE "2015_Surplus_Def" IS NOT NULL

UNION ALL

SELECT university_name, 2016, ROUND("2016_Surplus_Def", 2)
FROM public.university_surplus_deficit
WHERE "2016_Surplus_Def" IS NOT NULL
ORDER BY university_name, year;