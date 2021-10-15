require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", 10, :STEM)
card_2 = Card.new("What is Seth's favorite color?", "Orange", "Student")
card_3 = Card.new("What is the capital of Virginia?", "Richmond", :Geography)
card_4 = Card.new("What is the capital of the US?", "Washington DC", :Geography)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)
guess = gets.chomp
puts "Welcome! You're playing with 4 cards"
puts "-" * 50
puts "This is card number 1 out of 4."
puts round.deck.card_1.question
gets = guess
def take_turn(guess)
  @turns << Turn.new(guess, current_card)
  deck.cards.rotate!(1)
  #this_turn
end
