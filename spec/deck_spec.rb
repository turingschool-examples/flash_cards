require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'

RSpec.configure do |config|
      config.formatter = :documentation
end

RSpec.describe Deck do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    turn_2 = Turn.new("Mars", card_2)
    deck = Deck.new([card_1, card_2])

    expect(deck).to be_instance_of(Deck)
  end

  it 'has cards' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    turn_2 = Turn.new("Mars", card_2)
    deck = Deck.new([card_1, card_2])

    expect(deck.count).to eq (2)
  end

  it 'has cards in a category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    turn_2 = Turn.new("Mars", card_2)
    deck = Deck.new([card_1, card_2])

    expect(deck.cards_in_category(:STEM)).to be eq card_2
  end

end

