class FundingRound
    attr_accessor :type, :investment
    attr_reader :startup, :capitalist
    @@all = []
    def initialize(startup, capitalist, type, investment)
        @startup = startup
        @capitalist = capitalist 
        @type = type
        @investment = investment
        @@all << self
    end
    def self.all
        @@all
    end

end
