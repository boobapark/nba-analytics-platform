
  create or replace   view BASKETBALL_DEV.marts.dim_date
  
   as (
    with calendar as (

    select
        dateadd(day, seq4(), '1946-01-01') as full_date
    from table(generator(rowcount => 50000))

)

select

    to_number(to_char(full_date, 'YYYYMMDD')) as date_id,

    full_date,

    extract(year from full_date) as year,

    extract(quarter from full_date) as quarter,

    extract(month from full_date) as month,

    monthname(full_date) as month_name,

    extract(day from full_date) as day,

    dayname(full_date) as day_name,

    dayofweek(full_date) as day_of_week

from calendar
where full_date <= current_date
  );

