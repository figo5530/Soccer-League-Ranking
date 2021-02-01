class League
    attr_accessor :name, :team_array
    @@all = []

    def initialize(name, team_array)
        @name = name
        @team_array = team_array
        @@all << self
    end

    def self.all
        @@all
    end
end