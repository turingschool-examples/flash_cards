# turn_spec.rb
require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new('hi', 'bye', :whaatok)
    turn = Turn.new('this is my guess', card)

    expect(turn).not_to be_nil
  end

  it 'has a guess' do
    card = Card.new('hi', 'bye', :whaatok)
    turn = Turn.new('this is my guess', card)

    expect(turn.a_guess).not_to be_nil
  end

  it 'has a card' do
    card = Card.new('hi', 'bye', :whaatok)
    turn = Turn.new('this is my guess', card)

    expect(turn.card).not_to be_nil
  end

  it 'guesses correctly' do
    card = Card.new('one plus one', 'two', :whaatok)
    turn = Turn.new('two', card)

    expect(turn.correct?).to eq true
  end

  it 'guesses incorrectly' do
    card = Card.new('one plus one', 'two', :whaatok)
    turn = Turn.new('three', card)

    expect(turn.correct?).to eq false
  end
end
