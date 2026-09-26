with staging as (
    select * from {{ ref('stg_stock_prices') }}
),

calculated as (
    select
        stock_date,
        ticker_symbol,
        open_price,
        high_price,
        low_price,
        close_price,
        volume,
        -- Calcolo dello spread giornaliero (volatilità intraday)
        high_price - low_price as daily_spread,
        -- Variazione percentuale tra chiusura e apertura
        round(((close_price - open_price) / nullif(open_price, 0)) * 100, 2) as intraday_return_pct
    from staging
)

select * from calculated