require 'rspec'
require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  describe 'Iteration 1' do
    before :each do
      @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @turn = Turn.new("Juneau", @card)
    end

    it 'exists' do
      expect(@turn).to be_a(Turn)
    end

    it 'has attributes' do
      expect(@turn.guess).to eq("Juneau")
      expect(@turn.card).to eq(@card)
    end

    it 'can tell if answer is correct' do
      expect(@turn.correct?).to eq(true)
    end

    it 'can give feedback' do
      expect(@turn.feedback).to eq("Correct!")
    end

  end

end
