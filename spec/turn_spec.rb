require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card_1 = Card.new("What is the meaning of life?", "42", "Philosophy")
    turn = Turn.new("42", card_1)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("42", "What's the meaning of life?")

    expect(turn.guess).to eq("42")
  end

  it 'returns the Card' do
    turn = Turn.new("42", "What's the meaning of life")

    expect(turn.card).to eq(Card)
  end

  xit 'grades the guess' do
    turn = Turn.new("42", "What's the meaning of life?")

    expect(turn.correct?).to be(true).or be(false)
  end

  it 'gives feedback' do
    turn = Turn.new("42", "What's the meaning of life?")

    expect(turn.feedback).to eq("Correct!").or eq("Incorrect.")
  end
end
