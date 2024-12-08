require './lib/deck'
require './lib/card'
require './lib/turn'
RSpec.describe Deck do
    it 'exists' do
      deck = Deck.new(deck)
  
      expect(deck).to be_instance_of(Deck)
    end

    it 'add_card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     
        
        expect(@cards).to include(card_1, card_2, card_3)
    end
end