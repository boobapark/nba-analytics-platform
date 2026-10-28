with source as (

    select *
    from BASKETBALL_DEV.RAW.PLAY_BY_PLAY

),

renamed as (

    select

        game_id,

        try_to_number(eventnum) as event_number,

        try_to_number(eventmsgtype) as event_type,
        try_to_number(eventmsgactiontype) as event_action_type,

        try_to_number(period) as period,

        wctimestring as wall_clock_time,
        pctimestring as period_clock_time,

        homedescription as home_description,
        neutraldescription as neutral_description,
        visitordescription as visitor_description,

        score,

        scoremargin as score_margin,

        try_to_number(person1type) as person1_type,
        try_to_number(player1_id) as player1_id,
        player1_name,
        try_to_number(player1_team_id) as player1_team_id,
        player1_team_city,
        player1_team_nickname as player1_team_name,
        player1_team_abbreviation,

        try_to_number(person2type) as person2_type,
        try_to_number(player2_id) as player2_id,
        player2_name,
        try_to_number(player2_team_id) as player2_team_id,
        player2_team_city,
        player2_team_nickname as player2_team_name,
        player2_team_abbreviation,

        try_to_number(person3type) as person3_type,
        try_to_number(player3_id) as player3_id,
        player3_name,
        try_to_number(player3_team_id) as player3_team_id,
        player3_team_city,
        player3_team_nickname as player3_team_name,
        player3_team_abbreviation,

        try_to_number(video_available_flag) as video_available_flag

    from source

)

select *
from renamed