class Team
    attr_accessor :name, :game_played, :wins, :draws, :losses, :goals_for, :goals_against, :goal_difference, :points, :league
    
    @@all = []

    def initialize(team_hash)
        team_hash.each {|k,v| self.send(("#{k}="), v) }
        @@all << self
    end

    def self.create_from_collection(team_array)
        # mass produce team obj from outside the class
        team_array.each {|e| Team.new(e) }
    end

    # deprecated
    # def add_attributes(attribute_hash)
    #     attribute_hash.each {|attr, value| self.send("#{attr}=", value) }
    #     # for every instance to set its rest properties such as game_played, wins
    #     self # return itself for next method's purpose
    # end

    # deprecated
    # def self.complete_team_stat(stat_array)
    #     # for each team in @@all, invoke add_attributes with a hash arg of same index
    #     all.each_with_index {|team, idx| team.add_attributes(stat_array[idx]) }
    # end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find {|t| t.name == name}
    end
end