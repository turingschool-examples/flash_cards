require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'pry'

card   = [@question, @answer, @category]
card_1 = Card.new("What is Princess Leia's home planet?", "Alderaan", :Geography)
card_2 = Card.new("What planet are Ewoks from?", "Endor", :Geography)
card_3 = Card.new("Who was the first American woman in space?", "Sally Ride", :STEM)
card_4 = Card.new("What is the fastest land mammal?", "Cheetah", :STEM)
card_5 = Card.new("Who was the first man on the moon?", "Neil Armstrong", :STEM)
deck   = Deck.new([card_1, card_2, card_3, card_4, card_5])
round  = Round.new(deck)
