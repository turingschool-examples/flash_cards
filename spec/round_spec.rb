require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  context 'initialize' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    it 'exists' do
      expect(round).to be_instance_of(Round)
    end

    it 'has a deck' do
      expect(round.deck).to eq(deck)
    end
  end

  context 'start of round' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    it 'can have no turns' do
      expect(round.turns).to eq([])
    end

    it 'can show the current card' do
      expect(round.current_card).to eq(card_1)
    end
  end

  context 'new turn with correct guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    it 'creates a new turn' do
      expect(new_turn.class).to eq(Turn)
    end

    it 'can match the guess to the answer' do
      expect(new_turn.guess).to eq(card_1.answer)
    end

    it 'can tell if the guess is correct' do
      expect(new_turn.correct?).to eq(true)
    end

    it 'can put the new turn in the turns array' do
      expect(round.turns).to eq([new_turn])
    end

    it 'has a new current card' do
      expect(round.current_card).to eq(card_2)
    end

    it 'can give the number of correct answers' do
      expect(round.number_correct).to eq(1)
    end
  end

  context 'new turn with an Incorrect guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    it 'can count amount of turns taken' do
      expect(round.turns.count).to eq(2)
    end

    it 'can give accurate feedback' do
      expect(round.turns.last.feedback).to eq("Incorrect.")
    end

    it 'can give amount correct after taking two turns' do
      expect(round.number_correct).to eq(1)
    end
  end

  context 'correct by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    it 'can total correct answers in Geography category' do
      expect(round.number_correct_by_category(:Geography)).to eq(1)
    end

    it 'can total correct answers in :STEM category' do
      expect(round.number_correct_by_category(:STEM)).to eq(0)
    end
  end

  context 'correct percentages' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    it 'can find percent correct overall' do
      expect(round.percent_correct).to eq(50.0)
    end

    it 'can find percent correct by category' do
      expect(round.percent_correct_by_category(:Geography)).to eq 100.0
    end

    it 'only has one card left' do
      expect(round.current_card).to eq(card_3)
    end

    it 'can find the index and add one' do
      expect(round.card_num).to eq(3)
    end
  end
end
