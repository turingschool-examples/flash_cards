# require './lib/turn'
require './lib/card'
require './lib/deck'


RSpec.describe Deck do

  let(:card_1) { Card.new("What is a blue?", "Color", :Basics)}
  let(:card_2) { Card.new("What is water?", "Liquid", :STEM)}
  let(:card_3) { Card.new("What is a bear?", "Animal", :Basics)}

  describe '#initialize' do
    it 'is a Deck' do
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck).to be_a Deck
    end
  end
end