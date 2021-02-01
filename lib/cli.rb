require_relative '../config/environment.rb'
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
        puts "5. Ranking by goals"
        puts "6. Ranking by lost goals"
        puts "Enter team name to check detail information about certain team"
        puts "Enter up or back to select other leagues."
        user_selection(league)
    end

    def user_selection(league)
        input = gets.strip
        if input == "1" || input.include?("ranking") || input.include?("Ranking")
            show_table(league)
        elsif input == "exit" || input == "bye"
            exit_program
        elsif input == "2" || input.include?("Champion") || input.include?("champion")
            puts "------------------------------------"
            puts "These are the teams going to next year Champions league! Hooray!"
            league.team_array.each_with_index {|t, idx| puts "#{idx + 1}. #{t.name}" if idx < 4}
            puts "------------------------------------"
        elsif input == "3" || input.include?("euro") || input.include?("Euro")
            puts "------------------------------------"
            puts "This is the team going to next year Europa league! Hooray!"
            league.team_array.each_with_index {|t, idx| puts "#{idx + 1}. #{t.name}" if idx == 4}
            puts "------------------------------------"
        elsif input == "4" || input.include?("relegate") || input.include?("Relega")
            puts "------------------------------------"
            puts "These are teams might be relegated to a inferior league. Come back next year!"
            league.team_array.each_with_index {|t, idx| puts "#{idx + 1}. #{t.name}" if idx > league.team_array.count - 4 }
            puts "------------------------------------"
        elsif input == "5"
            puts "------------------------------------"
            puts "This is the table ordered by goals. Exhilarating GOAL GOAL GOAL!"
            team_by_goal_for(league)
            puts "------------------------------------"
        elsif input == "6"
            puts "------------------------------------"
            puts "This is the table ordered by lost goals. Reinforce your DEFENSE!"
            team_by_goal_against(league)
            puts "------------------------------------"
        elsif Team.find_by_name(input)
            show_team(input)
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
        Team.all.select {|t| t.league == input}
    end

    def create_league(input, teams)
        League.new(input, teams)
    end

    def show_table(league)
        puts "------------------------------------"
        puts "Rank  Team  GP  W  D  L  F  A  GD  P"
        league.team_array.each.with_index(1) {|team, idx| puts " #{idx}  #{team.name} #{team.game_played} #{team.wins} #{team.draws} #{team.losses} #{team.goals_for} #{team.goals_against} #{team.goal_difference} #{team.points}" }
        puts "------------------------------------"
    end
    
    def show_team(input)
        puts "------------------------------------"
        team = Team.find_by_name(input)
        puts "#{team.name}"
        puts "Plays in #{team.league} league. Current ranking: #{current_ranking_in_league(input)}"
        puts "Played #{team.game_played} games. #{team.wins} Wins #{team.draws} Draws #{team.losses} Losses."
        puts "Scored #{team.goals_for} goals got #{team.goals_against} lost goals."
        puts "Has #{team.points} league points and #{team.goal_difference} goal difference."
        puts "------------------------------------"
    end

    def current_ranking_in_league(input)
        team = Team.find_by_name(input)
        Team.all.select {|t| t.league == team.league }.index {|x| x.name == input } + 1
    end

    def test
        welcome
    end
end

cli = CLI.new
cli.test

