with bounds as (

    select
        min(game_date) as min_date,
        max(game_date) as max_date
    from BASKETBALL_DEV.intermediate.int_game_enriched

),

calendar as (

    select
        dateadd(
            day,
            seq4(),
            min_date
        ) as full_date
    from bounds,
    table(
        generator(
            rowcount => 50000
        )
    )
    where dateadd(
        day,
        seq4(),
        min_date
    ) <= max_date

)

select
    to_number(to_char(full_date, 'YYYYMMDD')) as date_key,
    full_date,

    year(full_date) as calendar_year,
    quarter(full_date) as calendar_quarter,
    month(full_date) as month_number,

    monthname(full_date) as month_name,

    day(full_date) as day_of_month,

    dayofweek(full_date) as day_of_week_number,

    dayname(full_date) as day_name,

    weekofyear(full_date) as week_of_year,

    case
        when dayofweek(full_date) in (0, 6)
        then true
        else false
    end as is_weekend

from calendar