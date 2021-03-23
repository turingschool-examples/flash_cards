require './lib/turn'
require './lib/card'


RSpec.describe Turn do

  before do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn_correct = Turn.new("Juneau", @card)
    @turn_incorrect = Turn.new("Saturn", @card)
  end

  it 'exists' do
    expect(@turn_correct).to be_instance_of(Turn)
  end

  it 'has a guess' do
    expect(@turn_correct.guess).to eq("Juneau")
  end

  it 'evaluates correctness' do
    expect(@turn_correct.correct?).to eq(true)
    expect(@turn_incorrect.correct?).to eq(false)
  end

  it 'provides feedback' do
    expect(@turn_correct.feedback).to eq("Correct!")
    expect(@turn_incorrect.feedback).to eq("Incorrect.")
  end

end
