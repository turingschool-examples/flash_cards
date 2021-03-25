require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe do
  context '#initialize' do
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

  context '#start of round' do
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

  context '#new turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    it 'can take a turn where the answer is correct' do
      expect(new_turn.class).to eq(Turn)
      expect(new_turn.card).to eq(card_1)
      expect(new_turn.guess).to eq(card_1.answer)
      expect(new_turn.correct?).to eq(true)
    end

    it 'has a turn object in the array' do
      expect(round.turns).to eq([new_turn])
      expect(round.deck).to eq(deck)
    end

    it 'can give the number of correct answers' do
      expect(round.number_correct).to eq(1)
    end

    it 'can take a turn where the answer is false' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")

    expect(round.current_card).to eq(card_2)
    expect(round.number_correct).to eq(1)

    round.take_turn("Venus")

    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq("Incorrect.")
    expect(round.number_correct).to eq(1)
    end
  end

  context '#correct by category' do
    xit 'number correct in Geography' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      round.take_turn("Juneau")

      expect(round.current_card).to eq(card_2)
      expect(round.number_correct).to eq(1)

      round.take_turn("Venus")

      expect(round.turns.count).to eq(2)
      expect(round.number_correct).to eq(1)

      expect(round.number_correct_by_category(:Geography)).to eq(1)
    end
  end
end

# round.number_correct_by_category(:STEM)
# #=> 0
# round.percent_correct
# #=> 50.0
# round.percent_correct_by_category(:Geography)
# #=> 100.0
# round.current_card
# #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
