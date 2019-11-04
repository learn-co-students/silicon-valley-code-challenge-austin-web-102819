require_relative "funding_round.rb"
require_relative "startup.rb"

class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, type, investment)
        # creates a new funding round and associates it with that startup and venture capitalist
        new_funding_round = FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        # returns an array of all funding rounds for that venture capitalist
        FundingRound.all.select{|round| round.venture_cap == self}
    end

    def portfolio
        # Returns a unique list of all startups this venture capitalist has funded
        FundingRound.all.select{|round| round.startup if round.venture_cap == self}.uniq
    end

    def biggest_investment
        # returns the largest funding round given by this venture capitalist
        all_rounds = self.funding_rounds
        all_rounds.reduce{|min, round| min.investment > round.investment ? min : round}
    end

    def invested(domain)
        # returns the total amount invested in that domain
        all_investments = FundingRound.all.select{|round| round.investment if round.startup.domain == domain && round.venture_cap == self}
        all_investments.reduce(0){|sum, round| sum + round.investment}
    end

    def self.all
        @@all
    end
    
    def self.tres_commas_club
        @@all.select{|cap| cap.total_worth >= 1000000000.00}
    end

end
