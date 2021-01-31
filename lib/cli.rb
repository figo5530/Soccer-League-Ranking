require_relative '../config/environment.rb'
class CLI
    def initialize
    end

    def show_table
        puts " Team  GP W D L F A GD P"
        Team.all.each {|team| puts "#{team.name} #{team.game_played} #{team.wins} #{team.draws} #{team.losses} #{team.goals_for} #{team.goals_against} #{team.goal_difference} #{team.points}" }
    end

    def test
        team_array = Scrapper.scrpae_team_from_league("ita")
        stat_array = Scrapper.scrpae_stat_from_league("ita")
        Team.create_from_collection(team_array)
        Team.complete_team_stat(stat_array)
    end
end

cli = CLI.new
cli.test
cli.show_table
