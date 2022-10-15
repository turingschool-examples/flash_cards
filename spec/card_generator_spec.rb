require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    

    expect(cards).to be_instance_of(CardGenerator)
  end

  it 'creates a card' do 
    filename = "cards.txt"
    generated_card = CardGenerator.new(filename).cards

    card_1 = Card.new("What is 5 + 5?", "10", "STEM")
    # require 'pry'; binding.pry

    expect(generated_card.question).to eq(card_1.question)


    
  end
end
