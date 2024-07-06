require './lib/card.rb'
require './lib/card_generator.rb'
require 'rspec'

RSpec.describe CardGenerator do
  before(:each) do
    @card_generator = CardGenerator.new("./lib/card.txt")
  end

  it 'exsist' do
    expect(@card_generator).to be_instance_of(CardGenerator)
    
  end

  it 'generates a list of card objects' do
    expect(@card_generator.cards.class).to eq Array
    expect(@card_generator.cards[3]).to be_instance_of(Card)
  end

end