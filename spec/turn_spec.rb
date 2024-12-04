require 'pry'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end 

    it 'exists' do 
      expect(@turn).to be_a(Turn)
    end

    it 'holds a card object' do # redundant, unnecessary?
      expect(@turn.card).to eq(@card) 
    end

    describe 'instance methods' do 

        it 'can check if a turns guess is correct' do 
            expect(@turn.correct?).to eq(true)
        end
    end
end
