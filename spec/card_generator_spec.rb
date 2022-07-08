require './lib/card_generator'
require './lib/card'
filename = "cards.txt"
describe CardGenerator do
    it 'transforms text file into cards' do
      
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      card_4 = Card.new("What is the capital of Arizona?", "Phoenix", :Geography)
      card_5 = Card.new("How much wood can a wood chuck chuck?", "Not much", :Random)
      cards = CardGenerator.new(filename).cards
      expect(cards).to eq([card_1, card_2, card_3, card_4, card_5])
    end
end