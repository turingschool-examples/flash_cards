require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'

RSpec.describe Deck do
  let (:card_1) {Card.new("What is the capital of Alaska?", "Juneau", :Geography)}
  
  let (:card_2) {Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)}
  
  let (:card_3) {Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)}
  
  let (:cards) {[card_1, card_2, card_3]}
  let (:deck) {Deck.new(cards)}

describe 'deck functions' do
  
    it 'exists' do
      expect(deck).to be_a(Deck)
    end
    
    it 'contains cards' do
      expect(deck.cards).to eq([card_1, card_2, card_3])
    end
    
    it 'can return the number of cards in the deck' do
      expect(deck.count).to eq(3)
    end
    
    it 'can return an array of the cards in a given category' do
      expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
      expect(deck.cards_in_category(:Geography)).to eq([card_1])
      expect(deck.cards_in_category('Pop Culture')).to eq([])
    end
  end
end
