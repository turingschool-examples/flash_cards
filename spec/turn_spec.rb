require 'rspec'
require './lib/turn'

RSpec.describe Turn do
  describe 'Iteration 1' do
    before :each do
      @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @turn = Turn.new("Juneau", @card)
    end

    it 'exists' do

    end

    it 'has attributes' do

    end

  end

end
