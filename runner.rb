require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

#create sopme cards
card_1 = ("Name the main Charecter in FLCL.", "Naota", :ANIME)
card_2 = ("Name the robot in FLCL.", "Kanti", :ANIME)
card_3 = ("Name the protagonist in FLCL.", "Haruko", :ANIME)

#put those cards into a deck
card_stack = [card_1,card_2,card_3]
