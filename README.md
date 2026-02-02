# IPL-Ball-by-Ball-Data-Analysis-SQL-

## 📌 Project Overview

This project performs a detailed ball-by-ball analysis of IPL matches using SQL.
The analysis focuses on batting performance, bowling effectiveness, team-wise trends, over-wise patterns, extras impact, and innings comparison, all derived from raw delivery-level data.

## 🎯 Objectives of the Analysis

Understand overall match and season coverage

Analyze top-performing batters and bowlers

Evaluate strike rate and economy using realistic filters

Study team-wise batting and bowling performance

Identify over-wise scoring and wicket trends

Compare first-innings vs second-innings performance

Analyze the impact of extras on total runs

## 🧾 Dataset Description

File Name: ball_by_ball_data.csv

Level: Delivery (ball-by-ball) data

Key Columns Include:

Match & season identifiers

Batter, bowler, non-striker

Batting & bowling teams

Over and ball number

Batter runs, extras, total runs

Wicket details and dismissal type

Extras breakdown (wide, no-ball, bye, leg-bye, penalty)

Innings information

## 🛠️ Tools & Technologies

Database: PostgreSQL

Language: SQL

Files Used:

ball_by_ball_data.csv – raw dataset

IPL data analysis ball_by_ball.sql – analysis queries

## 📊 Analysis & Key Work Done (Exact from SQL File)
### 🔹 Database & Table Setup

Created a dedicated database for IPL analysis

Designed a structured ball_by_ball table to store delivery-level data

### 🔹 Tournament Coverage Analysis

Calculated total number of matches

Calculated total number of seasons

### 🔹 Batting Analysis

Identified Top 10 run scorers across all seasons

Calculated strike rate for batters:

Excluded wide balls from ball count

Applied a minimum 300-ball filter for fairness

Ranked batters by strike rate

### 🔹 Bowling Analysis

Identified Top 10 wicket-taking bowlers

Calculated economy rate:

Runs conceded per over

Overs calculated using valid (non-wide) deliveries

### 🔹 Wicket Analysis

Analyzed distribution of wicket types

(caught, bowled, lbw, run out, etc.)

Ranked dismissal types by frequency

### 🔹 Team Performance Analysis

Calculated total runs scored by each team

Calculated total wickets taken by each bowling team

### 🔹 Over-wise Analysis

Analyzed Powerplay overs (0–5):

Team-wise runs scored

Analyzed Death overs (15–20):

Team-wise runs scored

Identified overs where most wickets fall

### 🔹 Extras Analysis

Calculated total runs contributed by:

Wides

No-balls

Leg byes

Byes

Penalty runs

### 🔹 Innings-wise Performance

First Innings Analysis

Total runs scored by each team

Average runs per team

Second Innings Analysis

Total runs scored by each team

Average runs per team

## 🧠 SQL Concepts Applied

GROUP BY with aggregations

FILTER clause for conditional counting

Aggregate functions: SUM, COUNT, AVG

Boolean-based filtering

Over-based and innings-based segmentation

Real-world cricket logic implementation

## 📈 Key Insights from the Project

Strike rate analysis becomes more reliable when wide balls are excluded

Certain overs consistently see higher wicket fall frequency

Extras contribute a significant portion of total match runs

Team performance varies noticeably between first and second innings

## Conclusion

This project demonstrates strong SQL fundamentals applied to real-world sports data.
By working at ball-level granularity, the analysis showcases the ability to handle large datasets, apply domain logic, and extract insights that align with professional cricket analytics.
