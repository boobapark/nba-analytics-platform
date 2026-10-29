with combine as (
    select *
    from {{ ref('stg_draft_combine_stats') }}
    qualify row_number() over (
        partition by player_id, draft_year
        order by (height_no_shoes_inches is not null) desc,
                 (wingspan_inches is not null) desc
    ) = 1
)
select
    c.*,
    p.full_name as canonical_player_name
from combine as c
left join {{ ref('stg_player') }} as p
    on c.player_id = p.player_id
