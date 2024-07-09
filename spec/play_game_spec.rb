require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './play_game'


RSpec.configure do |config|
    config.formatter = :documentation 
    end

describe PlayGame do
  
  describe '#create_deck' do
  it 'creates a deck with 4 cards at a time' do
    game = PlayGame.new
    deck = game.create_deck
    expect(deck.cards.size).to eq(4)
  end
end

describe '#shuffle_cards' do
    it 'shuffles and selects 4 cards' do
      game = PlayGame.new
      cards = game.create_deck.cards
      shuffled_cards = game.shuffle_cards(cards)
      expect(shuffled_cards.size).to eq(4)
      expect(shuffled_cards).to all(be_a(Card))
    end
  end
end