# typed: ignore

require './lib/card'
require './lib/turn'
require './lib/deck'

RSpec.describe Deck do
  before(:each) do
    @cards = [
      Card.new('Question 1', 'Answer 1', :category1),
      Card.new('Question 2', 'Answer 2', :category1),
      Card.new('Question 3', 'Answer 3', :category2)
    ]
    @deck = Deck.new(cards)
  end

  it 'exists' do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it 'cards property is an array' do
    expect(@deck.cards).to be_an_instance_of(Array)
  end

  it 'cards array items are Cards' do
    @deck.cards.each do |card|
      expect(card).to be_an_instance_of(Card)
    end
  end

  it 'counts number of cards in deck' do
    expect(@deck.count).to eq(3)
  end

  it 'counts number of cards in category' do
    expect(@deck.cards_in_category(:category1)).to eq(2)
  end
end
