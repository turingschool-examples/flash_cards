require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/play_game'


def cards
  cards = []

  cards << card_1 = Card.new("What is 5 + 5?", "10", :STEM)
  cards << card_2 = Card.new("What is Rachel's favorite animal?", "red panda", :TuringStaff)
  cards << card_3 = Card.new("What is Mike's middle name?", "nobody knows", :TuringStaff)
  cards << card_3 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :PopCulture)
end

deck = Deck.new(cards)

user = PlayGame.new(@guess, deck)
user.start
# require 'pry'; binding.pry
