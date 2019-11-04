require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
microsoft = Startup.new("Microsoft", "Bill Gates", "Tech")
apple = Startup.new("Apple", "Steve Jobs", "Medical")
Startup.find_by_founder("Bill Gates")
Startup.all
Startup.domains

microsoft.pivot("Medical", "Microsoft")
microsoft.pivot("Tech", "Microsoft")


sb = VentureCapitalist.new("SoftBank", 2000000000)
chase = VentureCapitalist.new("Chase", 100000000)
sb.total_worth
VentureCapitalist.all
VentureCapitalist.tres_commas_club

# sign_contract(venture_capitalist, investment_type, amount_invested)
# fund1 = microsoft.sign_contract(sb, "Seed", 2000000000.0)
# func2 = microsoft.sign_contract(chase, "Angel", 1000000000.0)
# fund3 = apple.sign_contract(chase, "Series A", 1200000000.0)

# FundingRound.all
# fund1.startup
# fund1.venture_capitalist

# microsoft.num_funding_rounds #2
# apple.total_funds #3000000000
# (startup, investment_type, amount_invested)
chase.offer_contract(microsoft, "Angel", 2000000000.0)
chase.offer_contract(microsoft, "Seeds", 200.0)
chase.offer_contract(apple, "Seed", 100000.0)
chase.invested("Tech")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line


