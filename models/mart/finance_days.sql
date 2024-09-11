--mart model: finance team wants the following data at a daily granularity.
{{ config(materialized='table') }}

SELECT
    date_max
    , COUNT(orders_id) AS nb_transactions
    , ROUND(SUM(revenue), 2) AS total_revenue
    , ROUND(AVG(revenue), 2) AS avg_basket
    , ROUND(SUM(revenue)/COUNT(orders_id), 2) AS avg_revenue_per_order
    , ROUND(SUM(margin), 2) AS margin
    , ROUND(SUM(operational_margin), 2) AS operational_margin
    , ROUND(SUM(purchase_cost), 2) AS total_purchase_cost
    , ROUND(SUM(log_cost), 2) AS total_log_costs
    , SUM(quantity) AS total_quantity_sold
FROM {{ ref("int_orders_operational")}}
GROUP BY date_max
ORDER BY date_max ASC

