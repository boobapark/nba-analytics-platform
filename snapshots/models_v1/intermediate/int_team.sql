with team as (

    select *
    from {{ ref('stg_team') }}

),

details as (

    select *
    from {{ ref('stg_team_details') }}

)

select

    t.team_id,
    t.team_full_name,
    t.team_abbreviation,
    t.team_name,

    t.city,
    t.state,

    t.year_founded,

    d.arena,
    d.arena_capacity,

    d.owner,
    d.general_manager,
    d.head_coach,

    d.g_league_affiliate,

    d.facebook_url,
    d.instagram_url,
    d.twitter_url,

    case
        when d.g_league_affiliate is not null then true
        else false
    end as has_g_league_affiliate

from team t
left join details d
    on t.team_id = d.team_id