class Team
    attr_accessor :name, :game_played, :wins, :draws, :losses, :goals_for, :goals_against, :goal_difference, :points
    
    @@all = []

    def initialize(team_hash)
        team_hash.each {|k,v| self.send(("#{k}="), v) }
        @@all << self
    end

    def self.create_from_collection(team_array)
        team_array.each {|e| Team.new(e)}
    end
end