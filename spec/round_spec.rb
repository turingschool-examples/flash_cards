require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  describe "#initialize" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    it 'exists' do
      expect(round.class).to be(Round)
    end

    it 'can show deck' do
      expect(round.deck).to be(deck)
    end

    it 'begins with an empty turns array' do
      expect(round.turns).to eq([])
    end

    it 'can show current card' do
      expect(round.current_card).to eq(card_1)
    end

    it 'can take a correct turn' do
      first_turn = round.take_turn("Juneau")
      expect(first_turn.class).to be(Turn)
      expect(first_turn.correct?).to be(true)
    end
  end

  describe "#turns and number correct" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    it 'can take correct and incorrect turns' do
      first_turn = round.take_turn("Juneau") # right answer
      expect(round.turns.last).to eq(first_turn)
      expect(round.number_correct).to be(1)
      expect(round.turns.last.feedback).to eq("Correct!")
      second_turn = round.take_turn("Venus") # wrong answer
      expect(round.turns.last).to eq(second_turn)
      expect(round.turns.count).to be(2)
      expect(round.number_correct).to be(1)
      expect(round.turns.last.feedback).to eq("Incorrect.")
    end

    it 'can show number correct' do
      expect(round.number_correct).to be(1)
      third_turn = round.take_turn("North north west") # right answer
      expect(round.number_correct).to be(2)
    end
  end

  describe "#changes current card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    it 'can show new current card after turn' do
      first_turn = round.take_turn("Juneau")
      expect(round.current_card).to eq(card_2)
    end
  end

  describe "#incorrect turn" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    it 'can take an incorrect turn (detailed)' do
      first_turn = round.take_turn("Juneau")
      expect(round.number_correct).to be(1)
      second_round = round.take_turn("Venus")
      expect(round.turns.count).to be(2)
      expect(round.turns.last.feedback).to eq("Incorrect.")
      expect(round.number_correct).to be(1)
    end

    it 'can give number correct by category' do
      expect(round.number_correct_by_category(:Geography)).to be(1)
      expect(round.number_correct_by_category(:STEM)).to be(0)
    end
  end

  describe "#percent correct" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    it 'can give percent correct and percent correct by category' do
      first_turn = round.take_turn("Juneau") # right answer
      second_round = round.take_turn("Venus") # wrong answer
      expect(round.percent_correct).to eq(50.0)
      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
      expect(round.current_card).to eq(card_3)
      third_round = round.take_turn("North north west")
      expect(round.percent_correct).to eq(200/3.to_f)
      expect(round.current_card).to be(nil)
    end

    it 'can give percent correct by category' do
      expect(round.percent_correct_by_category(:STEM)).to eq(50.0)
    end
  end
end
