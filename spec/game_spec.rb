require './lib/game'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Game do
    it 'exists' do
        game = Game.new
        expect(game).to be_instance_of(Game)
    end

    it 'can create a deck' do
        game = Game.new

        game.create_deck("./decks/math.txt")

        expect(game.deck).to be_instance_of(Deck)
    end
end