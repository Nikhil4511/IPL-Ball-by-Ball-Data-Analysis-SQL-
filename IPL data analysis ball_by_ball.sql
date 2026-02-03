-- Database: ipl_analysis

-- DROP DATABASE IF EXISTS ipl_analysis;

CREATE DATABASE ipl_analysis
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- 

	CREATE TABLE ball_by_ball (
    season_id INT,
    match_id INT,
    batter TEXT,
    bowler TEXT,
    non_striker TEXT,
    team_batting TEXT,
    team_bowling TEXT,
    over_number INT,
    ball_number INT,
    batter_runs INT,
    extras INT,
    total_runs INT,
    batsman_type TEXT,
    bowler_type TEXT,
    player_out TEXT,
    fielders_involved TEXT,
    is_wicket BOOLEAN,
    is_wide_ball BOOLEAN,
    is_no_ball BOOLEAN,
    is_leg_bye BOOLEAN,
    is_bye BOOLEAN,
    is_penalty BOOLEAN,
    wide_ball_runs INT,
    no_ball_runs INT,
    leg_bye_runs INT,
    bye_runs INT,
    penalty_runs INT,
    wicket_kind TEXT,
    is_super_over BOOLEAN,
    innings INT
);

select * from ball_by_ball

-- Total Matches
select count(distinct match_id) as total_matches
from ball_by_ball;

-- Total seasons
select count(distinct season_id) as total_season
from ball_by_ball;

-- Batting Analysis
-- Top 10 Run Scorers
select batter,
	sum(batter_runs) as total_runs
	from ball_by_ball
	group by batter
	order by total_runs desc
	limit 10;

-- Strike rate
select batter,
	sum(batter_runs) as runs,
	count(*) filter (where is_wide_ball = FALSE) as balls,
	round(
	(sum(batter_runs)::decimal /
	count(*) filter (where is_wide_ball = FALSE)) * 100,2
	) as strike_rate
from ball_by_ball
group by batter
Having count(*) filter (where is_wide_ball = FALSE) >= 300
order by strike_rate desc
limit 10;

-- Bowling Analysis 
-- Top ten wicket takers
select bowler,
	count(*) as wicket
from ball_by_ball
where is_wicket = TRUE
group by bowler
order by wicket desc
limit 10;

-- Economy Rate (Runs per Over)
select bowler,
	round(
		sum(total_runs)::decimal / 
		(count(*) filter (where is_wide_ball = FALSE) / 6.0), 2
	) as economy
from ball_by_ball
group by bowler
order by economy;


-- Wickets Analysis
-- Wickets type distribution
select wicket_kind,
	count(*) as total_wickets
from ball_by_ball
where is_wicket = TRUE
group  by wicket_kind
order by total_wickets desc;


-- Team Performance Analysis
-- Runs Scored by Each Team
select team_batting,
	sum(total_runs) as total_runs
from ball_by_ball
group by  team_batting
order by total_runs desc;


-- Wickets by each teams
select team_bowling,
	count(*) as wickets
from ball_by_ball
where is_wicket = TRUE
group by team_bowling
order by wickets desc;


-- Over-Wise Analysis
-- Power play Overs (0–5)
SELECT team_batting,
       SUM(total_runs) AS powerplay_runs
FROM ball_by_ball
WHERE over_number BETWEEN 0 AND 5
GROUP BY team_batting
ORDER BY powerplay_runs DESC;

--
SELECT team_batting,
       SUM(total_runs) AS powerplay_runs
FROM ball_by_ball
WHERE over_number BETWEEN 15 AND 20
GROUP BY team_batting
ORDER BY powerplay_runs DESC;

-- Extras Analysis
SELECT
    SUM(wide_ball_runs) AS wides,
    SUM(no_ball_runs) AS no_balls,
    SUM(leg_bye_runs) AS leg_byes,
    SUM(bye_runs) AS byes,
    SUM(penalty_runs) AS penalties
FROM ball_by_ball;


-- Over Where Most Wickets Fall
select over_number,
	count(*) as wickets
from ball_by_ball
where is_wicket = TRUE
group by over_number
order  by wickets desc;

-- Best Batting first inning
SELECT team_batting,
       sum(total_runs) AS sum_runs
FROM ball_by_ball
WHERE innings = 1
GROUP BY team_batting
ORDER BY sum_runs DESC;

SELECT team_batting,
       avg(total_runs) AS avg_runs
FROM ball_by_ball
WHERE innings = 1
GROUP BY team_batting
ORDER BY avg_runs DESC;


-- Best batting second inning

SELECT team_batting,
       sum(total_runs) AS sum_runs
FROM ball_by_ball
WHERE innings = 2
GROUP BY team_batting
ORDER BY sum_runs DESC;

--
SELECT team_batting,
       avg(total_runs) AS avg_runs
FROM ball_by_ball
WHERE innings = 2
GROUP BY team_batting
ORDER BY avg_runs DESC;

