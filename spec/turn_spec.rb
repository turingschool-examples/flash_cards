require './lib/turn'
require './lib/card'


RSpec.describe Turn do
  it 'card exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card).to be_instance_of(Card)
  end

  it 'turn exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
  expect(turn).to be_instance_of(Turn)
  end

  it 'turn maintains the card object in the turn class' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(card.question).to eq("What is the capital of Alaska?")
  end

  it 'turn has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq("Juneau")
  end

  it 'turn can detect a correct answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to be true
  end

  it 'turn can give positive feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq('Correct!')
  end

  it 'turn can detect an incorrect answer' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.correct?).to be false
  end

  it 'turn can give negative feedback' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.feedback).to eq('Incorrect!')
  end


end

  # it 'maintains the card object in the turn class' do
  #   expect(tuard).to include(@question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography)
  # end
