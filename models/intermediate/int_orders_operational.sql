--create int_orders_operational-- to add operational_margin = margin + shipping_fee - log_cost - ship_cost
SELECT
    sales.orders_id
    , sales.date_max
    , sales.revenue
    , sales.quantity
    , sales.purchase_cost
    , sales.margin
    , ROUND((sales.margin + ship.shipping_fee - ship.logcost - ship.ship_cost),2) AS operational_margin
    , ship.shipping_fee 
    , ship.logcost AS log_cost
    , ship.ship_cost
FROM {{ ref("int_orders_margin")}} AS sales
LEFT JOIN {{ ref("stg_gz_raw_data__ship")}} AS ship
USING (orders_id)