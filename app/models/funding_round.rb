require_relative "venture_capitalist.rb"
require_relative "startup.rb"

class FundingRound

    attr_accessor :startup, :venture_cap, :type, :investment

    @@all = []

    def initialize(startup, venture_cap, type, investment)
        @startup = startup
        @venture_cap = venture_cap
        @type = type # Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc
        @investment = investment #a float that is not a negative number
        @@all << self
    end

    def self.all
        @@all
    end

end
