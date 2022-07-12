require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = ("cards.txt")
    card_generator = CardGenerator.new(filename)
  end 
  it 'reads files' do 
    filename = ("cards.txt")
    cards = CardGenerator.new(filename).cards
    expect(CardGenerator.new(filename).cards).to all(be_a Card)
  end 
end 