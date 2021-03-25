require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/play'

RSpec.describe Play do

  it 'exists' do
    cards = [Card.new("What is the capital of Alaska?", "Juneau", :Geography)]
    deck = Deck.new(cards)
    round = Round.new(deck)
    play = Play.new(round)

    expect(play).to be_instance_of(Play)
  end

  describe '#start ' do
    it 'prints welcome message' do
      cards = [Card.new("What is the capital of Alaska?", "Juneau", :Geography)]
      deck = Deck.new(cards)
      round = Round.new(deck)
      play = Play.new(round)

      expect{play.start}.to output("Welcome! You're playing with #{round.deck.count} cards.\n-------------------------------------------------\n").to_stdout
    end
  end

  describe '#card_review' do
    # SKIPPING TESTING FOR THIS BASED ON ITERATION 4 DESCRIPTION
  end

  describe '#unique_categories' do
    it 'returns array of unique categories' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
      card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
      card_4 = Card.new("What year did the Titanic movie come out?", "1997", :Media)
      cards = [card_1, card_2, card_3, card_4]
      deck = Deck.new(cards)
      round = Round.new(deck)
      play = Play.new(round)

      expect(play.unique_categories).to eq([:Geography, :STEM, :Media])
    end
  end

  describe '#score_by_category' do
    it 'returns a string with category and score' do
      cards = [Card.new("What is the capital of Alaska?", "Juneau", :Geography)]
      deck = Deck.new(cards)
      round = Round.new(deck)
      turn = round.take_turn("Juneau")
      play = Play.new(round)

      expect{play.score_by_category}.to output("Geography - 100.0% correct\n").to_stdout
    end
  end

end
