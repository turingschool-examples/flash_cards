require './lib/turn'
require './lib/card'
require 'pry'
describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    second_card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    second_turn = Turn.new("Saturn", card)
    expect(turn).to be_instance_of(Turn)
    expect(second_turn).to be_instance_of(Turn)
  end
  it 'corresponds with a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    second_card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    second_turn = Turn.new("Saturn", card)
    expect(turn.card).to eq(card)
    expect(second_turn.card).to eq(card)
  end
  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    second_card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    second_turn = Turn.new("Saturn", card)
    expect(turn.guess).to eq("Juneau")
    expect(second_turn.guess).to eq("Saturn")
  end
  it 'checks the answer' do
    card = Card.new("What is the capital of Alaska?","Juneau",:Geography)
    turn = Turn.new("Juneau", card)
    second_card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    second_turn = Turn.new("Saturn", card)
    expect(turn.correct?).to eq(true)
    expect(second_turn.correct?).to eq(false)
  end
  it 'provides feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    second_card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    second_turn = Turn.new("Saturn", card)
    expect(turn.feedback).to eq("Correct!")
    expect(second_turn.feedback).to eq("Incorrect!")
  end
end
