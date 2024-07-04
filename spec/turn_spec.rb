require './lib/turn'
require 'pry'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Janeau", @card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Janeau", @card)
    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Janeau", @card)
    expect(turn.guess).to eq("Janeau")
  end

  it 'has a correct guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Janeau", @card)
    expect(turn.correct?).to eq true
  end

  it "gives feedback for correct answer" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", @card) 

    expect(turn.feedback).to eq("Correct!")
  end

  it "gives feedback for incorrect answer" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("", @card) 

    expect(turn.feedback).to eq("Incorrect.")
  end

end

