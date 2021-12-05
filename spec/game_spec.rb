require './lib/game'
# require './lib/turn'
# # require './lib/card'
# require './lib/deck'
# require './lib/game'
# require './lib/card_generator'

RSpec.describe Game do
  it 'exists' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    deck = Deck.new(cards)
    round = Round.new(deck)
    game = Game.new(round)

    expect(game).to be_instance_of(Game)
  end
end
