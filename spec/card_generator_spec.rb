require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do

  it 'is a CardGenerator' do
    card_generator = CardGenerator.new("cards.txt")
    
    expect(card_generator).to be_a CardGenerator
  end

  it 'can return an array of cards' do 
    
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    expect(CardGenerator.new("cards.txt").cards).to eq cards

  end

end
