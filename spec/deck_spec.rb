require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  # Uses before method to repeat code below for each it method
  before(:each) do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?','North north west', :STEM)
    @cards = [card_1, card_2, card_3]
    @deck = Deck.new(@cards)
  end
  it 'exists' do
    expect(@deck).to be_instance_of(Deck)
  end
  it 'displays cards to user' do
    expect(@deck.cards).to eq(@cards)
  end
  it 'displays count of cards in deck' do
    expect(@deck.count).to eq (3)
  end
  it 'shows cards in correct category' do
    @deck.cards_in_category(:STEM)

    expect(@deck.categorized_cards).to eq([@deck.cards[1], @deck.cards[2]])

    @deck.cards_in_category(:Geography)

    expect(@deck.categorized_cards).to eq([@deck.cards[0]])

    @deck.cards_in_category("Pop Culture")

    expect(@deck.categorized_cards).to eq([])
  end
end
