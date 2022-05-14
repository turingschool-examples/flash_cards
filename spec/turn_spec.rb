require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  describe Card do
    it 'can create a Card' do
      expect(@card).to be_instance_of(Card)
      expect(@card.question).to eq("What is the capital of Alaska?")
      expect(@card.answer).to eq("Juneau")
      expect(@card.category).to eq(:Geography)
    end
  end

  describe Turn do
    it 'exists' do
      expect(@turn).to be_instance_of(Turn)
      expect(@turn.card.question).to eq("What is the capital of Alaska?")
      expect(@turn.card.answer).to eq("Juneau")
      expect(@turn.card.category).to eq(:Geography)
    end
  end

  describe '@card' do
    it 'stores a @card' do
      expect(@turn.card).to be_instance_of(Card)
      expect(@turn.card.question).to eq("What is the capital of Alaska?")
      expect(@turn.card.answer).to eq("Juneau")
      expect(@turn.card.category).to eq(:Geography)
    end
  end

  describe "@guess" do
    it 'stores a guess' do
      expect(@turn.guess).to eq("Juneau")
    end
  end

  describe "#correct?" do
    it 'tells you if you were correct' do
      expect(@turn.correct?).to eq(true)
    end
  end

  describe "#feedback" do
    it 'gives you feedback' do
      expect(@turn.feedback).to eq("Correct!")
    end
  end

end

RSpec.describe Turn do
  # code that runs @turn.rb and lays the foundation for the tests that follow
  # @card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
  # @turn = Turn.new("Saturn", @card)

  before(:each) do
    @card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn = Turn.new("Saturn", @card)
  end

  describe Turn do
    it 'exists' do
      expect(@turn).to be_instance_of(Turn)
      expect(@turn.card.question).to eq("Which planet is closest to the sun?")
      expect(@turn.card.answer).to eq("Mercury")
      expect(@turn.card.category).to eq(:STEM)
    end
  end

  describe Card do
    it 'stores a @card' do
      expect(@turn.card).to be_instance_of(Card)
      expect(@turn.card.question).to eq("Which planet is closest to the sun?")
      expect(@turn.card.answer).to eq("Mercury")
      expect(@turn.card.category).to eq(:STEM)
    end
  end

  describe "#guess" do
    it 'stores a guess' do
      expect(@turn.guess).to eq("Saturn")
    end
  end

  describe "#correct?" do
    it 'tells you if you were correct' do
      expect(@turn.correct?).to eq(false)
    end
  end

  describe "#feedback" do
    it 'gives you feedback' do
      expect(@turn.feedback).to eq("Incorrect.")
    end
  end
end
