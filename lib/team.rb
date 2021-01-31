class Team
    attr_accessor :name, :game_played, :wins, :draws, :losses, :goals_for, :goals_against, :goal_difference, :points
    
    @@all = []

    def initialize(team_hash)
        team_hash.each {|k,v| self.send(("#{k}="), v) }
        @@all << self
    end

    def self.create_from_collection(team_array)
        team_array.each {|e| Team.new(e) }
        # mass produce team obj from outside the class
    end

    def add_attributes(attribute_hash)
        attribute_hash.each {|attr, value| self.send("#{attr}=", value) }
        # for every instance to set its rest properties such as game_played, wins
        self # return itself for next method's purpose
    end

    def self.all
        @@all
    end
end