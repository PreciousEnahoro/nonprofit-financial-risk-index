---Source: https://990data.givingtuesday.org/datamarts/?co-item=basic-fields-679696bc141dbd17de689e0f


-- 1) Load everything as VARCHAR so mixed types don’t crash
CREATE TABLE raw_990 AS
SELECT *
FROM read_csv_auto(
  'C:\Users\enaho\Downloads\990GivingTuesday.csv',
  all_varchar = true,
  sample_size = -1,
  ignore_errors = false
);



--Table clean
CREATE TABLE fin_model AS
SELECT
    FILEREIN AS ein,
    TAXYEAR,

    TRY_CAST(TOTREVCURYEA AS DOUBLE) AS total_revenue,
    TRY_CAST(TOTEXPCURYEA AS DOUBLE) AS total_expenses,
    TRY_CAST(TOASEOOYY AS DOUBLE) AS total_assets_end,
    TRY_CAST(TOLIEOOYY AS DOUBLE) AS total_liabilities_end,
    TRY_CAST(NAFBEOY AS DOUBLE) AS net_assets_begin,

    TRY_CAST(TOTACASHCONT AS DOUBLE) AS cash_contributions,
    TRY_CAST(TOTPROSERREV AS DOUBLE) AS program_revenue,
    TRY_CAST(GOVERNGRANTS AS DOUBLE) AS government_grants,

    TRY_CAST(PROGSERVEXPE AS DOUBLE) AS program_expenses,
    TRY_CAST(MANAGENEEXPE AS DOUBLE) AS management_expenses,
    TRY_CAST(FUNDRAEXPENS AS DOUBLE) AS fundraising_expenses

FROM raw_990
WHERE TOTREVCURYEA IS NOT NULL;



--Build the “one row per EIN-year” canonical table
CREATE TABLE fin_model_dedup AS
SELECT *
FROM (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY ein, TAXYEAR
      ORDER BY total_revenue DESC NULLS LAST
    ) AS rn
  FROM fin_model
)
WHERE rn = 1;


--Create longitudinal features (YoY + ratios)
CREATE TABLE fin_ts AS
WITH base AS (
  SELECT
    ein,
    TRY_CAST(TAXYEAR AS INTEGER) AS taxyear,
    total_revenue,
    total_expenses,
    total_assets_end,
    total_liabilities_end
  FROM fin_model_dedup
  WHERE TRY_CAST(TAXYEAR AS INTEGER) IS NOT NULL
)
SELECT
  *,
  (total_revenue - total_expenses) AS surplus,
  CASE WHEN total_revenue > 0 THEN total_expenses / total_revenue END AS expense_ratio,
  CASE WHEN total_assets_end > 0 THEN total_liabilities_end / total_assets_end END AS leverage_ratio,

  total_revenue - LAG(total_revenue) OVER (PARTITION BY ein ORDER BY taxyear) AS rev_yoy,
  total_expenses - LAG(total_expenses) OVER (PARTITION BY ein ORDER BY taxyear) AS exp_yoy,
  total_assets_end - LAG(total_assets_end) OVER (PARTITION BY ein ORDER BY taxyear) AS assets_yoy,

  CASE WHEN LAG(total_revenue) OVER (PARTITION BY ein ORDER BY taxyear) > 0
       THEN (total_revenue - LAG(total_revenue) OVER (PARTITION BY ein ORDER BY taxyear))
            / LAG(total_revenue) OVER (PARTITION BY ein ORDER BY taxyear)
  END AS rev_yoy_pct,

  CASE WHEN LAG(total_assets_end) OVER (PARTITION BY ein ORDER BY taxyear) > 0
       THEN (total_assets_end - LAG(total_assets_end) OVER (PARTITION BY ein ORDER BY taxyear))
            / LAG(total_assets_end) OVER (PARTITION BY ein ORDER BY taxyear)
  END AS assets_yoy_pct

FROM base;


--Distress next year metric: Distress in year t = (surplus < 0) AND (assets_yoy_pct < 0) Then label is distress_next_year = distress(t+1)

CREATE TABLE fin_labeled AS
SELECT
  *,
  CASE
    WHEN (LEAD(surplus) OVER (PARTITION BY ein ORDER BY taxyear) < 0)
     AND (LEAD(assets_yoy_pct) OVER (PARTITION BY ein ORDER BY taxyear) < 0)
    THEN 1 ELSE 0
  END AS distress_next_year
FROM fin_ts
QUALIFY LEAD(taxyear) OVER (PARTITION BY ein ORDER BY taxyear) IS NOT NULL;


--Data export for Python modelling
COPY (
  SELECT
    ein,
    taxyear,
    total_revenue,
    total_assets_end,
    surplus,
    expense_ratio,
    leverage_ratio,
    rev_yoy_pct,
    assets_yoy_pct,
    distress_next_year
  FROM fin_labeled
  WHERE surplus IS NOT NULL
    AND expense_ratio IS NOT NULL
    AND leverage_ratio IS NOT NULL
    AND rev_yoy_pct IS NOT NULL
    AND assets_yoy_pct IS NOT NULL
) TO 'C:\Users\enaho\Downloads\nonprofit_risk_model.parquet' (FORMAT 'parquet');
