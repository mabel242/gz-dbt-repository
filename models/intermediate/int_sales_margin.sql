SELECT
  date_date
  , sales.orders_id
  , sales.product_id
  , revenue
  , quantity
  , (sales.quantity * product.purchase_price) AS purchase_cost
  , revenue - (sales.quantity * product.purchase_price) AS margin
FROM {{ ref("stg_gz_raw_data__sales")}} AS sales
LEFT JOIN {{ ref("stg_gz_raw_data__product")}} AS product
  ON sales.product_id = product.products_id