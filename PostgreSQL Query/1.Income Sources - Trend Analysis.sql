-- Income sources trend for ALL universities over time
SELECT 
    university_name,
    -- Government funds trend
    ROUND(AVG("Government funds_2009") * 100, 2) AS gov_2009,
    ROUND(AVG("Government funds_2010") * 100, 2) AS gov_2010,
    ROUND(AVG("Government funds_2011") * 100, 2) AS gov_2011,
    ROUND(AVG("Government funds_2012") * 100, 2) AS gov_2012,
    ROUND(AVG("Government funds_2013") * 100, 2) AS gov_2013,
    ROUND(AVG("Government funds_2014") * 100, 2) AS gov_2014,
    ROUND(AVG("Government funds_2015") * 100, 2) AS gov_2015,
    ROUND(AVG("Government funds_2016") * 100, 2) AS gov_2016,
    -- Change over period
    ROUND((AVG("Government funds_2016") - AVG("Government funds_2009")) * 100, 2) AS gov_change_2009_2016
FROM public.university_funding_sources_detailed
GROUP BY university_name
ORDER BY gov_change_2009_2016 DESC;