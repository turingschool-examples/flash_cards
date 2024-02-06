require './lib/game'

RSpec.describe Game do
  it 'exists' do
    game = Game.new
    expect(game).to be_instance_of(Game)
  end

  it 'can create a deck' do
    game = Game.new

    game.create_deck('./decks/math.txt')

    expect(game.deck).to be_instance_of(Deck)
  end

  it 'has no rounds by default' do
    game = Game.new

    expect(game.rounds).to be_empty
  end
end