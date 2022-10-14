require './lib/card'
require './lib/turn'

RSpec.describe Turn do 
  before (:each) do
      @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @turn_1 = Turn.new("Juneau", @card_1)
      @card_4 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      @turn_4 = Turn.new("Saturn", @card_4)
  end

  describe '#initialize' do
      it 'exists and has readable attributes' do
          expect(@turn_1).to be_an_instance_of(Turn)
          expect(@turn_1.card).to eq(@card_1)
          expect(@turn_1.guess).to eq("Juneau")
      end
  end

  describe '#correct?' do
      it 'can return a boolean for the answer' do
          expect(@turn_1.correct?).to eq(true)
          expect(@turn_1.feedback).to eq("Correct!")
      end
  end

  describe '#next turn' do
      it 'can check a different card' do
          expect(@turn_4.card).to eq(@card_4)
          expect(@turn_4.guess).to eq("Saturn")
          expect(@turn_4.correct?).to eq(false)
          expect(@turn_4.feedback).to eq("Incorrect.")
      end
  end
    
end