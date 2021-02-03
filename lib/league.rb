class League
    attr_accessor :name, :team_array, :champion_league_quota, :relegation, :euro_league, :score_rank, :assist_rank
    @@all = []

    def initialize(name, team_array)
        @name = name
        @team_array = team_array
        name == "fra" ? @champion_league_quota = 2 : @champion_league_quota = 4
        name == "fra" ? @euro_league = 3 : @euro_league = 4
        name == "fra" || name == "ger" ? @relegation = 3 : @relegation = 4
        @@all << self
    end

    def self.all
        @@all
    end

    # def show_score_rank
    #     @score_rank.each_with_index {|player, idx| puts "#{idx+1}. #{player[:name]}  #{player[:team]}  #{player[:game_played]}  #{player[:score]}"}
    # end

    # def show_assist_rank
    #     @assist_rank.each_with_index {|player, idx| puts "#{idx+1}. #{player[:name]}  #{player[:team]}  #{player[:game_played]}  #{player[:assist]}"}
    # end

    def self.find_by_name(name)
        self.all.find {|l| l.name == name}
    end
end