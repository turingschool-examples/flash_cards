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

  end