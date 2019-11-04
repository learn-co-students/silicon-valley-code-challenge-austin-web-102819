require_relative "funding_round.rb"
require_relative "venture_capitalist.rb"

class Startup

    attr_reader :founder, :domain
    attr_accessor :name

    @@all = []
    @@domains = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        @@domains << domain
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
        @@domains << domain if !@@domains.include?(domain)
    end

    def sign_contract(venture_cap, type, investment)
        #creates a new funding round and associates it with that startup and venture capitalist
        new_funding_round = FundingRound.new(self, venture_cap, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.count{|round| round.startup == self}
    end

    def total_funds
        # Returns the total sum of investments that the startup has gotten
        total = 0
        FundingRound.all.each{|round| total += round.investment if round.startup == self}
        total
    end

    def investors
        # Returns a unique array of all the venture capitalists that have invested in this company
        all_venture_caps = []
        FundingRound.all.each{|round| all_venture_caps.push(round.venture_cap) if round.startup == self}
        all_venture_caps
    end

    def big_investors
        # Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
        all_big_investors = []
        FundingRound.all.each{|round| all_big_investors.push(round.venture_cap) if round.startup == self && VentureCapitalist.tres_commas_club.include?(round.venture_cap)}
        all_big_investors
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find{|startup| startup.founder == founder}
    end

    def self.domains
        @@domains
    end

end