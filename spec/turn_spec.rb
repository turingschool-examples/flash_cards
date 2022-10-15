require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  # test it exists
  it 'exists' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    new_turn = Turn.new('Juneau', card_1)

    expect(new_turn).to be_instance_of(Turn)
  end

  # test it has a card
  it 'has a card' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    new_turn = Turn.new(card_1, 'Juneau')

    expect(new_turn.card).to eq(card_1)
  end
  # it has a guess
  it 'has a guess' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    new_turn = Turn.new(card_1, 'Juneau')

    expect(new_turn.guess).to eq('Juneau')
  end
  # it checks if correct
  it 'checks if correct' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    new_turn = Turn.new(card_1, 'Juneau')

    expect(new_turn.correct?).to eq(true)

    new_turn = Turn.new(card_1, 'juneau')
    expect(new_turn.correct?).to eq(true)

    new_turn = Turn.new(card_1, 'juneau   ')
    expect(new_turn.correct?).to eq(true)

    new_turn = Turn.new(card_1, '    juneau   ')
    expect(new_turn.correct?).to eq(true)

    new_turn = Turn.new(card_1, '    juneau')
    expect(new_turn.correct?).to eq(true)

    new_turn = Turn.new(card_1, 'Sitka')
    expect(new_turn.correct?).to eq(false)
  end

  it 'accpets different card answer types' do
    card_1 = Card.new('What is 5 + 5?', 10, :STEM)
    new_turn = Turn.new(card_1, 10)
    expect(new_turn.correct?).to eq(true)

    new_turn = Turn.new(card_1, 11)
    expect(new_turn.correct?).to eq(false)
  end

  it 'accepts different data types' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    new_turn = Turn.new(card_1, 42)
    expect(new_turn.correct?).to eq(false)

    new_turn = Turn.new(card_1, true)
    expect(new_turn.correct?).to eq(false)

    new_turn = Turn.new(card_1, 43.233)
    expect(new_turn.correct?).to eq(false)

    new_turn = Turn.new(card_1, [2, 3, 4])
    expect(new_turn.correct?).to eq(false)
  end

  it 'accepts different cards and answers' do
    card_1 = Card.new('What is 5 + 5?', 10, :STEM)
    new_turn = Turn.new(card_1, 10.0)
    expect(new_turn.correct?).to eq(true)
  end

  # it provides feedback
  it 'provides feedback' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    new_turn = Turn.new(card_1, 'Juneau')

    expect(new_turn.feedback).to eq('Correct!')
    new_turn = Turn.new(card_1, 'Sitka')
    expect(new_turn.feedback).to eq('Incorrect.')
    new_turn = Turn.new(card_1, '    juneau')
    expect(new_turn.feedback).to eq('Correct!')

    card_1 = Card.new('What is 5 + 5?', 10, :STEM)
    new_turn = Turn.new(card_1, 10)
    expect(new_turn.feedback).to eq('Correct!')
  end
end
