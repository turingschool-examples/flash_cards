require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require 'pry'


RSpec.describe do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round).to be_instance_of(Round)
    end
    # it 'is stored in array' do
    #     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #     deck = Deck.new([card_1, card_2, card_3])
    #     round = Round.new(deck)

    #     expect().to eq()
    # end

    # it 'stores the current card'
end
