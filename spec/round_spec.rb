require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  it 'makes a round' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck_array = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck_array)
     # require 'pry'; binding.pry
    # changed deck name for easier parsing / troubleshooting
  expect(round.deck_arg).to eq(deck_array)
  # require 'pry'; binding.pry
  end
end



describe Round do
  it 'returns empty array for round.turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck_array = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck_array)
    expect(round.turns).to eq([])
  end
end

describe Round do
  it 'returns the first card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck_array = Deck.new(cards)
    round = Round.new(deck_array)
    # require 'pry'; binding.pry
    expect(round.current_card).to eq(card_1)
  end

  describe Round do
    it 'checks if turn counter works' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck_array = Deck.new(cards)
      round = Round.new(deck_array)
      expect(round.turns_counter).to eq(0)
      new_turn = round.take_turn("Juneau")
       # require 'pry'; binding.pry
      expect(new_turn.class).to eq(Turn)
      expect(round.turns_counter).to eq(1)
    end
  end

  describe Round do
    it 'returns number of correct guesses' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck_array = Deck.new(cards)
      round = Round.new(deck_array)
      new_turn = round.take_turn("Juneau")
      # require 'pry'; binding.pry
      expect(round.number_correct).to eq(1)
    end
  end

  describe Round do
    it 'category is correct amount' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck_array = Deck.new(cards)
      round = Round.new(deck_array)
      new_turn = round.take_turn("Juneau")
      new_turn = round.take_turn("Venuss")
      # require 'pry'; binding.pry
      expect(round.number_correct_by_category(:STEM)).to eq(0)
      expect(round.percent_correct).to eq(50.0)
      #expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    end
  end


end
