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

Pretty standard.

#### The `#initialize` Method
```
    team_hash.each {|k,v| self.send(("#{k}="), v) }
    @@all << self
```
Requests an argument `team_hash` which is a hash
Creates an Team object and sets its properties according to key/value pair of pased in argument

#### The `.create_from_collection` Method
Requests an Array as argument
Creates objects from every hashes in this array

#### The `.all` Method
Returns `@@all`

#### The `.find_by_name` Method
Requests a String argument
Returns a team object if it exists


### The `League` Class

#### The `#initialize` Method
```
    @name = name
    @team_array = team_array
    name == "fra" ? @champion_league_quota = 2 : @champion_league_quota = 4
    name == "fra" ? @euro_league = 3 : @euro_league = 4
    name == "fra" || name == "ger" ? @relegation = 3 : @relegation = 4
    @@all << self
```
Requests an argument `team_array` which is an array of Team objects and a argument `name` to set different rules for different league.
Creates an League object and sets its properties according to `name`

#### The `.all` Method
Returns `@@all`

#### The `.find_by_name` Method
Requests a String argument
Returns a league object if it exists

### The `CLI` Class

#### Flow Control Category

#### The `#welcome` Method

Lead the way!

#### The `#prompt_for_league` Method

This method should prompt user to input a string.
The string user typed in would lead this method to different directions.
If user inputs meaningless strings, it would recurse back to itself.
If user inputs `ita` `esp` `eng` `fra` `ger` for the first time, it would invoke `#create_teams`, `#create_league`, `.scrape_score_rank_from_league`, `scrape_assist_rank_from_league` to create teams, league and set `league.score_rank` and `league.assist_rank` the whole package of a league.
If user inputs  `ita` `esp` `eng` `fra` `ger` for the second time, it would assign corresponding league object to this `league` variable.
Last two path would lead to the next method `league_options` with `league` variable.

#### The `#league_options` Method
#### The `#user_selection` Method
#### The `#exit_program` Method

***

#### Object Generation Category

#### The `#create_teams` Method
#### The `#create_league` Method

***

#### Demonstration Category

#### The `#show_table` Method
#### The `#show_score_rank` Method
#### The `#show_assist_rank` Method
#### The `#show_team` Method
#### The `#team_by_goal_for` Method
#### The `#team_by_goal_against` Method
#### The `#current_ranking_in_league` Method
