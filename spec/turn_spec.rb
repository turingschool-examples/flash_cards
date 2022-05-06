require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  before :each do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'exists & has attributes' do
    expect(@turn).to be_a(Turn)
    expect(@turn.guess).to eq('Juneau')
    expect(@turn.card).to eq(@card)
  end

  it 'can tell if a guess is correct' do
    expect(@turn.correct?).to eq(true)
  end

  it 'gives feedback on correct answers' do
    expect(@turn.feedback).to eq('Correct!')
  end

  describe 'incorrect guesses' do
    before :each do
      @card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      @turn = Turn.new("Saturn", @card)
    end

    it 'can tell if a guess is incorrect' do
      expect(@turn.guess).to eq('Saturn')
      expect(@turn.correct?).to eq(false)
      expect(@turn.feedback).to eq('Incorrect.')
    end
  end
end
