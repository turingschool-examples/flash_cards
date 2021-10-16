require "rspec"
require "./lib/card"
require "./lib/turn"

describe Turn do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Saturn", @card_2)
  end

  it 'exists' do
    expect(@turn_1).to be_an_instance_of(Turn)
  end

  it 'attributes' do
    expect(@turn_1.card).to eq(@card_1)
    expect(@turn_1.guess).to eq("Juneau")
  end

  it 'correct?' do
    expect(@turn_1.correct?).to eq(true)
    expect(@turn_2.correct?).to eq(false)
  end

  it 'feedback' do
    expect(@turn_1.feedback).to eq("Correct!")
    expect(@turn_2.feedback).to eq("Incorrect! the correct answer is: #{@card_2.answer}")
  end
end
