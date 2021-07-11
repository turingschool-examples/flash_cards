require './lib/game'
require './lib/round'
require './lib/turn'

RSpec.describe Game do
  context 'initialize' do
    game = Game.new

    it 'exists' do
      expect(game).to be_a(Game)
    end

    it 'has a round' do
      expect(game.round).to be_a(Round)
    end

    it 'has a deck' do
      expect(game.deck).to be_a(Deck)
    end
  end

  context 'welcome' do
    game = Game.new

    it 'has a welcome message' do
      deck_size = game.deck_size
      expected = "Welcome! You're playing with #{deck_size} cards.\n-------------------------------------------------"

      expect(game.welcome_message).to eq(expected)
    end
  end

  context 'first question' do
    game = Game.new

    it 'can show a question' do
      deck_size = game.deck_size
      card = game.deck.cards.first

      expected = "This is card number #{1} out of #{deck_size}.\nQuestion: What is 5 + 5?"
      expect(game.current_question).to eq(expected)
    end
  end

  context 'category name formatting' do
    game = Game.new

    it 'can remove underscores' do
      expected = "Pop Culture"
      expect(game.format_category_name("Pop_culture")).to eq(expected)
    end
  end
end
