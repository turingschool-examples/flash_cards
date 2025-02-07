require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    it 'get a round' do
        card = Card.new(:question, :answer, :category)
        deck = Deck.new(card)
        round = Round.new(deck)
    
        expect(round).to be_instance_of(Round)
      end
    it 'Is turns returning an empty array' do
        deck = ('Deck')
        round = Round.new(deck)

        expect(round.turns).to eq([])
    end
    # it 'check for count' do
    #     card_1 = Card.new(:question, :answer, :category)
    #     card_2 = Card.new(:question, :answer, :category)
    #     card_3 = Card.new(:question, :answer, :category)
    #     deck = Deck.new([card_1,card_2,card_3])

    #     expect(deck.count).to eq(3) 
    # end
    # it 'check for category' do
    #     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #     deck = Deck.new([card])

    #     expect(deck.cards_in_category(:Geography)).to eq([card])
    # end

end