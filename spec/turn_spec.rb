require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  describe 'correct guess test' do
    before(:each) do
      @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @turn = Turn.new("Juneau", @card)
    end

    it 'exists & has attributes' do
      expect(@turn).to be_a(Turn)
      expect(@turn.card).to eq(@card)
      expect(@turn.guess).to eq("Juneau")
      expect(@turn.correct?).to be(true)
      expect(@turn.feedback).to eq('Correct!')
    end
  end

  describe 'incorrect guess' do
    before(:each) do
      @card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      @turn = Turn.new("Saturn", @card)

      it 'exists & has attributes' do
        expect(@turn).to be_a(Turn)
        expect(@new_turn.class).to e(Turn)
        expect(@new_turn.correct).to eq(true)
        expect(@turn.card).to eq(@card)
        expect(@turn.guess).to eq("Saturn")
        expect(@turn.correct?).to be(false)
        expect(@turn.feedback).to eq('Incorrect.')
        expect(@new_turn.class).to e(Turn)
        expect(@new_turn.correct).to eq(true)
      end
    end
  end
end
