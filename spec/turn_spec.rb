require './lib/turn'
require './lib/card'


RSpec.describe Turn do
    before(:each) do
      @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    end
  
    it 'is initialized with a guess and a card' do
      turn = Turn.new("Juneau", @card)
      expect(turn).to be_instance_of(Turn)
      expect(turn.guess).to eq("Juneau")
      expect(turn.card).to eq(@card)
    end
  
    it 'returns the guess' do
      turn = Turn.new("Juneau", @card)
      expect(turn.guess).to eq("Juneau")
    end
  
    it 'returns the card' do
      turn = Turn.new("Juneau", @card)
      expect(turn.card).to eq(@card)
    end

    it 'returns true when the guess is correct' do
      turn = Turn.new("Juneau", @card)
      expect(turn.correct?).to be true
    end

    it 'returns false when the guess is incorrect' do
      turn = Turn.new("Anchorage", @card)
      expect(turn.correct?).to be false
    end

    it 'gives feedback "Correct!" when the guess is correct' do
      turn = Turn.new("Juneau", @card)
      expect(turn.feedback).to eq("Correct!")
    end
  
    it 'gives feedback "Incorrect." when the guess is incorrect' do
      turn = Turn.new("Anchorage", @card)
      expect(turn.feedback).to eq("Incorrect.")
    end
  end