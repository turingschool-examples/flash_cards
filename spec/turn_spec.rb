  require 'rspec'
  require './lib/card'
  require './lib/turn'

  RSpec.describe Turn do
    before(:each) do
      @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @turn = Turn.new("Juneau", @card)
      # require 'pry'; binding.pry
    end
    it 'exists' do
      expect(@turn).to be_a(Turn)
    end
    it 'can have a card' do
      expect(@turn.card).to be_a(Card)
    end
    it 'can have a guess' do
      expect(@turn.guess).to eq(@card.answer)
    end
    it '#correct?' do
      #Expecting the output of the correct? method to return true *truthy*
      expect(@turn.correct?).to be_truthy
    end
    it 'whether right or not' do
      expect(@turn.feedback).to eq("Correct!")
    end
  end
