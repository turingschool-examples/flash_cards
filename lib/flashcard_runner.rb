require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card1 = Card.new("What is the powerhouse of the cell?", "Mitochondria", :STEM)
@card2 = Card.new("How many sweat glands does the average foot have?", "250000", :STEM)
@card3 = Card.new("How many original pokemon are there?", "151", :Video_Games)
@card1 = Card.new("Who are the winners of the 2019 World Series?", "Washington Nationals", :Sports)
