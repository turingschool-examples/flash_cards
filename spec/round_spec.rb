require './lib/card'

require './lib/turn'

require './lib/deck'

require './lib/round'

RSpec.describe Round do
  describe '#initialize' do
    it 'exists' do
      round = Round.new('deck')

      expect(round).to be_instance_of(Round)
    end

    it 'has a deck' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.deck).to eq(deck)
    end

    it 'has turns empty by default' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.turns).to eq([])
    end

    it 'has correct turns empty by default' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.correct_turns).to eq([])
    end

  end

  describe '#current_card' do
    it 'returns correct current card' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?','North north west', :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      expect(round.current_card).to eq(card_1)

      round.take_turn("Juneau")
      
      expect(round.current_card).to eq(card_2)

      round.take_turn("Space Rocket")
      
      expect(round.current_card).to eq(card_3)
    end
  end

  describe '#take_turn' do
    it 'is an instance of the Turn class' do

      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      expect(round.take_turn("Juneau")).to be_instance_of(Turn)
    end

    it 'takes the turn inputted' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      expect(round.turns).to eq([new_turn])
    end

    it 'moves to the next card' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      expect(round.current_card).to eq(card_2)
    end

    it 'returns the amount of turns taken' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new(
        'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      expect(round.turns.count).to eq 1

      new_turn = round.take_turn('Space Stuff')

      expect(round.turns.count).to eq 2
    end

    it 'returns correct if last answer was correct' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      expect(round.turns.last.feedback).to eq('Correct!')
    end

    it 'returns incorrect if last answer was incorrect' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      new_turn = round.take_turn('Uranus')

      expect(round.turns.last.feedback).to eq('Incorrect.')
    end

    it 'adds to turns when a turn is taken' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      round.take_turn("Juneau")

      expect(round.turns.count).to eq(1)
    end

    it 'adds to correct_turns when a turn is taken' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      round.take_turn("Juneau")

      expect(round.correct_turns.count).to eq(1)
    end
  end

  describe '#number_correct' do
    it 'returns the amount of questions answered correctly' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau',:Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      expect(round.number_correct).to eq 1

      new_turn = round.take_turn('Space Rocket')

      expect(round.number_correct).to eq 1

      new_turn = round.take_turn('North north west')

      expect(round.number_correct).to eq 2
    end
  end

  describe '#number_correct_by_category' do
    it 'returns the amount of questions answered correctly in a specific category' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?','North north west', :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      expect(round.number_correct_by_category(:Geography)).to eq 1

      new_turn = round.take_turn('Mars')

      new_turn = round.take_turn('North north west')

      expect(round.number_correct_by_category(:STEM)).to eq 2
    end
  end

  describe '#percent_correct' do
    it 'returns the percentage of questions answered correctly' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new(
        'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
      )

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                        'North north west', :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      expect(round.percent_correct).to eq 100

      new_turn = round.take_turn('Uranus')

      expect(round.percent_correct).to eq 50.0
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns the percentage of questions answered correctly in a specific category' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?','North north west', :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      new_turn = round.take_turn('Uranus')

      expect(round.percent_correct_by_category(:Geography)).to eq 100.0

      expect(round.percent_correct_by_category(:STEM)).to eq 0

      new_turn = round.take_turn('North north west')

      expect(round.percent_correct_by_category(:STEM)).to eq 50
    end
  end

  describe '#card_number' do
    it 'returns the current card number' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)

      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?','North north west', :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.card_number).to eq 1

      new_turn = round.take_turn('Juneau')

      expect(round.card_number).to eq 2

      new_turn = round.take_turn('Uranus')

      expect(round.card_number).to eq 3
    end
  end
end
