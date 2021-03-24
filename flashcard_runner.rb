require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/play_game'


def cards
  cards = []

  cards << card_1 = Card.new("What is 5 + 5?", "10", :Math)
  cards << card_2 = Card.new("What is Rachel's favorite animal?", "panda", :idk)
  cards << card_3 = Card.new("What is Mike's middle name?", "nobody knows", :idk)
  cards << card_3 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :idk)
end

deck_1 = Deck.new(cards)
round = Round.new(deck_1)
game = Turn.new(round, @guess)
user = PlayGame.new(@guess)
user.start
# require 'pry'; binding.pry
