require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before :each do
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    @card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?','North north west', :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  it 'exists' do
    expect(@deck).to be_a(Deck)
  end

  it 'can show a collection of all cards' do
    expect(@deck.cards).to eq(@cards)
  end

  it 'can count the number of cards in the deck' do
    expect(@deck.count).to eq(@cards.length)
  end

  it 'can show a collection of cards in certain categories' do
    expect(@deck.cards_in_category(:STEM)).to eq(@cards.select { |card| card.category == :STEM })
    expect(@deck.cards_in_category(:Geography)).to eq(@cards.select { |card| card.category == :Geography })
    expect(@deck.cards_in_category('Pop Culture')).to eq(@cards.select { |card| card.category == 'Pop Culture' })
  end
end
