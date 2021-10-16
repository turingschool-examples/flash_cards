require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  describe '#initialize' do
    it 'exists' do
      card_1 = Card.new("What is the capital of Alaska?",
        "Juneau",
        :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
        "Mars",
        :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
        "North north west",
        :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      expect(round).to be_instance_of(Round)
    end

    it 'has a deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      expect(round.deck).to eq(deck)
    end

    it 'has turns' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.turns).to eq([])
    end
  end

  describe '#current_card' do
    it 'returns current_card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)
      expect(round.current_card).to eq(deck.cards[0])
    end
  end

  describe '#take_turn' do
    it 'creates a new_turn class' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)
      new_turn = Turn.new("Juneau", card_1)
      expect(new_turn.class).to eq(Turn)
    end
    it 'can take and check guess' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)
      new_turn = Turn.new("Juneau", card_1)
      expect(new_turn.correct?).to eq(true)
    end
    it 'returns turn in turns collection' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)
      new_turn = Turn.new("Juneau", card_1)
      expect(round.turns).to eq([])
    end
    it 'moves to next card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(round.current_card).to eq(deck.cards[0])
    end
    it 'takes another guess' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      next_turn = round.take_turn("Venus")
      expect(round.turns.count).to eq(2)
      expect(round.turns.last.feedback).to eq("Incorrect!")
      expect(round.number_correct).to eq(1)
    end
  end

  describe '#number_correct' do
    it 'counts correct guesses' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      next_turn = round.take_turn("Venus")
      expect(round.number_correct).to eq(1)
    end
  end

  describe '#number_correct_by_category' do
    it 'counts correct guess by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      next_turn = round.take_turn("Venus")
      expect(round.number_correct_by_category(:Geography)).to eq(1)
      expect(round.number_correct_by_category(:STEM)).to eq(0)
      expect(round.current_card).to eq(deck.cards[0])
    end
  end

  it 'returns percent correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    next_turn = round.take_turn("Venus")
    expect(round.percent_correct).to eq(50.0)
  end

  xit 'returns percent correct by category' do

  end
end
