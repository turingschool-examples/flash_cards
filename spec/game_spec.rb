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

  context 'question asking' do
    game = Game.new

    it 'can show a question' do
      deck_size = game.deck_size
      card = game.deck.cards.first

      expected = "This is card number #{1} out of #{deck_size}.\nQuestion: What is 5 + 5?"
      expect(game.current_question).to eq(expected)
    end

    it 'can update current question' do
      deck_size = game.deck_size
      game.round.take_turn("Junuea")

      expected = "This is card number #{2} out of #{deck_size}.\nQuestion: What is Rachel's favorite animal?"
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

  context 'ending correct percentages' do
    game = Game.new
    game.round.take_turn("10")
    game.round.take_turn("red panda")
    game.round.take_turn("chicken")
    game.round.take_turn("Justin Bieber")
    game.round.take_turn("that's messed up")
    game.round.take_turn("no")

    it 'has total percent correct output' do
      deck_size = game.deck_size
      part_1 = "****** Game over! ******"
      part_2 = "You had 4 correct guesses out of #{deck_size} "
      part_3 = "for a total score of 67%."

      expected = "#{part_1}\n#{part_2 + part_3}"
    end

    it 'has percentages per category output' do
      expected = [
        "Stem - 100% correct.",
        "Turing Staff - 50% correct.",
        "Pop Culture - 100% correct.",
        "Computer Science - 0% correct."
      ]
      expect(game.category_correct_percentages).to eq(expected)
    end
  end
end
