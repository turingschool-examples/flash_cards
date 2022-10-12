require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'

RSpec.describe Round do
  it 'the student has a deck of cards' do
    card_1 = Card.new(
      "What is the capital of Alaska?",
      "Juneau",
      :Geography
    )
    card_2 = Card.new(
      "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
      "Mars",
      :STEM
    )
    card_3 = Card.new(
      "Describe in words the exact direction that is 697.5° clockwise from due north?",
      "North north west",
      :STEM
    )
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
    expect(deck.cards[1]).to eq(card_2)
  end

  describe '#round' do
    it 'student plays a round' do
      card_1 = Card.new(
        "What is the capital of Alaska?",
        "Juneau",
        :Geography
      )
      card_2 = Card.new(
        "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
        "Mars",
        :STEM
      )
      card_3 = Card.new(
        "Describe in words the exact direction that is 697.5° clockwise from due north?",
        "North north west",
        :STEM
      )
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.deck).to eq(deck)
      expect(round.deck.cards[2].category).to eq(:STEM)
    end
  end

  describe '#turns' do
    it 'student takes a turn' do

    end
  end


end
