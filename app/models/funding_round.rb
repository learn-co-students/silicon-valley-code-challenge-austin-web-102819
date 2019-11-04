class FundingRound
    attr_accessor :type, :amount_invested
    attr_reader :startup, :venture_capitalist

    @@all = []

    def initialize(type, amount_invested, startup, venture_capitalist)
        @type = type
        @amount_invested = amount_invested
        @startup = startup
        @venture_capitalist = venture_capitalist

        @@all << self
    end

    def type
        @type
    end

    def investment
        @amount_invested
    end

    def self.all
        @@all
    end

    def startup
        @startup
    end

    def venture_capitalist
        @venture_capitalist
    end
end
