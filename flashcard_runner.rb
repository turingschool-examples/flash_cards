require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'

card_1 = Card.new("What is a name that associates with a particular object?", "Variable", :Vocabulary)
card_2 = Card.new("Behavior an object can do is a?", "Method", :Vocabulary)
card_3 = Card.new("What is an ordered, integer-indexed collection of any object?", "Array", :Vocabulary)
card_4 = Card.new("What is my sons Favorite Movie?", "Iron Giant", :Trivia)

deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)


# round.start

loop do
  puts "START NEW GAME?"
  p "YES"
  p "NO"
  response = gets.chomp.upcase

  if response == "YES"
    round.start
  elsif response == "NO"
    break
  end
end
