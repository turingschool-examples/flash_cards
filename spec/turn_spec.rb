require 'rspec' #links the rspec gem to the turn_spec.rb file
require 'pry' # This is required to use Pry
require_relative '../lib/turn' #links the turn.rb file to the turn_spec.rb file
require_relative '../lib/card' #links the card.rb file to the turn_spec.rb file

RSpec.describe Turn do #rspec syntax to describe the Turn class
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #creates a new instance of the Card class with the following parameters
    @turn = Turn.new("Juneau", @card)
    #creates a new instance of the Turn class with the following parameters
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    binding.pry # Add this line to inspect the state
    expect(@turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    expect(@turn.card).to eq(@card)
  end

  it 'can check if the guess is correct' do
    expect(@turn.correct?).to be true
  end

  it 'gives feedback' do
    expect(@turn.feedback).to eq("Correct!")
  end

  context 'when the guess is incorrect' do
    before(:each) do
      @turn = Turn.new("Anchorage", @card)
    end

    it 'can check if the guess is incorrect' do
      expect(@turn.correct?).to be false
    end

    it 'gives feedback' do
      expect(@turn.feedback).to eq("Incorrect.")
    end
  end
end