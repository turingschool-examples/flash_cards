require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/game'

card_1 = Card.new("What is 5 + 5", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "cat", :Turing_Staff)
card_3 = Card.new("What is Mikes's middle name?", "nobody knows", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
game = Game.new(round)
game.start
# game.draw_card

# puts "Welcome! you're playing with #{round.deck.count} cards
#  ----------------------------------------------------
#  This is card #{round.turns.count+1} out of #{round.deck.count}
#  Question: #{round.current_card.question}"
#
# new_turn=round.take_turn(gets.chomp)
#
# if new_turn == turns.correct?
#   puts "new_turn
#   Correct!"
# end
# def start
#   puts "Welcome! you're playing with #{current_card} cards"
# end
