require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
microsoft = Startup.new("Microsoft", "Bill Gates", "technology")
apple = Startup.new("Apple", "Steve Jobs", "technology")
steve = VentureCapitalist.new("Steve Jobs", 100000000000)
bill = VentureCapitalist.new("Bill Gates", 100000)
microsoft.sign_contract(bill, "Angel", 100000)
apple.sign_contract(steve, "Angel", 100000)
microsoft.sign_contract(steve, "Angel", 10000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line