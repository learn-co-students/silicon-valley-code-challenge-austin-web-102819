require_relative 'funding_round'
class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []
    # @@funding_rounds = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def total_worth
        @total_worth
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|total_worth| total_worth.total_worth > 1000000000}
    end

    def offer_contract(startup, investment_type, amount_invested)
        funding_round = FundingRound.new(investment_type, amount_invested, startup, self)
        # @@funding_rounds << funding_round
        # funding_round
    end

    def funding_rounds
        FundingRound.all.select {|f| f if f.venture_capitalist == self}
        # binding.pry
    end

    def portfolio
        arr = []
        FundingRound.all.select {|f| arr << f.startup if f.venture_capitalist == self}
        arr.uniq
    end

    def biggest_investment
        # a.max { |a, b| a.length <=> b.length }
        arr = []
        arr = FundingRound.all.max {|f, f1| f.amount_invested <=> f1.amount_invested}
        
        # binding.pry
    end

    def invested(domain)
        sum = 0
        
        arr = FundingRound.all.select do |f|
            f.startup.domain == domain
        end

        arr.each do |s|
            sum += s.amount_invested
        end
        sum
    end
end
