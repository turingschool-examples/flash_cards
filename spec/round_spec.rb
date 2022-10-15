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
    
    it 'can create a turn' do
      new_turn = round.take_turn("Juneau")
      expect(new_turn.class).to eq(Turn)
      expect(new_turn.correct?).to eq(true)
      expect(round.turns).to eq([new_turn])
    end
    
    it 'can take a turn' do
      round.take_turn("Juneau")
      expect(round.number_correct).to eq(1)
      expect(round.current_card).to eq(card_2)
    end
    
    it 'can take multiple turns' do
      round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.turns.count).to eq(2)
      expect(round.turns.last.feedback).to eq("Incorrect!")
      expect(round.number_correct).to eq(1)
      expect(round.current_card).to eq(card_3)
    end
    
    it 'can determine the correct number by category' do
      round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.number_correct_by_category(:Geography)).to eq(1)
      expect(round.number_correct_by_category(:STEM)).to eq(0)
    end
    
    it 'can determine the percentage correct' do
      
      round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.percent_correct).to eq(50.0)
    end
    
    it 'can determine the turns in a given category' do
      round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.cards_in_category(:Geography)).to eq(1)
    end
    
    it 'can determine the percentage correct by category' do
      round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
      expect(round.current_card).to eq(card_3)
    end
  end

end
  