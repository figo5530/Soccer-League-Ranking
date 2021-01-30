require 'open-url'
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

    end

end