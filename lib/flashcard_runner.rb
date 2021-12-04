require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
def start
  card_1 = Card.new("What is 5 + 5?", "10", :STEM)
  card_2 = Card.new("What is Rachel's favorite animal?", "Bonobo", "Turing Staff")
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)

  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-------------------------------------------------"
  while round.count <= deck.count do
    puts "This is card number #{round.count} of #{deck.count}"
    puts "#{round.current_card.question}"
    guess = gets.chomp
    round.take_turn(guess)
    puts "#{round.turns.last.card.answer}"
    round.turns.last.feedback
    
  end
end
start()
