require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
 
cards = CardGenerator.new("cards.txt").cards
deck = Deck.new(cards)
round = Round.new(deck)
round.start

    # def setup 
    #     # @card_1 = Card.new("What is 5 + 5?", "10", :Mathematics)
    #     # @card_2 = Card.new("What is Rachel's favorite animal?", "red panda", "Turing Staff")
    #     # @card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
    #     # @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
    #     @cards = CardGenerator.new("cards.txt")
    #     require 'pry' ; binding.pry
    #     @deck = Deck.new(@cards)
    #     @round = Round.new(@deck)
    # end 