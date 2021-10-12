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
end