require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    # test it exists
    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
  
      expect(turn).to be_instance_of(Turn)
      require 'pry'; binding.pry
    end

    # test it returns guess
    # test it returns card
    # test it resturns boolean?
    # test it returns "Correct!" or "Incorrect." based on
    # whether the guess was correct or not.
    # test it provides feedback

    

  end