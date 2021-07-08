require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


RSpec.describe Round do
  context 'initalize objects' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    it 'exists' do
      expect(round).to be_a(Round)
    end

    it 'gets deck' do
      expect(round.deck).to eq(deck)
    end

    it 'gets empty turns' do
      expect(round.turns).to eq([])
    end

    it 'gets current card' do
      expect(round.current_card).to eq(card_1)
    end

    it 'can exist and check truth' do
      new_turn = round.take_turn("Juneau")

    # expect(new_turn.) #it wants a new turn with first card in cards set FFS
      expect(new_turn.class).to eq(Turn)
      expect(new_turn.correct?).to eq(true)
    end

    it 'checks number correct' do
      expect(round.number_correct).to eq(1)
    end


  end


end
