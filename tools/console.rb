require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

facebook = Startup.new('facebook', 'mark', 'www.facebook.com')
linkedin = Startup.new('linkedin', 'reid', 'www.linkedin.com')
uber = Startup.new('uber', 'garrett', 'www.uber.com')

venture1 = VentureCapitalist.new('venture1', 999999999.00)
venture2 = VentureCapitalist.new('venture2', 10000000000.00)

round1 = FundingRound.new(uber, venture1, 'Pre-Seed', 100.00)
round2 = FundingRound.new(uber, venture2, 'Angel', 200.00)

facebook.pivot('www.fb.com', 'fb')
facebook.sign_contract(venture1, 'Seed', 999.00)
facebook.sign_contract(venture2, 'Series A', 1000000001.00)
puts "\n *** Number of funding rounds for facebook is expected: 2, got: #{facebook.num_funding_rounds}"
puts "\n *** otal investments in facebook is expected: 1000001000, got: #{facebook.total_funds}"
puts "\n *** All investors in facebook is expected: 2 in total, got: #{facebook.investors}"
puts "\n *** Big investors in facebook is expected: venture2, got: #{facebook.big_investors}"
puts "\n *** All startups is expected: 3 in total, got: #{Startup.all}"
puts "\n *** Startup founded by mark is expected: fb, got: #{Startup.find_by_founder('mark').name}"
puts "\n *** All domains is expected: 4 in total, got: #{Startup.domains}"

venture1.offer_contract(linkedin, 'Series B', 888.00)
puts "\n *** All funding rounds by venture1 is expected: uber, facebook, linkedin, got: #{venture1.funding_rounds}"
puts "\n *** Portfolio of venture2 is expected: uber, facebook, got: #{venture2.portfolio}"
puts "\n *** Venture1's biggest investment expected: 999.0, got: #{venture1.biggest_investment.investment}"
puts "\n *** Venture1's investment in facebook domain www.facebook.com expected: 0, got: #{venture1.invested('www.facebook.com')}"
puts "\n *** Venture1's investment in facebook domain www.fb.com expected: 999, got: #{venture1.invested('www.fb.com')}"
puts "\n *** All ventures expected: 2 in total, got: #{VentureCapitalist.all}"
puts "\n *** All rich ventures expected: venture2, got: #{VentureCapitalist.tres_commas_club}"

binding.pry
0 #leave this here to ensure binding.pry isn't the last line