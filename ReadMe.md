# SoccerLeagueRanking

## Summary
* Overview
* Instruction
* Authors

## Overview

Welcome to Soccer League Ranking! This is Command Line Interface application that provides European Top5 soccer league information based on espn. A list of data i.s presented and based on the user selection by input then displayed in the CLI.

## Instruction

### Before You Begin

Run `bundle install` first

### Play Around

Run `ruby bin/run` to play around in this program

### The `Scrapper` Class

I guess that I miss spelled scraper huh.

#### The `.scrape_team_from_league` Method

Requests one String parameter to create a whole valid URL for scraping.
Returns an array.

#### The `.scrape_stat_from_league` Method

Requests one String parameter and one Array parameter. String is to create a whole valid URL for scraping. Array is for scraped data to operate.
Returns an enhanced array.

#### The `.scrape_score_rank_from_league` Method

Requests one String parameter to create a whole valid URL for scraping score ranking data.
Returns an array

#### The `.scrape_assist_rank_from_league` Method

Requests one String parameter to create a whole valid URL for scraping assist ranking data.
Returns an array

### The `Team` Class

### The `League` Class

### The `CLI` Class
