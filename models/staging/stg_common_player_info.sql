with source as (

    select
        PERSON_ID,
        FIRST_NAME,
        LAST_NAME,
        DISPLAY_FIRST_LAST,
        DISPLAY_LAST_COMMA_FIRST,
        DISPLAY_FI_LAST,
        PLAYER_SLUG,
        BIRTHDATE,
        SCHOOL,
        COUNTRY,
        LAST_AFFILIATION,
        HEIGHT,
        WEIGHT,
        SEASON_EXP,
        JERSEY,
        POSITION,
        ROSTERSTATUS,
        GAMES_PLAYED_CURRENT_SEASON_FLAG,
        TEAM_ID,
        TEAM_NAME,
        TEAM_ABBREVIATION,
        TEAM_CODE,
        TEAM_CITY,
        PLAYERCODE,
        FROM_YEAR,
        TO_YEAR,
        DLEAGUE_FLAG,
        NBA_FLAG,
        GAMES_PLAYED_FLAG,
        DRAFT_YEAR,
        DRAFT_ROUND,
        DRAFT_NUMBER,
        GREATEST_75_FLAG
    from {{ source('nba', 'COMMON_PLAYER_INFO') }}

),

renamed as (

    select
        PERSON_ID as player_id,
        FIRST_NAME as first_name,
        LAST_NAME as last_name,
        DISPLAY_FIRST_LAST as display_first_last,
        DISPLAY_LAST_COMMA_FIRST as display_last_comma_first,
        DISPLAY_FI_LAST as display_fi_last,
        PLAYER_SLUG as player_slug,
        BIRTHDATE as birthdate,
        SCHOOL as school,
        COUNTRY as country,
        LAST_AFFILIATION as last_affiliation,
        HEIGHT as height,
        WEIGHT as weight,
        SEASON_EXP as season_exp,
        JERSEY as jersey,
        POSITION as position,
        ROSTERSTATUS as roster_status,
        GAMES_PLAYED_CURRENT_SEASON_FLAG as games_played_current_season_flag,
        TEAM_ID as team_id,
        TEAM_NAME as team_name,
        TEAM_ABBREVIATION as team_abbreviation,
        TEAM_CODE as team_code,
        TEAM_CITY as team_city,
        PLAYERCODE as player_code,
        FROM_YEAR as from_year,
        TO_YEAR as to_year,
        DLEAGUE_FLAG as dleague_flag,
        NBA_FLAG as nba_flag,
        GAMES_PLAYED_FLAG as games_played_flag,
        DRAFT_YEAR as draft_year,
        DRAFT_ROUND as draft_round,
        DRAFT_NUMBER as draft_number,
        GREATEST_75_FLAG as greatest_75_flag
    from source

)

select *
from renamed
