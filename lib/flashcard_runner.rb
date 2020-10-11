require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require "pry"

def start
  @card_1 = Card.new("What is 5 + 5?", "10", :STEM)
  @card_2 = Card.new("What is Rachel's favorite animal?", "not a panda", :Turing_Staff)
  @card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
  @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
  @cards = [@card_1, @card_2, @card_3, @card_4]
  @deck = Deck.new(@cards)
  @round = Round.new(@deck)
end

puts start

puts "Welcome! You're playing with #{@cards.count} cards.
-------------------------------------------------"

until @round.turns.count == @cards.count
  puts "This is card number #{@round.turns.length + 1} out of #{@cards.count}."
  puts "Question: #{@round.current_card.question}"

  print "Guess > "
  new_turn = @round.take_turn($stdin.gets.chomp)

  new_turn.feedback
end
# binding.pry
