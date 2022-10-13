require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

RSpec.describe Round do

  let(:card_1) { Card.new("What is a blue?", "Color", :Basics)}
  let(:card_2) { Card.new("What is water?", "Liquid", :STEM)}
  let(:card_3) { Card.new("What is a bear?", "Animal", :Basics)}

  describe '#initialize' do
    it 'is a round class' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round).to be_a Round
    end
  end
end