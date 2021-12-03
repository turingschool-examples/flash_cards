require 'pry'
require 'rspec'
require './lib/turn'
require './lib/card'




RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end
  it 'exists' do
    expect(@card).to be_instance_of(Card)
    expect(@turn).to be_instance_of(Turn)
  end

  it "turn has a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(@turn.guess).to eq('Juneau')
  end

  it "will return a boolean for correct?" do
    expect(@turn.correct?).to be(true)
  end

  it "will give feedback" do
    expect(@turn.feedback).to eq('Correct! The answer is Juneau.')
  end

  it "will recognize incorrect answers" do
    @turn = Turn.new("Sacramento", @card)
    expect(@turn.correct?).to be(false)
    expect(@turn.feedback).to eq('Incorrect. The answer is Juneau.')
  end

end
