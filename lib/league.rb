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

    def self.find_by_name(name)
        self.all.find {|l| l.name == name}
    end
end