require './lib/turn'
require './lib/card'

RSpec.describe Card do
  before do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  describe '#initialize' do
    it 'should initialize an instance of Card' do
      expect(@turn).to be_instance_of(Turn)
    end
  end

  describe '@Card' do
    it 'has a card' do
      expect(@turn.card).to be_instance_of(Card)
    end
  end

  describe '@guess' do
    it 'has a guess' do
      expect(@turn.guess).to eq("Juneau")
    end
  end

  describe '#correct?' do
    it 'determines a correct answer' do
      expect(@turn.correct?).to be true

      @turn = Turn.new("Wrong", @card)

      expect(@turn.correct?).to be false
    end
  end

  describe '#feedback' do
    it 'returns the correct feeback' do
    expect(@turn.feedback).to eq("Correct!")

    @turn = Turn.new("Wrong", @card)

    expect(@turn.feedback).to eq("Incorrect.") 
    end
  end
end
