require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before :each do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  describe 'checking guess' do
    it 'takes a guess' do
      expect(@turn.guess).to eq("Juneau")
    end

    it 'checks; if guess is correct' do
      turn = Turn.new("Juneau", @card)
      expect(@turn.correct?).to eq(true)
    end
  end

end
