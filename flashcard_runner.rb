require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

#initialize deck
#manual method
# card_1 = Card.new("What is 5 + 5?", "10", :STEM)
# card_2 = Card.new("What is Rachel's favorite animal?", "Lion", :Turing_staff)
# card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_staff)
# card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_culture)
# deck = Deck.new([card_1, card_2, card_3, card_4])

#revised card generator method
puts 'Input location to cards file. Be sure to include the extension and path if not in root directory'
filename = gets.chomp
deck = Deck.new(CardGenerator.new(filename).cards)
#create game with deck
game = Game.new(deck)

#start game
game.start
# keep taking guesses until deck runs out
until game.round.deck.cards.length == 0
  game.ask
  guess = gets.chomp
  if guess == ''
    puts 'Did you mean to press enter? Please try another guess.'
    guess = gets.chomp
  end
  game.take_guess(guess)
end
#end game
game.end_game
