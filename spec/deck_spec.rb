require_relative '../lib/card.rb'
require_relative '../lib/deck.rb'

RSpec.describe Deck do

  before :each do
    card1 = Card.new("1?", "Yes", :Math)
    card2 = Card.new("2?", "No", :History)
    card3 = Card.new("3?", "Maybe", :STEM)
    cards = [card1, card2, card3]

    @deck = Deck.new(cards)
  end

  it 'exists' do
    expect(@deck).to be_instance_of(Deck)
  end

  it 'can count cards' do
    expect(@deck.count).to eq(3)
  end

  it 'can select card categories' do
    expect(@deck.cards_in_category(:History)).to be_instance_of(Array)
  end

  it 'can count categorized cards' do
    math_cards = @deck.cards_in_category(:Math)
    expect(math_cards.count).to eq(1)
  end

end
