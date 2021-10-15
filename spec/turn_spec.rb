# gather required files
require './lib/turn'
require './lib/card'

# test the Turn class
describe Turn do
  # prep all tests
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  # Check initialize class
  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  # check get guess methods
  it 'has a guess' do
    expect(@turn.guess).to eq("Juneau")
  end

  # check get card method
  it 'has a card' do
    expect(@turn.card).to eq(@card)
  end

  # test correct? method
  describe ' #correct?' do
    it 'correct? returns true' do
      expect(@turn.correct?).to eq(true)
    end
    it 'correct? returns false' do
      turn = Turn.new("Harrisburgh", @card)
      expect(turn.correct?).to eq(false)
    end
  end

  # test feedback method
  describe ' #feedback' do
    it 'feedback returns "Correct!"' do
      expect(@turn.feedback).to eq("Correct!")
    end
    it 'feedback returns "Incorrect."' do
      turn = Turn.new("Harrisburgh", @card)
      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end
