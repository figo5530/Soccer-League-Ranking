require_relative '../config/environment.rb'
require 'pry'
class CLI

    def welcome
        puts "Welcome to the Soccer League Ranking app!"
        self.prompt_for_league
    end

    def prompt_for_league
        puts "Which league would you like to check?"
        puts "Please enter ita for Serie A, esp for La Liga, eng for Premier League."
        input = gets.strip
        if League.find_by_name(input)
            league = League.find_by_name(input)
        elsif input == "ita" || input == "esp" || input == "eng"
            teams = create_teams(input)
            league = create_league(input, teams)
        else
            puts "--Sorry, your input was invalid or beyond our database.--"
            self.prompt_for_league
        end
        league_options(league)
    end

    def league_options(league)
        puts "Please choose from the following list for #{league.name} information."
        puts "1. Ranking"
        puts "2. Teams going to next season's UEFA Champions League"
        puts "3. Teams going to next season's Europa League"
        puts "4. Teams might be relegated at the end of this season"
        # to be continued
        puts "Enter up or back to select other leagues."
        user_selection(league)
    end

    def user_selection(league)
        input = gets.strip
        if input == "1" || input.include?("ranking") || input.include?("Ranking")
            show_table(league)
        elsif input == "exit" || input == "bye"
            exit_program
        elsif input == "up" || input == "back"
            prompt_for_league
        else
            puts "--The selection was invalid.--"
        end
        puts "What more would you like to know? Enter exit or bye to leave this program."
        league_options(league)
    end

    def exit_program
        abort("Thank you for using Soccer League Ranking. See you next time!")
    end
    
    def create_teams(input)
        team_array = Scrapper.scrape_team_from_league(input)
        stat_array = Scrapper.scrape_stat_from_league(input, team_array)
        Team.create_from_collection(stat_array)
        # Team.complete_team_stat(stat_array)
        Team.all
    end

    def create_league(input, teams)
        League.new(input, teams)
    end

    def show_table(league)
        puts "Rank  Team  GP  W  D  L  F  A  GD  P"
        league.team_array.each.with_index(1) {|team, idx| puts " #{idx}  #{team.name} #{team.game_played} #{team.wins} #{team.draws} #{team.losses} #{team.goals_for} #{team.goals_against} #{team.goal_difference} #{team.points}" }
        puts "------------------------------------"
    end

    def test
        welcome
    end
end

cli = CLI.new
cli.test

