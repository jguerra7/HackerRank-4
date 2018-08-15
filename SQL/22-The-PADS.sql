SELECT NAME||'('||SUBSTR(OCCUPATION, 1,1)||')' FROM OCCUPATIONS ORDER BY NAME;

SELECT
'There '||IA||' a total of '||OC||' '||LOWER(O)||TRIM(S)||'.' AS REPORT
FROM
(
    SELECT O, OC
    , CASE WHEN OC = 1 THEN 'is'
    ELSE 'are' END AS IA
    , CASE WHEN OC = 1 THEN ' '
    ELSE 's' END AS S
    FROM
    (
    SELECT DISTINCT OCCUPATION O, COUNT(1) OVER (PARTITION BY OCCUPATION) OC FROM OCCUPATIONS
    )
)
ORDER BY OC ASC, O ASC;