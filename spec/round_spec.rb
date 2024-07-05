require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card).to be_instance_of(Card)
    end
end