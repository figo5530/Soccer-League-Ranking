require_relative '../config/environment.rb'
class CLI
    def initialize
    end

    def test
        team_array = Scrapper.scrpae_team_from_league("ita")
        stat_array = Scrapper.scrpae_stat_from_league("ita")
        Team.create_from_collection(team_array)
        Team.complete_team_stat(stat_array)
        Team.show_table
    end
end

cli = CLI.new
cli.test
