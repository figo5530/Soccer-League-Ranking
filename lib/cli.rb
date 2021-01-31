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
            team_array = Scrapper.scrpae_team_from_league("eng")
            stat_array = Scrapper.scrpae_stat_from_league("eng")
            Team.create_from_collection(team_array)
            Team.complete_team_stat(stat_array)
        else
            puts "Sorry, your input was invalid or beyond our database."
            self.prompt_for_league
        end
    end

    def show_table
        puts " Team  GP  W  D  L  F  A  GD  P"
        Team.all.each {|team| puts "#{team.name} #{team.game_played} #{team.wins} #{team.draws} #{team.losses} #{team.goals_for} #{team.goals_against} #{team.goal_difference} #{team.points}" }
    end

    def test
        # team_array = Scrapper.scrpae_team_from_league("ita")
        # stat_array = Scrapper.scrpae_stat_from_league("ita")
        team_array = Scrapper.scrpae_team_from_league("eng")
        stat_array = Scrapper.scrpae_stat_from_league("eng")
        Team.create_from_collection(team_array)
        Team.complete_team_stat(stat_array)
    end
end

cli = CLI.new
cli.test
cli.show_table
