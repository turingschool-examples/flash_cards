require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'creates a turn' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'contains a guess' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.player_guess).to eq("Juneau")
  end

  it 'has correct guess' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq true
  end

  it 'has incorrect guess' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new("Junu", card)

    expect(turn.correct?).to eq false
  end

  it 'tell player they are correct' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new("Juneau", card)

    turn.correct?

    expect(turn.feedback).to eq 'You are correct!'
  end

  it 'tell player they are incorrect' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new("Junu", card)

    turn.correct?

    expect(turn.feedback).to eq 'You are incorrect!'
  end

end