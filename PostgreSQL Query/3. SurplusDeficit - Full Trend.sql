-- Complete surplus/deficit trend for ALL universities (2009-2016)
SELECT 
    university_name,
    -- Each year
    ROUND("2009_Surplus_Def" * 100, 2) AS surplus_2009,
    ROUND("2010_Surplus_Def" * 100, 2) AS surplus_2010,
    ROUND("2011_Surplus_Def" * 100, 2) AS surplus_2011,
    ROUND("2012_Surplus_Def" * 100, 2) AS surplus_2012,
    ROUND("2013_Surplus_Def" * 100, 2) AS surplus_2013,
    ROUND("2014_Surplus_Def" * 100, 2) AS surplus_2014,
    ROUND("2015_Surplus_Def" * 100, 2) AS surplus_2015,
    ROUND("2016_Surplus_Def" * 100, 2) AS surplus_2016,
    -- Summary statistics
    ROUND((("2009_Surplus_Def" + "2010_Surplus_Def" + "2011_Surplus_Def" + 
            "2012_Surplus_Def" + "2013_Surplus_Def" + "2014_Surplus_Def" + 
            "2015_Surplus_Def" + "2016_Surplus_Def") / 8) * 100, 2) AS avg_8_year,
    -- Volatility (standard deviation)
    ROUND(STDDEV("2009_Surplus_Def") * 100, 2) AS volatility,
    -- Trend direction
    CASE 
        WHEN "2016_Surplus_Def" > "2009_Surplus_Def" AND 
             "2016_Surplus_Def" > ("2009_Surplus_Def" + "2010_Surplus_Def" + "2011_Surplus_Def")/3 THEN 'Improving'
        WHEN "2016_Surplus_Def" < "2009_Surplus_Def" AND 
             "2016_Surplus_Def" < ("2009_Surplus_Def" + "2010_Surplus_Def" + "2011_Surplus_Def")/3 THEN 'Declining'
        ELSE 'Stable'
    END AS trend
FROM public.university_surplus_deficit
GROUP BY university_name, "2009_Surplus_Def", "2010_Surplus_Def", "2011_Surplus_Def", 
         "2012_Surplus_Def", "2013_Surplus_Def", "2014_Surplus_Def", "2015_Surplus_Def", "2016_Surplus_Def"
ORDER BY avg_8_year DESC;