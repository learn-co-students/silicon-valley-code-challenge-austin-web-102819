class VentureCapitalist
    attr_accessor :name, :worth
    @@all = []
    def initialize(name, worth)
        @name = name
        @worth = worth
        @@all << self
    end
    def self.all
        @@all
    end
    def self.tres_commas_club
        @@all.select { |k| k.worth >= 1000000000 }
    end
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end
    def funding_rounds
        FundingRound.all.select{ |fund| fund.capitalist.name == self.name}
    end
    def portfolio
        total = []
        arr = FundingRound.all.select{ |fund| fund.capitalist.name == self.name}
        arr.each do |fun|
                total << fun.startup.name
        end
        total
    end
    def biggest_investment
        total = 0
        arr = FundingRound.all.select{ |fund| fund.capitalist.name == self.name}
        arr.each do |fun|
            if fun.investment > total
                total = fun.investment
            end
        end
        total
    end
    def self.invested(domain)
        total = 0
        arr = FundingRound.all.select{ |fund| fund.startup.domain == domain}
        arr.each do |fun|
                total += fun.investment
        end
        total
    end
end
