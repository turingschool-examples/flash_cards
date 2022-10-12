require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

RSpec.describe Round do

  describe '#initialize' do
    it 'exists' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
      card_3 = Card.new("Which German philosopher greatly influenced Karl Marx?", "Hegel", :Philosophy)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round).to be_instance_of(Round)
      expect(round.current_card).to eq(card_1)
    end
  end






end
