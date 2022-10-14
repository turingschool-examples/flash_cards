require './lib/card_generator'
require './lib/card'
require 'rspec'
require 'pry' 

describe CardGenerator do
  it 'exists' do
    card_generator = CardGenerator.new('cards.txt')

    expect(card_generator).to be_instance_of(CardGenerator)
  end

  it 'makes deck of cards from list data' do
    card_generator = CardGenerator.new('cards.txt')
    list_cards = card_generator.cards

    expect(list_cards).to be_instance_of(Array)
    expect(list_cards[0]).to be_instance_of(Card)
    expect(list_cards[0].answer).to be_instance_of(Integer)
    expect(list_cards[1].answer).to be_instance_of(String)
    expect(list_cards[0].answer).to eq(10)
  end

  it 'utilizes raw line feed data once converted to strings' do
    card_generator = CardGenerator.new('cards.txt')
    list_cards = card_generator.cards

    expect(list_cards[0].answer).to be_instance_of(Integer)
    expect(list_cards[1].answer).to be_instance_of(String)
    expect(list_cards[0].answer).to eq(10)
  end
end
