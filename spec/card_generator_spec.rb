require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do

  it 'is a CardGenerator' do
    card_generator = CardGenerator.new("cards.txt")
    
    expect(card_generator).to be_a CardGenerator
  end

  it 'can return an array of cards with appropriate attributes' do 
    
    generated_cards = CardGenerator.new("cards.txt")

    expect(generated_cards.cards[0].question).to eq "Who won the 2022 Nobel Prize for Literature?"
    expect(generated_cards.cards[2].category).to eq :STEM
  end

end
