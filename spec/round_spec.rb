require './lib/round'
require './lib/deck'
require './lib/card'

RSpec.describe Round do
    before(:each) do
        @deck = Deck.new([@card_1, @card_2, @card_3])

    end


end