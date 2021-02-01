require_relative '../config/environment.rb'
class CLI
    def initialize
    end

    def welcome
        puts "Welcome to the Soccer League Ranking app!"
        self.prompt_for_league
    end

    def prompt_for_league
        puts "Which league would you like to check?"
        puts "Please enter ita for Serie A, esp for La Liga, eng for Premier League."
        input = gets.strip
        if input == "ita" || input == "esp" || input == "eng"
            create_league(input)
        else
            puts "Sorry, your input was invalid or beyond our database."
            self.prompt_for_league
        end
        league_options
    end

    def league_options
        puts "Please choose from the following list for information."
        puts "1. Ranking"
        puts "2. Teams going to next season's UEFA Champions League"
        puts "3. Teams going to next season's Europa League"
        puts "4. Teams might be relegated at the end of this season"
        # to be continued
        user_selection
    end

    def user_selection
        input = gets.strip
        if input == "1" || input.include?("ranking") || input.include?("Ranking")
            show_table
        end
    end

    def create_league(input)
        team_array = Scrapper.scrpae_team_from_league(input)
        stat_array = Scrapper.scrpae_stat_from_league(input)
        Team.create_from_collection(team_array)
        Team.complete_team_stat(stat_array)
    end

    def show_table
        puts "Rank  Team  GP  W  D  L  F  A  GD  P"
        Team.all.each.with_index(1) {|team, idx| puts " #{idx}  #{team.name} #{team.game_played} #{team.wins} #{team.draws} #{team.losses} #{team.goals_for} #{team.goals_against} #{team.goal_difference} #{team.points}" }
    end

    def test
        welcome
    end
end

cli = CLI.new
cli.test

