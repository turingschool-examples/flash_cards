# Requirements for testing the Turn class.
require 'rspec'
require './lib/turn'
require './lib/card'

# Rspec tests for Turn class.
RSpec.describe Turn do
  it 'exists' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)
    
    # Test whether the Turn class exists.
    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    # Test the Turn class guess.
    expect(turn.guess).to eq('Juneau')
  end

  it 'has a card object' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    # Test the Turn class attribute card object.
    expect(turn.card).to be(card)
  end

  it 'can check if guess is correct' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    wrong_turn = Turn.new('Anchorage', card)
    right_turn = Turn.new('Juneau', card)

    # Test correct? method for a wrong guess.
    expect(wrong_turn.correct?).to eq(false)

    # Test correct? method for a correct guess.
    expect(right_turn.correct?).to eq(true)
  end

  it 'can return feedback to the user' do
    card = Card.new('What is the captial of Alaska?', 'Juneau', :Geography)
    wrong_turn = Turn.new('Anchorage', card)
    right_turn = Turn.new('Juneau', card)

    # Test feedback method for a wrong guess.
    expect(wrong_turn.feedback).to eq('Incorrect.')

    # Test feedback method for a right guess.
    expect(right_turn.feedback).to eq('Correct!')
  end
end