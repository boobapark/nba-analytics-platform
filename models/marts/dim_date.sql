with bounds as (
    select
        min(game_date) as min_date,
        max(game_date) as max_date
    from {{ ref('int_game_enriched') }}
),
calendar as (
    select cast(calendar_date as date) as full_date
    from bounds,
    generate_series(
        cast(min_date as timestamp),
        cast(max_date as timestamp),
        interval '1 day'
    ) as dates(calendar_date)
)
select
    cast(strftime(full_date, '%Y%m%d') as integer) as date_key,
    full_date,
    year(full_date) as calendar_year,
    quarter(full_date) as calendar_quarter,
    month(full_date) as month_number,
    strftime(full_date, '%B') as month_name,
    day(full_date) as day_of_month,
    dayofweek(full_date) as day_of_week_number,
    strftime(full_date, '%A') as day_name,
    week(full_date) as week_of_year,
    dayofweek(full_date) in (0, 6) as is_weekend
from calendar
