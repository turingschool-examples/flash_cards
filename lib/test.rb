require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

# run with ruby lib/test.rb

    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'East', :STEM)
    
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Mars')
    round.take_turn('East')

    puts round.percent_correct
