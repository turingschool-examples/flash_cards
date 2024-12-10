require_relative '../lib/card' # links the card.rb file to the turn_spec.rb file
require_relative '../lib/turn' # links the turn.rb file to the turn_spec.rb file
require 'rspec' # links the rspec gem to the turn_spec.rb file
require 'pry' # This is required to use Pry

# rspec spec/turn_spec.rb is the command to run the test

RSpec.describe Turn do # rspec syntax to describe the Turn class
  before(:each) do # establish a before hook meaning to run the code before each test
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    # creates a new instance of the Card class with the following parameters
    # passes arguments to the Card class to create a new instance of the Card class
    # :Geography is the category of the card
    # using : establishes a key:value pair or hybrid data structure
    @turn = Turn.new("Juneau", @card) # new instance of the Turn class with a string
    # this @card argument is to establish the card attribute of the Turn class
  end

  it 'exists' do # set up named 'exists'
    expect(@turn).to be_instance_of(Turn) # execute expect the turn instance to be an instance of the Turn class
  end

  it 'has a card' do # set up named 'has a card'
    expect(@turn.card).to eq(@card) # execute expect the card attribute of the turn instance to be equal to the card instance
  end

  it 'has a guess' do # set up named 'has a guess'
    expect(@turn.guess).to eq("Juneau") # execute expect the guess attribute of the turn instance to be equal to the string "Juneau"
  end

  it 'is correct' do # set up named 'is correct'
    expect(@turn.correct?).to be true # execute expect the correct? method of the turn instance to be true
  end

  it 'gives correct feedback' do # set up named 'gives correct feedback'
    expect(@turn.feedback).to eq("Correct!") # execute expect the feedback method of the turn instance to be equal to the string "Correct!"
  end
end