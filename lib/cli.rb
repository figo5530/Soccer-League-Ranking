class CLI
    def initialize
    end

    def test
        team_array = Scrapper.scrpae_team_from_league(ita)
        stat_array = Scrapper.scrpae_stat_from_league(ita)
        Team.create_from_collection(team_array)
        Team.all.each do |team|
            puts "#{team.name} #{team.game_played} #{team.wins} #{team.draws} #{team.losses} #{team.goals_for} #{team.goals_against} #{team.goal_difference} #{team.points}"
        end
    end
end

cli = CLI.new
cli.test
