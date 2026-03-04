-- Universities with consistent surpluses or deficits
SELECT 
    university_name,
    -- Count of surplus years
    (CASE WHEN "2009_Surplus_Def" > 0 THEN 1 ELSE 0 END +
     CASE WHEN "2010_Surplus_Def" > 0 THEN 1 ELSE 0 END +
     CASE WHEN "2011_Surplus_Def" > 0 THEN 1 ELSE 0 END +
     CASE WHEN "2012_Surplus_Def" > 0 THEN 1 ELSE 0 END +
     CASE WHEN "2013_Surplus_Def" > 0 THEN 1 ELSE 0 END +
     CASE WHEN "2014_Surplus_Def" > 0 THEN 1 ELSE 0 END +
     CASE WHEN "2015_Surplus_Def" > 0 THEN 1 ELSE 0 END +
     CASE WHEN "2016_Surplus_Def" > 0 THEN 1 ELSE 0 END) AS years_in_surplus,
    
    -- Count of deficit years
    (CASE WHEN "2009_Surplus_Def" < 0 THEN 1 ELSE 0 END +
     CASE WHEN "2010_Surplus_Def" < 0 THEN 1 ELSE 0 END +
     CASE WHEN "2011_Surplus_Def" < 0 THEN 1 ELSE 0 END +
     CASE WHEN "2012_Surplus_Def" < 0 THEN 1 ELSE 0 END +
     CASE WHEN "2013_Surplus_Def" < 0 THEN 1 ELSE 0 END +
     CASE WHEN "2014_Surplus_Def" < 0 THEN 1 ELSE 0 END +
     CASE WHEN "2015_Surplus_Def" < 0 THEN 1 ELSE 0 END +
     CASE WHEN "2016_Surplus_Def" < 0 THEN 1 ELSE 0 END) AS years_in_deficit,
    
    -- Classification
    CASE 
        WHEN (CASE WHEN "2009_Surplus_Def" > 0 THEN 1 ELSE 0 END +
              CASE WHEN "2010_Surplus_Def" > 0 THEN 1 ELSE 0 END +
              CASE WHEN "2011_Surplus_Def" > 0 THEN 1 ELSE 0 END +
              CASE WHEN "2012_Surplus_Def" > 0 THEN 1 ELSE 0 END +
              CASE WHEN "2013_Surplus_Def" > 0 THEN 1 ELSE 0 END +
              CASE WHEN "2014_Surplus_Def" > 0 THEN 1 ELSE 0 END +
              CASE WHEN "2015_Surplus_Def" > 0 THEN 1 ELSE 0 END +
              CASE WHEN "2016_Surplus_Def" > 0 THEN 1 ELSE 0 END) >= 6 THEN 'Consistently in Surplus'
        WHEN (CASE WHEN "2009_Surplus_Def" < 0 THEN 1 ELSE 0 END +
              CASE WHEN "2010_Surplus_Def" < 0 THEN 1 ELSE 0 END +
              CASE WHEN "2011_Surplus_Def" < 0 THEN 1 ELSE 0 END +
              CASE WHEN "2012_Surplus_Def" < 0 THEN 1 ELSE 0 END +
              CASE WHEN "2013_Surplus_Def" < 0 THEN 1 ELSE 0 END +
              CASE WHEN "2014_Surplus_Def" < 0 THEN 1 ELSE 0 END +
              CASE WHEN "2015_Surplus_Def" < 0 THEN 1 ELSE 0 END +
              CASE WHEN "2016_Surplus_Def" < 0 THEN 1 ELSE 0 END) >= 6 THEN 'Consistently in Deficit'
        ELSE 'Mixed Performance'
    END AS financial_pattern
    
FROM public.university_surplus_deficit
ORDER BY years_in_surplus DESC;