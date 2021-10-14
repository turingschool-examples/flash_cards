require 'lib/card'
require 'lib/turn'
require 'lib/deck'
require 'lib/round'
require 'lib/turn'

#initialize deck
card_1 = Card.new("What is 5 + 5?", 10, :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Lion", :Turing_staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Beiber", :Pop_culture)
deck = Deck.new([card_1, card_2, card_3, card_4])

#create game with deck
game = Game.new(deck)

#start game
game.start
# keep taking guesses until deck runs out
until round.deck.card.length == 0
  guess = gets.chomp
  game.take_guess(guess)
end
#end game
game.end_game
