require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/gamestart'

describe GameStart do

  describe '#initialize' do
    it 'creates instances of cards, decks and rounds' do 
      card_1 = Card.new("What is the capital of Spain?", "Madrid", :Geography)
      card_2 = Card.new("What actress has won the most Oscars?", "Katharine Hepburn", :Cinema)
      card_3 = Card.new("What is the colour of a Welsh poppy?", "Yellow", :Gardening)
      card_4 = Card.new("What is another name for a mountain ash tree?", "Rowan", :Gardening)
      card_5 = Card.new("What country is Prague in?", "Czech Republic", :Geography)
      card_6 = Card.new("Who directed the Lord of the Rings trilogy?", "Peter Jackson", :Cinema)
      cards  = [card_1, card_2, card_3, card_4, card_5, card_6]
      deck   = Deck.new(cards)
      round  = Round.new(deck)
  
      expect(card_1).is_a? Card
      expect(cards).to eq [card_1, card_2, card_3, card_4, card_5, card_6]
      expect(deck).is_a?  Deck
      expect(round).is_a? Round
    end
  end
end 