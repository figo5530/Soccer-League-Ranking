require 'open-uri'
require 'nokogiri'
# "https://www.espn.com/soccer/standings/_/league/eng.1"
class Scrapper

    def self.scrpae_team_from_league(league_name)
        # Users pass arg in we convert it to eng/ita/esp
        site = "https://www.espn.com/soccer/standings/_/league/#{league_name}.1"
        doc = Nokogiri::HTML(open(site))
        # create an array outside the loop to store team hashes in order to mass produce team obj
        teams = []
        # team name is under <a> hide-mobile label
        doc.css(".hide-mobile a").each do |e|
            # create local var "team_name" to store every element's name
            team_name = e.text
            teams << {name: team_name}
        end
        # return that array with hashes for it can be used as an argument
        teams
    end

    def self.scrpae_stat_from_league(league_name)
        # Users pass arg in we convert it to eng/ita/esp
        site = "https://www.espn.com/soccer/standings/_/league/#{league_name}.1"
        doc = Nokogiri::HTML(open(site))
        # create an array with 20 hashes to store 20 teams' stats periodically and separately
        stat_array = Array.new(20) {Hash.new}
        full_stats = doc.css(".Table__TBODY").css("tr").css(".stat-cell")
        full_stats.each_with_index do |stat, i|
            x = i / 8 # x is basically what number is the team that we're operating
            if i % 8 == 0
                stat_array[x][:game_played] = stat.text.to_i #convert it to int so that we can easily manage it
            elsif i % 8 == 1
                stat_array[x][:wins] = stat.text.to_i
            elsif i % 8 == 2
                stat_array[x][:draws] = stat.text.to_i
            elsif i % 8 == 3
                stat_array[x][:losses] = stat.text.to_i
            elsif i % 8 == 4
                stat_array[x][:goals_for] = stat.text.to_i
            elsif i % 8 == 5
                stat_array[x][:goals_against] = stat.text.to_i
            elsif i % 8 == 6
                stat_array[x][:goal_difference] = stat.text.to_i
            else i % 8 == 7
                stat_array[x][:points] = stat.text.to_i
            end
        end
        stat_array
    end

end