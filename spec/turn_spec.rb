require './lib/card'
require './lib/turn'

# card = Card.new("Question1", "Answer1", :misc)
# turn = Turn.new("blah", card)
# turn.card
# turn.guess
# require 'pry'; binding.pry

RSpec.describe Turn do
  # card class exists and an instance can be made
  it 'exists' do
    card = Card.new("Question1", "Answer1", :misc)
    turn = Turn.new("I don't know", card)

    expect(turn).to be_a Turn
  end
  # recognizes "string" and "card.question" and compares they are the same
  it 'can have a right answer' do
    card = Card.new("Question1", "Answer1", :misc)
    turn = Turn.new("Answer1", card)

    turn.correct?
    expect(turn.correct).to be true
  end
  # recognizes "string and "card.question" and compares they are different
  it 'can have a wrong answer' do
    card = Card.new("Question1", "Answer1", :misc)
    turn = Turn.new("I don't know", card)

    turn.correct?
    expect(turn.correct).to be false
  end

  # turn.feedback returns correct response for right & wrong answers
  it 'returns correct responses' do
    card = Card.new("Question1", "Answer1", :misc)
    turn1 = Turn.new("Answer1", card)
    turn2 = Turn.new("I don't know", card)

# require 'pry'; binding.pry
    turn1.correct?
    turn1.feedback
    expect(turn1.response).to include "That's correct"
    turn2.correct?
    turn2.feedback
    expect(turn2.response).to include "Sorry, but no..."
  end
end
