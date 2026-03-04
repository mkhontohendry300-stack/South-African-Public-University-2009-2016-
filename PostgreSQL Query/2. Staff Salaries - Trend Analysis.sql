-- Staff salaries as % of expenditure - 8-year trend
SELECT 
    university_name,
    ROUND(yr2009 * 100, 2) AS pct_2009,
    ROUND(yr2010 * 100, 2) AS pct_2010,
    ROUND(yr2011 * 100, 2) AS pct_2011,
    ROUND(yr2012 * 100, 2) AS pct_2012,
    ROUND(yr2013 * 100, 2) AS pct_2013,
    ROUND(yr2014 * 100, 2) AS pct_2014,
    ROUND(yr2015 * 100, 2) AS pct_2015,
    ROUND(yr2016 * 100, 2) AS pct_2016,
    ROUND((yr2016 - yr2009) * 100, 2) AS change_2009_2016
FROM public.personnel_cost_percent
WHERE yr2009 IS NOT NULL AND yr2016 IS NOT NULL
ORDER BY change_2009_2016 DESC;