require './lib/turn'
require './lib/card'
require 'rspec'
require 'pry'


RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(card).to be_instance_of(Card)
    expect(turn).to be_instance_of(Turn)
  end

  it "turn has a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq('Juneau')
  end

  it "will return a boolean for correct?" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to be(true)
  end

  it "will give feedback" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq('Correct!')
  end

  it "will recognize incorrect answers" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Venus", card)
    expect(turn.correct?).to be(false)
    expect(turn.feedback).to eq('Incorrect')
  end

end
