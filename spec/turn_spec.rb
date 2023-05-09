require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    
        expect(card).to be_instance_of(Card)
      end
      
end