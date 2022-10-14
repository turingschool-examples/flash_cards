require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  let (:card_1) {Card.new("What is the capital of Alaska?", "Juneau", :Geography)}
  
  let (:card_2) {Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)}
  
  let (:card_3) {Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)}
  
  let (:cards) {[card_1, card_2, card_3]}
  let (:deck) {Deck.new(cards)}
  let (:round) {Round.new(deck)}
  
  describe 'Initialize' do
    it 'exists' do
      expect(round).to be_a(Round)
    end
    
    it 'has a deck' do
      expect(round.deck).to eq(deck)
    end
    
    it 'returns an array of turns' do
      expect(round.turns).to eq([])
    end
  end
  
  describe 'runs a round' do
    it 'lists the next card' do
      expect(round.current_card).to eq(card_1)
    end
    
    it 'takes an answer to a card' do
      new_turn = round.take_turn("Juneau")
      expect(new_turn.class).to eq(Turn)
      expect(new_turn.correct?).to eq(true)
      expect(round.turns).to eq([new_turn])
      expect(round.number_correct).to eq(1)
    end
    
  end

end
  