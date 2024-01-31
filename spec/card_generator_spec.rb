# typed: ignore

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

RSpec.describe CardGenerator do
  before(:each) do
    @card_generator = CardGenerator.new('cards.txt')
  end

  it 'exists' do
    expect(@card_generator).to be_an_instance_of(CardGenerator)
  end

  it 'parses text file' do
    @card_generator.parse_file
    expect(@card_generator.file_text).to(satisfy { |file_text| !file_text.empty? })
  end

  it 'creates an array of cards of class Card' do
    @card_generator.parse_file
    @card_generator.push_cards
    expect(@card_generator.cards).to(satisfy { |cards| !cards.empty? })
    @card_generator.cards.each do |card|
      expect(card).to be_an_instance_of(Card)
    end
  end
end
