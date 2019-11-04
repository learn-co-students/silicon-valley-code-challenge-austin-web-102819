require_relative 'funding_round'
class Startup

    attr_accessor :startup, :founder
    attr_reader :domain
    
    @@domains = []
    @@all = []
    @@funding_rounds = []

    def initialize(startup, founder, domain)
        @startup = startup
        @founder = founder
        @domain = domain
        @@domains << domain if !@@domains.include?(domain)

        @@all << self
    end

    def pivot(domain, startup)
        @domain = domain
        @@domains << domain if !@@domains.include?(domain)
        @startup = startup
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find do |f| 
            f.founder == founder
        end
    end

    def self.domains
        @@domains
    end

    # initialize(type, amount_invested, startup, venture_capitalist)
    def sign_contract(venture_capitalist, investment_type, amount_invested)
        funding_round = FundingRound.new(investment_type, amount_invested, self, venture_capitalist)
        # @@funding_rounds << funding_round
        # funding_round
    end

    def num_funding_rounds
        FundingRound.all.count {|f| f.startup == self}
    end

    def total_funds
        arr_funds = []
        FundingRound.all.select {|f| arr_funds << f.amount_invested if f.startup == self}
        
        arr_funds.reduce(0) {|sum, amount_invested| sum + amount_invested}
    end

    def investors
        arr = []
        
        FundingRound.all.map do |f|
            arr << f.venture_capitalist if f.startup == self
        end
        arr.uniq
    end

    def big_investors
        arr = []
        arr_big_investors = VentureCapitalist.tres_commas_club
        
        FundingRound.all.map do |f|
            if f.startup == self
                # if !arr_big_investors.nil
                    arr << f.venture_capitalist if arr_big_investors.include?(f.venture_capitalist)
                # end 
            end
        end
        arr.uniq
    end

    # def self.funding_rounds
    #     @@funding_rounds
    # end

    private

    def domain=(domain)
        @domain = domain
    end
end
