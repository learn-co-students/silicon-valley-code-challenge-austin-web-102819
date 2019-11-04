class Startup
    attr_accessor :name
    attr_reader :founder, :domain
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
        @@domains << domain
    end
    def self.all
        @@all
    end
    def self.find_by_founder(founder)
        @@all.find { |k| k.founder == founder}
    end
    def self.domains
        @@domains
    end
    def sign_contract(capitalist, type, investment)
        FundingRound.new(self, capitalist, type, investment)
    end
    def num_funding_rounds
        FundingRound.all.select{ |fund| fund.startup.name == self.name}.count
    end
    def total_funds
        arr = FundingRound.all.select{ |fund| fund.startup.name == self.name}
        arr.reduce(0) {|sum, num| sum += num.investment}
    end
    def investors
        total = []
        arr = FundingRound.all.select{ |fund| fund.startup.name == self.name}
        arr.each do |fun|
                total << fun.capitalist.name
        end
        total
    end
    def big_investors
        total = []
        arr = FundingRound.all.select{ |fund| fund.startup.name == self.name}
        arr.each do |fun|
            if VentureCapitalist.tres_commas_club.find {|cap| cap == fun.capitalist}
            total << fun.capitalist.name
            end
        end
        total
    end
end
