{{ config(materialized='view') }}

select
    ticker,
    open as open_price,
    high as high_price,
    low as low_price,
    close as close_price,
    volume,
    date
from {{ source('public', 'raw_stock_prices') }}