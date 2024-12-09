require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

RSpec.describe Round do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(round)
        
      expect(round).to be_instance_of(Round)
    end

    it 'shows round number' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        turn = Round.new(turn)
        
      expect(turn).to be_instance_of(Round)
    end

    it 'shows number correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        turn = Round.new(turn)
        expect(number_correct).to be(1)
    end

    it 'shows number correct by category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        turn = Round.new(turn)
        expect(number_correct_by_category).to be(1)
    end

    it 'shows percent correct by category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        turn = Round.new(turn)
        expect(percent_correct_by_category).to be(0)
    end
end