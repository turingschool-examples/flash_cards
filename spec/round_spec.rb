require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    xit 'get a round' do
        card = Card.new(:question, :answer, :category)
        deck = Deck.new(card)
        round = Round.new(deck)
    
        expect(round).to be_instance_of(Round)
      end
    xit 'Is turns returning an empty array' do
        deck = ('Deck')
        round = Round.new(deck)

        expect(round.turns).to eq([])
    end
    # it 'check for category' do
    #     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #     deck = Deck.new([card])

    #     expect(deck.cards_in_category(:Geography)).to eq([card])
    # end

end