require './lib/card'
require './lib/turn'
require './lib/deck'

RSpec.describe Turn do
  it 'exist' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards  = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it 'counts the deck' do
    expect(@deck.count).to eq(3)
  end

  it 'has STEM category' do
    expect(deck.card_in_category).to eq([card_2, card_3])
  end

  it 'has geography caregory' do
    expect(deck.card_in_category).to eq([card_1])
  end

  it 'has pop culture category' do
    expect(deck.card_in_category).to eq([])
  end

end
