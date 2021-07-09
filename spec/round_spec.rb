require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do 
  context "initialize" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    
    it 'exists' do
      expect(round.deck).to eq(deck)
      expect(round.turns).to eq([])
    end

    it 'takes a turn' do
      expect(round.current_card).to eq(card_1)

      new_turn = round.take_turn("Juneau")

      expect(new_turn.class).to eq Turn 
      expect(new_turn.correct?).to eq true 
    end
  end

  context 'turn testing' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    it 'takes more turns' do
      expect(round.turns).to eq([])
      expect(round.current_card).to eq(card_1)
    end

    it 'keeps track of your score' do 
      turn1 = round.take_turn("Juneau")
      
      expect(turn1).to be_a Turn
      expect(turn1.correct?).to eq true
      expect(round.turns).to eq ([turn1])
      expect(round.number_correct).to eq(1)
      expect(round.current_card).to eq(card_2)
    end

    it 'takes another turn' do
      expect(round.take_turn("Venus")).to be_a Turn
      expect(round.turns.count).to eq 2
    end

    it 'gives feedback' do
      expect(round.turns.last.feedback).to eq("Incorrect.")
      expect(round.number_correct).to eq(1)
    end

    it 'is correct by category' do 
      expect(round.number_correct_by_category(:Geography)).to eq(1)
      expect(round.number_correct_by_category(:STEM)).to eq(0)
    end

    it 'calculates percent correct' do 
      expect(round.percent_correct).to eq(50.0)
      expect(round.percent_correct_by_category(:Geography)).to eq 100.0
      expect(round.current_card).to eq(card_3)
    end
  end
end